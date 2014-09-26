package com.cicc.gbo.message.listener;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cicc.gaf.logger.Logger;
import com.cicc.gaf.logger.LoggerFactory;
import com.cicc.gaf.tools.JsonParseException;
import com.cicc.gaf.tools.JsonUtil;
import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;
import com.cicc.gbo.core.model.TransactionEntity;
import com.cicc.gbo.message.model.IncomingMessage;
import com.cicc.gbo.message.parser.FidessaFixParser;
import com.cicc.gbo.message.producer.TpsMessageProducer;
import com.cicc.gbo.message.service.IncomingMessageService;
import com.cicc.gbo.oms.model.Execution;
import com.cicc.gbo.oms.model.Order;
import com.cicc.gbo.tps.component.TransactionProcessService;

/**
 * @author Guo Hua
 * @version 下午3:51:51 2014年9月11日 
 */
@Component
public class GmoMessageListener implements MessageListener {
	
	private static Logger logger = LoggerFactory.getLogger(GmoMessageListener.class);
	
	String brokerUrl;
	FidessaFixParser fidessaFixParser;
	TransactionProcessService transactionProcessService;
	TpsMessageProducer tpsMessageProducer;
	@Autowired
	IncomingMessageService incomingMessageService;

	
	public String getBrokerUrl() {
		return brokerUrl;
	}

	public void setBrokerUrl(String brokerUrl) {
		this.brokerUrl = brokerUrl;
	}

	public FidessaFixParser getFidessaFixParser() {
		return fidessaFixParser;
	}

	public void setFidessaFixParser(FidessaFixParser fidessaFixParser) {
		this.fidessaFixParser = fidessaFixParser;
	}

	public TransactionProcessService getTransactionProcessService() {
		return transactionProcessService;
	}

	public void setTransactionProcessService(
			TransactionProcessService transactionProcessService) {
		this.transactionProcessService = transactionProcessService;
	}

	public TpsMessageProducer getTpsMessageProducer() {
		return tpsMessageProducer;
	}

	public void setTpsMessageProducer(TpsMessageProducer tpsMessageProducer) {
		this.tpsMessageProducer = tpsMessageProducer;
	}

	@Override
	public void onMessage(Message message) {
		try {
			if (message instanceof TextMessage) {
				String messageDestinationName = message.getJMSDestination().toString();
				
				TextMessage tm = (TextMessage) message;
				String msg = tm.getText();
				logger.info("Received message '{}' at {}.", msg, new Date());
				persistenceIncomingMessage(message);
				
				ProcessObject processObject = new ProcessObject();
				if(messageDestinationName.indexOf("order")>= 0){
					processObject = processGmoOrderMessage(msg);
				}
				else if(messageDestinationName.indexOf("execution")>= 0){
					processObject = processGmoExecutionMessage(msg);
				}
				else{
					processObject = processGmoUnknownMessage(msg);
				}
				if(processObject == null)
					return ;
				
				List<? extends TransactionBaseEntity> result = processObject
						.getResultTransactionList();

				if (CollectionUtils.isNotEmpty(result)) {
					if (result != null) {
						String json = JsonUtil.toJson(result);
						// pass to downstream
						tpsMessageProducer.sendMessage(json);
					}
				}
				
			}
		} catch (JMSException | JsonParseException e) {
			logger.info(e.getMessage(), e);
		}
	}
	
	private void persistenceIncomingMessage(Message message) throws JMSException {
		//persistence the incoming message to database
		TextMessage tm = (TextMessage) message;
		String msg = tm.getText();
		String messageServerMessageId = message.getJMSMessageID();
		Long messageServerMessageTime = message.getJMSTimestamp();
		String messageDestinationName = message.getJMSDestination().toString();
		IncomingMessage incomingMessage = new IncomingMessage();
		incomingMessage.setIncomingSystemId("Fidessa");
		incomingMessage.setIncomingSystemName("Fidessa");
		incomingMessage.setSystemId("TPS");
		incomingMessage.setSystemName("TPS");
		incomingMessage.setMessageLob(message.toString());
		incomingMessage.setMessageContent(msg);
		incomingMessage.setMessageServerUrl(this.brokerUrl);
		incomingMessage.setMessageDestinationName(messageDestinationName);
		incomingMessage.setMessageServerMessageId(messageServerMessageId);
		incomingMessage.setMessageServerMessageTime(new Date(messageServerMessageTime));
		incomingMessageService.create(incomingMessage);
		
	}
	
	private ProcessObject processGmoOrderMessage(String message) {
		Order order = new Order();
		if (fidessaFixParser.parseFidessaMessage(message, order)) {
			List<TransactionEntity> transactionList = new ArrayList<TransactionEntity>();
			
			transactionList.add(order);
			
	
			ProcessObject processObject = new ProcessObject();
			processObject.setProcessTransactionList(transactionList);
			processObject.setInvalidTransactionList(transactionList);
			transactionProcessService.process(processObject);
			logger.info("Processed message '{}' with result{}.", message);
			return processObject;
		} else {
			return null;
		}
	}

	private ProcessObject processGmoExecutionMessage(String message) {
		Execution execution = new Execution();
		if (fidessaFixParser.parseFidessaMessage(message, execution)) {
			List<TransactionEntity> transactionList = new ArrayList<TransactionEntity>();
			transactionList.add(execution);
			
			ProcessObject processObject = new ProcessObject();
			processObject.setProcessTransactionList(transactionList);
			processObject.setInvalidTransactionList(transactionList);
			transactionProcessService.process(processObject);
			logger.info("Processed message '{}' with result{}.", message);
			
			return processObject;
		} else {
			return null;
		}
	}

	
	private ProcessObject processGmoUnknownMessage(String msg) {
		ProcessObject processObject = new ProcessObject();
		return processObject;
	}
}

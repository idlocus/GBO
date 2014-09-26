package com.cicc.gbo.message.producer;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Component;

import com.cicc.gaf.logger.Logger;
import com.cicc.gaf.logger.LoggerFactory;

/**
 * @author Guo Hua
 * @version 下午7:07:16 2014年9月14日 
 */
@Component
public class TpsMessageProducer {
	
	private static Logger logger = LoggerFactory.getLogger(TpsMessageProducer.class);
	
	private JmsTemplate template = null;

	public JmsTemplate getTemplate() {
		return template;
	}
	public void setTemplate(JmsTemplate template) {
		this.template = template;
	}



	public void sendMessage(String msg) throws JMSException {
		
		final String text = msg;

		template.send(new MessageCreator() {
			public Message createMessage(Session session) throws JMSException {
				TextMessage message = session.createTextMessage(text);
				logger.info("Sending message: " + text);
				return message;
			}
		});

	}
}

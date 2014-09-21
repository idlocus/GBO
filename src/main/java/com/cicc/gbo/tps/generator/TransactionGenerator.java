package com.cicc.gbo.tps.generator;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.cicc.gaf.logger.Logger;
import com.cicc.gaf.logger.LoggerFactory;
import com.cicc.gbo.core.component.ProcessObjectService;
import com.cicc.gbo.core.generator.AbstractGenerator;
import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;
import com.cicc.gbo.core.service.AuditableBaseService;
import com.cicc.gbo.core.shared.LogMessageConstants;
import com.cicc.gbo.core.shared.RecordRemarkConstants;
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.tps.model.Trade;
import com.cicc.gbo.tps.model.TradeTemplate;
import com.cicc.gbo.tps.model.TransactionEntity;

/**
 * @author Guo Hua
 * @version 上午10:35:12 2014年9月15日 
 */
public class TransactionGenerator extends AbstractGenerator {
	
	private static final Logger logger = LoggerFactory.getLogger(TransactionGenerator.class);
	
	@Autowired
	AuditableBaseService auditableBaseService;
	@Autowired
	ProcessObjectService processObjectService;

	@Override
	public boolean generate(ProcessObject processObject) {
		List<? extends TransactionBaseEntity> processTransactionList = processObject.getProcessTransactionList();
		if(CollectionUtils.isNotEmpty(processTransactionList)){
			for (TransactionBaseEntity processTransaction : processTransactionList) {
				if (processTransaction.getRecordStatus().equalsIgnoreCase(RecordStatus.ACTIVE.name())) {
					if (processTransaction instanceof TransactionEntity) {
						this.generate((TransactionEntity) processTransaction, processObject);
					} else {
						processTransaction.setRecordStatus(RecordStatus.ERROR.name());
						processTransaction.setRecordRemark(RecordRemarkConstants.ERROR_GENERATE_TRANSACTION_TYPE);
					}
				}
			}
		}
		return true;
	}

	public boolean generate(TransactionEntity transactionEntity, ProcessObject processObject) {
		if (transactionEntity.getTemplateGroupId() != null) {
			List<TradeTemplate> templates = auditableBaseService.readAll(TradeTemplate.class);
			List<Trade> tradeList = new ArrayList<Trade>();
			
			try {
				for(TradeTemplate template : templates) {
					Trade trade = new Trade();
					BeanUtils.copyProperties(trade, transactionEntity);
					BeanUtils.copyProperties(trade, template);
					tradeList.add(trade);
				}
				processObjectService.addResultTransaction(processObject, tradeList);
			} catch (IllegalAccessException | InvocationTargetException e) {
				transactionEntity.setRecordStatus(RecordStatus.ERROR.name());
				transactionEntity.setRecordRemark(RecordRemarkConstants.ERROR_GENERATE_TRADES);
				logger.error(LogMessageConstants.ERROR_TRANSACTION_GENERATOR, e);
				return false;
			} 
		}
		return true;
	}
	
}

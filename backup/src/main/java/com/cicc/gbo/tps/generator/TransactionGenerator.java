package com.cicc.gbo.tps.generator;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.cicc.gbo.core.component.ProcessObjectService;
import com.cicc.gbo.core.exception.BusinessErrorCode;
import com.cicc.gbo.core.exception.BusinessException;
import com.cicc.gbo.core.generator.AbstractGenerator;
import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.service.AuditableBaseService;
import com.cicc.gbo.core.utils.BeanUtils;
import com.cicc.gbo.tps.model.Trade;
import com.cicc.gbo.tps.model.TradeTemplate;
import com.cicc.gbo.tps.model.TransactionEntity;

/**
 * @author Guo Hua
 * @version 上午10:35:12 2014年9月15日 
 */
public class TransactionGenerator extends AbstractGenerator {
		
	@Autowired
	AuditableBaseService auditableBaseService;
	@Autowired
	ProcessObjectService processObjectService;
	
	@Override
	public boolean generate(TransactionEntity processTransaction, 
			ProcessObject processObject) {
		if (processTransaction.getTemplateGroupId() != null) {
			List<TradeTemplate> templates = auditableBaseService.readAllTemplateByGroupId(TradeTemplate.class, processTransaction.getTemplateGroupId());
			List<Trade> tradeList = new ArrayList<Trade>();
			
			try {
				for(TradeTemplate template : templates) {
					Trade trade = new Trade();
					BeanUtils.copyProperties(processTransaction, trade);
					BeanUtils.copyProperties(template, trade);
					trade.setEntityId(null);
					trade.setOriginalRecordId(processTransaction.getInternalRecordId());
					tradeList.add(trade);
				}
				processObjectService.addResultTransaction(processObject, tradeList);
				auditableBaseService.updateAndCreateAll(processObject.getResultTransactionList());
			} catch (Exception e) {
				processException(processTransaction, e);
				return false;
			} 
		} else {
			processException(processTransaction, new BusinessException(BusinessErrorCode.UN_KNOWN_Template_IN_GENERATE));
		}
		return true;
	}
	
}

package com.cicc.gbo.tps.generator;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.cicc.gbo.core.component.ProcessObjectService;
import com.cicc.gbo.core.exception.BusinessErrorCode;
import com.cicc.gbo.core.exception.BusinessException;
import com.cicc.gbo.core.generator.AbstractGenerator;
import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionEntity;
import com.cicc.gbo.core.utils.BeanUtils;
import com.cicc.gbo.tps.model.Trade;
import com.cicc.gbo.tps.model.Template;
import com.cicc.gbo.tps.service.TemplateService;
import com.cicc.gbo.tps.service.TradeService;

/**
 * @author Guo Hua
 * @version 上午10:35:12 2014年9月15日 
 */
public class TransactionGenerator extends AbstractGenerator {
		
	@Autowired
	TemplateService templateService;
	@Autowired
	ProcessObjectService processObjectService;
	@Autowired
	TradeService tradeService;
	
	@Override
	public boolean generate(TransactionEntity processTransaction, 
			ProcessObject processObject) {
		try {
			if (StringUtils.isNotEmpty(processTransaction.getTemplateGroupId())) {
				List<Template> templates = templateService.loadAllByGroupId(processTransaction.getTemplateGroupId());
				List<Trade> tradeList = new ArrayList<Trade>();
				
				try {
					for(Template template : templates) {
						Trade trade = new Trade();
						BeanUtils.copyProperties(processTransaction, trade);
						BeanUtils.copyProperties(template, trade);
						trade.setEntityId(null);
						trade.setRootRecordId(processTransaction.getExternalRecordId());
						trade.setExternalRecordId(processTransaction.getExternalRecordId());
						trade.setParentRecordId(null);
						trade.setChildRecordId(null);
						tradeList.add(trade);
					}
					processObjectService.addResultTransaction(processObject, tradeList);
					tradeService.createAndUpdate(tradeList);
				} catch (Exception e) {
					processException(processTransaction, e);
					return false;
				} 
			} else {
				processException(processTransaction, new BusinessException(BusinessErrorCode.UN_KNOWN_Template_IN_GENERATE));
			}
			return true;
		} catch (Exception e) {
			this.processException(processTransaction, new BusinessException(BusinessErrorCode.UN_KNOWN_Template_IN_ENRICH));
			return false;
		}
	}
	
}

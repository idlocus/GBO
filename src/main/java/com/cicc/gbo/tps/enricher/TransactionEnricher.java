package com.cicc.gbo.tps.enricher;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.beans.factory.annotation.Autowired;

import com.cicc.gaf.datadictionary.service.DataDictionaryService;
import com.cicc.gbo.core.enricher.AbstractEnricher;
import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;
import com.cicc.gbo.core.service.TransactionConditionService;
import com.cicc.gbo.core.shared.RecordRemarkConstants;
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.core.utils.BitSetUtils;
import com.cicc.gbo.tps.model.TransactionConditionTemplate;
import com.cicc.gbo.tps.model.TransactionConditionValue;
import com.cicc.gbo.tps.model.TransactionEntity;
import com.cicc.gbo.tps.shared.KeyFieldConstants;

/**
 * @author Guo Hua
 * @version 上午10:29:11 2014年9月15日 
 */
public class TransactionEnricher extends AbstractEnricher {
	
	@Autowired
	DataDictionaryService transactionDictionary;
	@Autowired
	TransactionConditionService transactionConditionService;

	public boolean enrich(TransactionEntity transactionEntity, ProcessObject processObject) {	
		try {
			if (transactionEntity.getPrimaryAccountLocation() == null) {
				transactionEntity.setPrimaryAccountLocation("BJ");
			}
			this.enrichCondition(transactionEntity);
		} catch (Exception e) {
			transactionEntity.setRecordStatus(RecordStatus.FAILURE.name());
			transactionEntity.setRecordRemark(RecordRemarkConstants.ERROR_TRANSACTION_CONDITION);
			return false;
		}
		return true;
	}
	
	public boolean enrichCondition(TransactionEntity transactionEntity) {
		Map<String, Object> conditionFields = transactionDictionary.getMap(TransactionEntity.class.getName());
		Map<Map<String, String>, TransactionConditionValue> conditionMaps = transactionConditionService.loadAllConditionValue();
		if (conditionMaps == null || conditionMaps.size() == 0) { 
			transactionConditionService.RefreshConditionValue("test");
			conditionMaps = transactionConditionService.loadAllConditionValue();
		}
		Map<String, TransactionConditionTemplate> conditionTemplates = transactionConditionService.loadAllConditionTemplate();
		
		List<String> excludeList = new ArrayList<String>();
		List<String> includeList = new ArrayList<String>();
		Queue<String> priorityList = new LinkedList<String>();
		
		final BeanWrapper src = new BeanWrapperImpl(transactionEntity);
		if (conditionFields != null && conditionFields.size() > 0) {
			for (Map.Entry<String, Object> condition : conditionFields.entrySet()) {
				String fieldName = condition.getValue().toString();
				
				Object tmp = src.getPropertyValue(fieldName);
				String fieldValue = tmp == null? KeyFieldConstants.CONDITION_ALL : tmp.toString();
				
				Map<String, String> key = new HashMap<String, String>();
				key.put(fieldName, fieldValue);
				
				if (conditionMaps.containsKey(key)) {
					TransactionConditionValue existing = conditionMaps.get(key);
					String excludeValue = existing.getAllExcludeNumber();
					String includeValue = existing.getAllIncludeNumber();
					String priorityValue = existing.getPriorityNumber();
					excludeList.add(excludeValue);
					includeList.add(includeValue);
					priorityList.add(priorityValue);
					
				} 
			}
		}
		String templateGroupId = null;
		
		String conditionNumber = BitSetUtils.bitSetListAnd(includeList);
		if(conditionTemplates.containsKey(conditionNumber)) {
			templateGroupId = conditionTemplates.get(conditionNumber).getTemplateGroupId();
		} else {
			excludeList.add(conditionNumber);
			conditionNumber = BitSetUtils.bitSetListAnd(excludeList);
			if(conditionTemplates.containsKey(conditionNumber))
				templateGroupId = conditionTemplates.get(conditionNumber).getTemplateGroupId();
			else {
				for (int i = 0; i < priorityList.size(); i++) {
					String value1 = conditionNumber;
					String value2 = priorityList.poll();
					String value = BitSetUtils.bitSetAnd(value1, value2);
					if (conditionTemplates.containsKey(value)) 
						templateGroupId = conditionTemplates.get(conditionNumber).getTemplateGroupId();
				}
			}
		}
		if (templateGroupId != null) {
			transactionEntity.setTemplateGroupId(templateGroupId);
			return true;
		} else {
			transactionEntity.setRecordStatus(RecordStatus.INVALID.name());
			transactionEntity.setRecordRemark(RecordRemarkConstants.ERROR_TRANSACTION_CONDITION);
			return false;
		}
	}

	@Override
	public boolean enrich(ProcessObject processObject) {
		List<? extends TransactionBaseEntity> processTransactionList = processObject.getProcessTransactionList();
		if(CollectionUtils.isNotEmpty(processTransactionList)){
			for (TransactionBaseEntity processTransaction : processTransactionList) {
				if (processTransaction.getRecordStatus().equalsIgnoreCase(RecordStatus.ACTIVE.name())) {
					if (processTransaction instanceof TransactionEntity) {
						this.enrich((TransactionEntity) processTransaction, processObject);
					} else {
						processTransaction.setRecordStatus(RecordStatus.ERROR.name());
						processTransaction.setRecordRemark(RecordRemarkConstants.ERROR_ENRICH_TRANSACTION_TYPE);
					}
				}
			}
		}
		return true;
	}
}

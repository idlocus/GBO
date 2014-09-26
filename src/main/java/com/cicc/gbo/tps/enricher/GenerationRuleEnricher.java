package com.cicc.gbo.tps.enricher;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;

import org.apache.commons.collections.MapUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.beans.factory.annotation.Autowired;

import com.cicc.gbo.core.enricher.AbstractEnricher;
import com.cicc.gbo.core.exception.BusinessErrorCode;
import com.cicc.gbo.core.exception.BusinessException;
import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionEntity;
import com.cicc.gbo.core.shared.ProcessConstants;
import com.cicc.gbo.core.utils.BitSetUtils;
import com.cicc.gbo.tps.model.Condition;
import com.cicc.gbo.tps.model.ConditionMap;
import com.cicc.gbo.tps.service.ConditionFieldService;
import com.cicc.gbo.tps.service.ConditionMapService;
import com.cicc.gbo.tps.service.ConditionService;
import com.cicc.gbo.tps.shared.KeyFieldConstants;

/**
 * @author Guo Hua
 * @version 上午11:07:19 2014年9月22日 
 */
public class GenerationRuleEnricher extends AbstractEnricher {
	
	@Autowired
	ConditionFieldService conditionFieldService;
	@Autowired
	ConditionMapService conditionMapService;
	
	
	@Autowired
	ConditionService transactionConditionService;

	@Override
	public boolean enrich(TransactionEntity processTransaction, 
			ProcessObject processObject) {
		try {
				Map<String, Object> conditionFields = conditionFieldService.loadAllConditionField(ProcessConstants.CATEGORY_VALUE);
				Map<Map<String, String>, ConditionMap> conditionMaps = conditionMapService.loadAllConditionMap(ProcessConstants.CATEGORY_VALUE);
				if (MapUtils.isEmpty(conditionMaps)) { 
					conditionMapService.RefreshConditionMap(ProcessConstants.CATEGORY_VALUE);
					conditionMaps = conditionMapService.loadAllConditionMap(ProcessConstants.CATEGORY_VALUE);
				}
				Map<String, Condition> conditionTemplates = transactionConditionService.loadAllCondition(ProcessConstants.CATEGORY_VALUE);
				
				List<String> excludeList = new ArrayList<String>();
				List<String> includeList = new ArrayList<String>();
				Queue<String> priorityList = new LinkedList<String>();
				
				final BeanWrapper src = new BeanWrapperImpl(processTransaction);
				if (MapUtils.isNotEmpty(conditionFields)) {
					for (Map.Entry<String, Object> condition : conditionFields.entrySet()) {
						String fieldName = condition.getValue().toString();
						
						Object tmp = src.getPropertyValue(fieldName);
						String fieldValue = tmp == null? KeyFieldConstants.CONDITION_ALL : tmp.toString();
						
						Map<String, String> key = new HashMap<String, String>();
						key.put(fieldName, fieldValue);
						
						System.out.println("fieldName: " + fieldName + ", fieldValue: " + fieldValue + " values:");
						
						if (conditionMaps.containsKey(key)) {
							ConditionMap existing = conditionMaps.get(key);
							String excludeValue = existing.getAllExcludeNumber();
							String includeValue = existing.getAllIncludeNumber();
							String priorityValue = existing.getPriorityNumber();
							excludeList.add(excludeValue);
							includeList.add(includeValue);
							priorityList.add(priorityValue);
							System.out.println("excludeValue: " + excludeValue + ", includeValue: " + includeValue + ", priorityValue: " + priorityValue + " ends.");
						} else {
							System.out.println("excludeValue: null, includeValue: null, priorityValue: null ends.");
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
					processTransaction.setTemplateGroupId(templateGroupId);
				} else {
					this.processException(processTransaction, new BusinessException(BusinessErrorCode.UN_KNOWN_Template_IN_ENRICH));
					return false;
				}
		} catch (Exception e) {
			this.processException(processTransaction, e);
			return false;
		}
		return true;
	}
}

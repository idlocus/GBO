package com.cicc.gbo.tps.service;

import java.beans.PropertyDescriptor;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cicc.gaf.dao.GenericDao;
import com.cicc.gaf.pagesort.Pagination;
import com.cicc.gbo.core.service.BaseServiceImpl;
import com.cicc.gbo.core.shared.ProcessConstants;
import com.cicc.gbo.core.shared.RecordRemarkConstants;
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.core.utils.BitSetUtils;
import com.cicc.gbo.tps.model.Condition;
import com.cicc.gbo.tps.model.ConditionMap;
import com.cicc.gbo.tps.shared.KeyFieldConstants;

@Service
public class ConditionMapService extends BaseServiceImpl {
	
	@Autowired
	GenericDao genericDao;
	@Autowired
	ConditionService conditionService;
	
	public Long create(ConditionMap conditionMap) {
		return (Long) genericDao.save(conditionMap);
	}
	
	public void update(ConditionMap conditionMap) {
		genericDao.update(conditionMap);
	}
	
	public void delete(Long id) {
		ConditionMap conditionMap = genericDao.get(ConditionMap.class, id);
		genericDao.delete(conditionMap);
	}
	
	public ConditionMap read(Long id) {
		return genericDao.get(ConditionMap.class, id);
	}

	public List<ConditionMap> listByExample(ConditionMap conditionMap,Pagination initJqgridPagination) {
		List<ConditionMap> conditionMapList = genericDao.queryByExample(ConditionMap.class, conditionMap, initJqgridPagination);
		return conditionMapList;
	}
	
	public List<Long> createAll(Collection<ConditionMap> conditionMapList) {
		List<Long> ids = new ArrayList<Long>();
		if (CollectionUtils.isNotEmpty(conditionMapList)) {
			for (ConditionMap conditionMap : conditionMapList) {
				ids.add(this.create(conditionMap));
			}
		}
		return ids;
	}
	
	public List<ConditionMap> loadAll() {
		return genericDao.loadAll(ConditionMap.class);
	}
	
	public void deleteAllByCategory(String categoryValue) {
		String identifier = getIdentifier(ConditionMap.class);
		
		List<ConditionMap> itemList = this.loadAllByCategory(categoryValue);
		if (CollectionUtils.isNotEmpty(itemList)) {
			for (ConditionMap item : itemList) {
				item.setRecordStatus(RecordStatus.INACTIVE.name());
				item.setRecordRemark(RecordRemarkConstants.DELETE_RECORD);
				
				item.setParentRecordId(identifier);
				genericDao.update(item);
			}
		}
	}

	private List<ConditionMap> loadAllByCategory(String categoryValue) {
		String[] fields = {ProcessConstants.CATEGORY_NAME, ProcessConstants.RECORD_STATUS};
		Object[] values = {categoryValue, RecordStatus.ACTIVE.name()};
		return genericDao.query(ConditionMap.class, fields, values);
	}
	
	public Map<Map<String, String>, ConditionMap> loadAllConditionMap(String categoryValue) {
		Map<Map<String, String>, ConditionMap> result = new HashMap<>();
		List<ConditionMap> itemList = this.loadAllByCategory(categoryValue);
		for (ConditionMap item : itemList) {
			Map<String, String> key = new HashMap<>();
			key.put(item.getFieldName(), item.getFieldValue());
			if (!result.containsKey(key)) {
				result.put(key, item);
			}
		}
		return result;
	}
	
	public void RefreshConditionMap(String categoryValue) {
		this.deleteAllByCategory(categoryValue);
		reCalculateConditionMap(categoryValue);
	}
	
	private void reCalculateConditionMap(String categoryValue) {
		
		List<Condition> conditions = conditionService.loadAllByCategory(categoryValue);
		Map<Map<String, String>, ConditionMap> conditionMaps = new HashMap<>();
		
		for (Condition condition : conditions) {
			final BeanWrapper src = new BeanWrapperImpl(condition);
			
			Object ob = src.getPropertyValue(KeyFieldConstants.CONDITION_VALUE_FIELD);
			String fieldValue = ob.toString();

			for (PropertyDescriptor column : src.getPropertyDescriptors()) {
				String columnName = column.getName();
				Object tmp = src.getPropertyValue(columnName);
				String columnValue = tmp == null? KeyFieldConstants.CONDITION_ALL : tmp.toString();
				
				Map<String, String> key = new HashMap<String, String>();
				key.put(columnName, columnValue);
				
				if (conditionMaps.containsKey(key)) {
					ConditionMap existing = conditionMaps.get(key);
					String excludeValue = BitSetUtils.bitSetOr(existing.getAllExcludeNumber(), fieldValue);
					existing.setAllExcludeNumber(excludeValue);
					existing.setPriorityNumber(excludeValue);
				} else {
					ConditionMap nonExisting = new ConditionMap();
					nonExisting.setFieldName(columnName);
					nonExisting.setFieldValue(columnValue);
					nonExisting.setAllExcludeNumber(fieldValue);
					nonExisting.setPriorityNumber(fieldValue);
					conditionMaps.put(key, nonExisting);
				}
			}
		}
		List<ConditionMap> resultList = new ArrayList<ConditionMap>();
		Iterator<Entry<Map<String, String>, ConditionMap>> iter = conditionMaps.entrySet().iterator(); 
		while (iter.hasNext()) { 
			Entry<Map<String, String>, ConditionMap> entry = iter.next(); 
			ConditionMap item = (ConditionMap)entry.getValue();
			item.setCategoryName(categoryValue);
		    Map<String, String> key = new HashMap<>();
		    key.put(item.getFieldName(), KeyFieldConstants.CONDITION_ALL);
		    ConditionMap item_condition_all = conditionMaps.get(key);
		    if (item_condition_all != null) {
		    	String includeValue = BitSetUtils.bitSetOr(item.getAllExcludeNumber(), item_condition_all.getAllExcludeNumber());
		    	item.setAllIncludeNumber(includeValue);
		    } else {
		    	item.setAllIncludeNumber(item.getAllExcludeNumber());
		    }
		    resultList.add(item);
		} 
		
		this.createAll(resultList);
	}
}

package com.cicc.gbo.tps.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cicc.gaf.dao.GenericDao;
import com.cicc.gaf.pagesort.Pagination;
import com.cicc.gbo.core.service.BaseServiceImpl;
import com.cicc.gbo.core.shared.ProcessConstants;
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.tps.model.ConditionField;

@Service
public class ConditionFieldService extends BaseServiceImpl {
	@Autowired
	GenericDao genericDao;
	
	public Long create(ConditionField conditionField) {
		return (Long) genericDao.save(conditionField);
	}
	
	public void update(ConditionField conditionField) {
		genericDao.update(conditionField);
	}
	
	public void delete(Long id) {
		ConditionField conditionField = genericDao.get(ConditionField.class, id);
		genericDao.delete(conditionField);
	}
	
	public ConditionField read(Long id) {
		return genericDao.get(ConditionField.class, id);
	}

	public List<ConditionField> listByExample(ConditionField conditionField,Pagination initJqgridPagination) {
		List<ConditionField> conditionFieldList = genericDao.queryByExample(ConditionField.class, conditionField, initJqgridPagination);
		return conditionFieldList;
	}
	
	public List<ConditionField> loadAll() {
		return genericDao.loadAll(ConditionField.class);
	}
	
	private List<ConditionField> loadAllByCategory(String categoryValue) {
		String[] fields = {ProcessConstants.CATEGORY_NAME, ProcessConstants.RECORD_STATUS};
		Object[] values = {categoryValue, RecordStatus.ACTIVE.name()};
		return genericDao.query(ConditionField.class, fields, values);
	}
	
	public Map<String, Object> loadAllConditionField(String categoryValue) {
		Map<String, Object> result = new HashMap<>();
		List<ConditionField> itemList = this.loadAllByCategory(categoryValue);
		for (ConditionField item : itemList) {
			result.put(item.getKeyItem(), item.getValueItem());
		}
		return result;
	}

}

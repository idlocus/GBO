package com.cicc.gbo.tps.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cicc.gaf.dao.GenericDao;
import com.cicc.gaf.pagesort.Pagination;
import com.cicc.gbo.core.service.BaseServiceImpl;
import com.cicc.gbo.core.shared.ProcessConstants;
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.tps.model.Condition;

@Service
public class ConditionService extends BaseServiceImpl {
	@Autowired
	GenericDao genericDao;
	
	public Long create(Condition transactionCondition) {
		return (Long) genericDao.save(transactionCondition);
	}
	
	public void update(Condition transactionCondition) {
		genericDao.update(transactionCondition);
	}
	
	public void delete(Long id) {
		Condition transactionCondition = genericDao.get(Condition.class, id);
		genericDao.delete(transactionCondition);
	}
	
	public Condition read(Long id) {
		return genericDao.get(Condition.class, id);
	}

	public List<Condition> listByExample(Condition transactionCondition,Pagination initJqgridPagination) {
		List<Condition> transactionConditionList = genericDao.queryByExample(Condition.class, transactionCondition, initJqgridPagination);
		return transactionConditionList;
	}

	public List<Condition> loadAllByCategory(String categoryValue) {
		String[] fields = {ProcessConstants.CATEGORY_NAME, ProcessConstants.RECORD_STATUS};
		Object[] values = {categoryValue, RecordStatus.ACTIVE.name()};
		return genericDao.query(Condition.class, fields, values);
	}
	
	public Map<String, Condition> loadAllCondition(String categoryValue) {
		Map<String, Condition> result = new HashMap<>();
		List<Condition> itemList = this.loadAllByCategory(categoryValue);
		if (CollectionUtils.isNotEmpty(itemList)) {
			for (Condition item : itemList) {
				result.put(item.getConditionValue(), item);
			}
		}
		return result;
	}
}

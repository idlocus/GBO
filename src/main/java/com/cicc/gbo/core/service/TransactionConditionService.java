package com.cicc.gbo.core.service;

import java.beans.PropertyDescriptor;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
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
import com.cicc.gaf.logger.Logger;
import com.cicc.gaf.logger.LoggerFactory;
import com.cicc.gaf.pagesort.Pagination;
import com.cicc.gbo.core.component.IdService;
import com.cicc.gbo.core.model.AuditableEntity;
import com.cicc.gbo.core.shared.LogMessageConstants;
import com.cicc.gbo.core.shared.ProcessConstants;
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.core.utils.AuditableBaseComparator;
import com.cicc.gbo.core.utils.BitSetUtils;
import com.cicc.gbo.tps.model.TransactionConditionTemplate;
import com.cicc.gbo.tps.model.TransactionConditionValue;
import com.cicc.gbo.tps.shared.KeyFieldConstants;
import com.cicc.gbo.tps.shared.NativeSqlConstants;

/**
 * @author Guo Hua
 * @version 下午6:15:33 2014年9月18日 
 */
@Service
public class TransactionConditionService {
	
	private static final Logger logger = LoggerFactory.getLogger(TransactionConditionService.class);

	@Autowired
	GenericDao genericDao;
	@Autowired
	IdService idService;
	
	
	public <T extends AuditableEntity> Long create(T auditableBaseEntity) {
		String identifier = idService.getIdentifier(auditableBaseEntity.getClass());
		auditableBaseEntity.setInternalRecordId(identifier);
		if (auditableBaseEntity.getExternalRecordId() == null) {
			auditableBaseEntity.setExternalRecordId(identifier);
			auditableBaseEntity.setOriginalRecordId(identifier);
		}
		return (Long) genericDao.save(auditableBaseEntity);
	}
	
	public <T extends AuditableEntity> List<Long> createAll(Collection<T> auditableBaseList) {
		List<Long> values = new ArrayList<Long>();
		if (CollectionUtils.isNotEmpty(auditableBaseList)) {
			for (T auditableBaseEntity : auditableBaseList) {
				values.add(this.create(auditableBaseEntity));
			}
		}
		return values;
	}
	
	public <T extends AuditableEntity> void update(T auditableBaseEntity) {
		genericDao.update(auditableBaseEntity);
		RefreshConditionValue(auditableBaseEntity.getEntityId().toString());
	}
	
	public <T extends AuditableEntity> void updateAll(Collection<T> auditableBaseList) {
		if (CollectionUtils.isNotEmpty(auditableBaseList)) {
			for (T auditableBaseEntity : auditableBaseList) {
				genericDao.update(auditableBaseEntity);
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	public <T extends AuditableEntity> List<T> queryExistingRecords(T auditableBaseEntity) {
		String fields[] = {ProcessConstants.KEY_ID, ProcessConstants.RECORD_STATUS};
		Object values[] = {auditableBaseEntity.getExternalRecordId(), RecordStatus.ACTIVE.name()};
		return (List<T>) genericDao.query(auditableBaseEntity.getClass(), fields, values);
	}
	
	public <T extends AuditableEntity> void updateAndCreateAll(Collection<T> auditableBaseList) {
		if (CollectionUtils.isNotEmpty(auditableBaseList)) {
			for (T auditableBaseEntity : auditableBaseList) {
				this.updateAndCreate(auditableBaseEntity);
			}
		}
	}
	
	public <T extends AuditableEntity> void updateAndCreate(T auditableBaseEntity) {
		List<T> activeRecordList = this.queryExistingRecords(auditableBaseEntity);
		if (CollectionUtils.isNotEmpty(activeRecordList)) {
			String originalRecordId = ProcessConstants.ERROR_ORIGINAL_RECORD_ID;
			Collections.sort(activeRecordList, new AuditableBaseComparator<T>());
			for (T activeRecord : activeRecordList) {
				activeRecord.setRecordStatus(RecordStatus.INACTIVE.name());
				originalRecordId = activeRecord.getInternalRecordId();
			}
			this.updateAll(activeRecordList);
			auditableBaseEntity.setOriginalRecordId(originalRecordId);
		}
		this.create(auditableBaseEntity);
	}
	
	public void delete(Long id) {
		AuditableEntity auditableBaseEntity = genericDao.get(AuditableEntity.class, id);
		auditableBaseEntity.setRecordStatus(RecordStatus.DELETED.name());
		genericDao.update(auditableBaseEntity);
		RefreshConditionValue(id.toString());
	}
	
	public <T extends AuditableEntity> T read(Class<T> t, Long id) {
		String field = ProcessConstants.ENTITY_ID;
		Object value = id;
		return genericDao.query4SingleResult(t, field, value);
	}
	
	private <T extends AuditableEntity> List<T> readAll(Class<T> t) {
		String fields = ProcessConstants.RECORD_STATUS;
		Object values = RecordStatus.ACTIVE.name();
		return (List<T>) genericDao.query(t, fields, values);
	}
	
	public <T extends AuditableEntity> List<T> listByExample(Class<T> entity, T auditableBaseEntity,Pagination initJqgridPagination) {
		auditableBaseEntity.setRecordStatus(null);
		List<T> auditableList = genericDao.queryByExample(entity, auditableBaseEntity, initJqgridPagination);
		return auditableList;
	}
	
	public Map<String, TransactionConditionTemplate> loadAllConditionTemplate() {
		Map<String, TransactionConditionTemplate> result = new HashMap<>();
		List<TransactionConditionTemplate> itemList = this.readAll(TransactionConditionTemplate.class);
		for (TransactionConditionTemplate item : itemList) {
			result.put(item.getConditionValue(), item);
		}
		return result;
	}
	
	public Map<Map<String, String>, TransactionConditionValue> loadAllConditionValue() {
		Map<Map<String, String>, TransactionConditionValue> result = new HashMap<>();
		List<TransactionConditionValue> itemList = this.readAll(TransactionConditionValue.class);
		for (TransactionConditionValue item : itemList) {
			Map<String, String> key = new HashMap<>();
			if (!result.containsKey(key)) {
				result.put(key, item);
			}
		}
		return result;
	}
	
	public void reCalculateConditionValue() {
		
		String selectConditionTemplate = NativeSqlConstants.QUERY_ALL_ACTIVE_TRANSACTION_CONDITION;
		List<TransactionConditionTemplate> conditions = genericDao.nativeQuery(TransactionConditionTemplate.class, selectConditionTemplate, null);
		Map<Map<String, String>, TransactionConditionValue> conditionMaps = new HashMap<>();
		
		for (TransactionConditionTemplate condition : conditions) {
			final BeanWrapper src = new BeanWrapperImpl(condition);
			
			Object ob = src.getPropertyValue(KeyFieldConstants.CONDITION_VALUE_FIELD);
			if ( ob == null) {
				logger.error(LogMessageConstants.ERROR_CONDITION_TEMPLATE);
				throw new RuntimeException();
			}
			String fieldValue = ob.toString();

			for (PropertyDescriptor column : src.getPropertyDescriptors()) {
				String columnName = column.getName();
				Object tmp = src.getPropertyValue(columnName);
				String columnValue = tmp == null? KeyFieldConstants.CONDITION_ALL : tmp.toString();
				
				Map<String, String> key = new HashMap<String, String>();
				key.put(columnName, columnValue);
				
				if (conditionMaps.containsKey(key)) {
					TransactionConditionValue existing = conditionMaps.get(key);
					String excludeValue = BitSetUtils.bitSetOr(existing.getAllExcludeNumber(), fieldValue);
					existing.setAllExcludeNumber(excludeValue);
					existing.setPriorityNumber(excludeValue);
				} else {
					TransactionConditionValue nonExisting = new TransactionConditionValue();
					nonExisting.setFieldName(columnName);
					nonExisting.setFieldValue(columnValue);
					nonExisting.setAllExcludeNumber(fieldValue);
					nonExisting.setPriorityNumber(fieldValue);
					conditionMaps.put(key, nonExisting);
				}
			}
		}
		List<TransactionConditionValue> resultList = new ArrayList<TransactionConditionValue>();
		Iterator<Entry<Map<String, String>, TransactionConditionValue>> iter = conditionMaps.entrySet().iterator(); 
		while (iter.hasNext()) { 
			Entry<Map<String, String>, TransactionConditionValue> entry = iter.next(); 
			TransactionConditionValue item = (TransactionConditionValue)entry.getValue();
		    Map<String, String> key = new HashMap<>();
		    key.put(item.getFieldName(), KeyFieldConstants.CONDITION_ALL);
		    TransactionConditionValue item_condition_all = conditionMaps.get(key);
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
	
	public void RefreshConditionValue(String externalId) {
		externalId = KeyFieldConstants.TRANSACTION_CONDITION_KEY + externalId;
		String updateSQL = NativeSqlConstants.UPDATE_ALL_TRANSACTION_CONDITION_MP;
		Object[] paramValues = new Object[]{externalId, externalId, RecordStatus.INACTIVE, RecordStatus.ACTIVE};
		genericDao.nativeUpdate(updateSQL, paramValues);
		
		reCalculateConditionValue();
	}
}

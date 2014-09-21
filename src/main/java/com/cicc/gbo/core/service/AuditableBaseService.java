package com.cicc.gbo.core.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cicc.gaf.dao.GenericDao;
import com.cicc.gaf.pagesort.Pagination;
import com.cicc.gbo.core.component.IdService;
import com.cicc.gbo.core.model.AuditableEntity;
import com.cicc.gbo.core.shared.ProcessConstants;
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.core.utils.AuditableBaseComparator;

/**
 * @author Guo Hua
 * @version 下午4:20:05 2014年9月15日 
 */
@Service
public class AuditableBaseService implements GenericService {

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
	public <T extends AuditableEntity> T read(Class<T> entityClass, Long id) {
		String field = ProcessConstants.ENTITY_ID;
		Object value = id;
		return genericDao.query4SingleResult(entityClass, field, value);
	}
	public <T extends AuditableEntity> void update(T auditableBaseEntity) {
		genericDao.update(auditableBaseEntity);
	}
	public <T extends AuditableEntity> void delete(Class<T> entityClass, Long id) {
		T auditableBaseEntity = this.read(entityClass, id);
		auditableBaseEntity.setRecordStatus(RecordStatus.DELETED.name());
		genericDao.update(auditableBaseEntity);
	}
	public <T extends AuditableEntity> List<T> listByExample(Class<T> entityClass, T auditableBaseEntity,Pagination initJqgridPagination) {
		auditableBaseEntity.setRecordStatus(null);
		List<T> auditableList = genericDao.queryByExample(entityClass, auditableBaseEntity, initJqgridPagination);
		return auditableList;
	}
	
	
	
	//---------------------------------------
	
	public <T extends AuditableEntity> List<Long> createAll(Collection<T> auditableBaseList) {
		List<Long> values = new ArrayList<Long>();
		if (CollectionUtils.isNotEmpty(auditableBaseList)) {
			for (T auditableBaseEntity : auditableBaseList) {
				values.add(this.create(auditableBaseEntity));
			}
		}
		return values;
	}
	

	
	public <T extends AuditableEntity> void updateAll(Collection<T> auditableBaseList) {
		if (CollectionUtils.isNotEmpty(auditableBaseList)) {
			for (T auditableBaseEntity : auditableBaseList) {
				genericDao.update(auditableBaseEntity);
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	private <T extends AuditableEntity> List<T> queryExistingRecords(T auditableBaseEntity) {
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
	
	public  <T extends AuditableEntity> List<T> readAll(Class<T> t) {
		String fields = ProcessConstants.RECORD_STATUS;
		Object values = RecordStatus.ACTIVE.name();
		return (List<T>) genericDao.query(t, fields, values);
	}
	
	
}

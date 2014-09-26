package com.cicc.gbo.core.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cicc.gaf.dao.GenericDao;
import com.cicc.gaf.pagesort.Pagination;
import com.cicc.gbo.core.component.IdService;
import com.cicc.gbo.core.model.NonAuditableEntity;
import com.cicc.gbo.core.shared.ProcessConstants;

/**
 * @author Guo Hua
 * @version 上午9:10:53 2014年9月18日 
 */
@Service
public class NonAuditableBaseService implements GenericService {

	@Autowired
	GenericDao genericDao;
	@Autowired
	IdService idService;
	
	
	public <T extends NonAuditableEntity> Long create(T nonAuditableBaseEntity) {
		return (Long) genericDao.save(nonAuditableBaseEntity);
	}
	public <T extends NonAuditableEntity> T read(Class<T> entityClass, Long id) {
		String field = ProcessConstants.ENTITY_ID;
		Object value = id;
		return genericDao.query4SingleResult(entityClass, field, value);
	}
	public <T extends NonAuditableEntity> void update(T nonAuditableBaseEntity) {
		genericDao.update(nonAuditableBaseEntity);
	}
	public <T extends NonAuditableEntity> void delete(Class<T> entityClass, Long id) {
		T nonAuditableBaseEntity = this.read(entityClass, id);
		genericDao.delete(nonAuditableBaseEntity);
	}
	public <T extends NonAuditableEntity> List<T> listByExample(Class<T> entityClass, T nonAuditableBaseEntity,Pagination initJqgridPagination) {
		List<T> nonAuditableList = genericDao.queryByExample(entityClass, nonAuditableBaseEntity, initJqgridPagination);
		return nonAuditableList;
	}
	
	//------------------------------------------------
	
	public <T extends NonAuditableEntity> List<Long> createAll(Collection<T> nonAuditableBaseList) {
		List<Long> values = new ArrayList<Long>();
		if (CollectionUtils.isNotEmpty(nonAuditableBaseList)) {
			for (T nonAuditableBaseEntity : nonAuditableBaseList) {
				values.add(this.create(nonAuditableBaseEntity));
			}
		}
		return values;
	}
	

	
	public <T extends NonAuditableEntity> void updateAll(Collection<T> nonAuditableBaseList) {
		if (CollectionUtils.isNotEmpty(nonAuditableBaseList)) {
			for (T nonAuditableBaseEntity : nonAuditableBaseList) {
				genericDao.update(nonAuditableBaseEntity);
			}
		}
	}
	
	
	public <T extends NonAuditableEntity> List<T> readAll(Class<T> nonAuditableBaseEntity) {
		return genericDao.loadAll(nonAuditableBaseEntity);
	}

}

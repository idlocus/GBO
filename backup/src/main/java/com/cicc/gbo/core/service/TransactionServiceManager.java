package com.cicc.gbo.core.service;

import java.util.List;

import com.cicc.gaf.base.BaseModel;
import com.cicc.gaf.pagesort.Pagination;


/**
 * @author Guo Hua
 * @version 下午5:42:28 2014年9月19日 
 */
public interface TransactionServiceManager<T extends BaseModel> {

	public Long create(T baseEntity);

	public void update(T baseEntity);
	
	public T read(Class<T> entityClass, Long id);

	public void delete(T baseEntity);

	public List<T> listByExample(Class<T> entityClass, T baseEntity,
			Pagination initJqgridPagination);

}

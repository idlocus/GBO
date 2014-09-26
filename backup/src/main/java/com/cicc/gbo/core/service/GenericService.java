package com.cicc.gbo.core.service;

import java.util.Collection;
import java.util.List;

/**
 * @author Guo Hua
 * @version 下午3:49:47 2014年9月21日 
 */
public interface GenericService<T> {

	public Class<T> getEntityClass() ;
	public T create(T t);
	public T read(Long id);
	public T update(T t);
	public T delete(Long id);
	public T delete(T t);
	public Collection<T> create(Collection<T> listT);
	public Collection<T> read(Collection<Long> idList);
	public Collection<T> update(Collection<T> listT);
	public Collection<T> delete(List<String> idList);
	public Collection<T> delete(Collection<T> listT);
	public T createOrUpdate(T t);
	public Collection<T>createOrUpdate(Collection<T> listT);
	public List<T> read(T condition);
	public List<T> readAll();
	public List<T> readCollectionByWhereSql(String sql);

	public String getIdentifier();
}

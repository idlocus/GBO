package com.cicc.gbo.core.component;
/**
 * @author Guo Hua
 * @version 下午12:49:21 2014年9月10日 
 */
public interface IdService {
	String getIdentifier(Class<?> clazz);
	String getIdentifier(String entityName);
}

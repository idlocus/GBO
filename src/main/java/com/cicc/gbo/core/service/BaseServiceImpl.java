package com.cicc.gbo.core.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.cicc.gbo.core.component.IdService;

/**
 * @author Guo Hua
 * @version 上午9:42:26 2014年9月24日 
 */
public class BaseServiceImpl implements BaseService {

	@Autowired
	IdService idService;
	
	public String getIdentifier(String entityName){
		return idService.getIdentifier(entityName);
	}
	protected String getIdentifier(Class<?> clazz){
		return idService.getIdentifier(clazz);
	}
}

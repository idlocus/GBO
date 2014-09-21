package com.cicc.gbo.core.component;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

import org.springframework.stereotype.Component;

/**
 * @author Guo Hua
 * @version 下午12:49:58 2014年9月10日 
 */
@Component
public class IdServiceImpl implements IdService {
	
	private final SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	private final Random seed = new Random(); 

	public String getInternalId(Class<?> clazz){
		return clazz.getSimpleName() + "_" + simpleDateFormat.format(new Date()) + seed.nextInt(1000);
	}
	public String getUuidId(Class<?> clazz){
		String newIdString = UUID.randomUUID().toString();
		return newIdString;
	}
	
	public String getUuidId(String entityName) {
		String newIdString = UUID.randomUUID().toString();
		return newIdString;
	}

	@Override
	public String getIdentifier(Class<?> clazz) {
		return getInternalId(clazz);
	}

	@Override
	public String getIdentifier(String entityName) {
		return getUuidId(entityName);
	}

}

package com.cicc.gaf.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cicc.gaf.dao.GenericDao;
import com.cicc.gaf.test.model.TestEntity;


@Service
public class TestDaoInService{

	@Autowired
	private GenericDao dao;
	

	public void saveTestSave() {
		TestEntity entity = new TestEntity();
		entity.setTestName("test1");
		entity.setTestId(1L);
		Long id = (Long) dao.save(entity);
		dao.flush();
	
	}


}

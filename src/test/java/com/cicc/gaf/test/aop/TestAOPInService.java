package com.cicc.gaf.test.aop;

import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cicc.gaf.dao.GenericDao;
import com.cicc.gaf.test.model.TestEntity;
import com.cicc.gaf.test.service.TestDaoInService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("../dao/spring_servlet.xml")
public class TestAOPInService {

	@Autowired
	private TestDaoInService testDaoInService;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Test
	public void saveTestSave() {
		testDaoInService.saveTestSave();
	}


}

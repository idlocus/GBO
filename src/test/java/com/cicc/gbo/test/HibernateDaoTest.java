package com.cicc.gbo.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cicc.gaf.dao.GenericDao;
import com.cicc.gbo.oms.model.Order;

/**
 * @author Guo Hua
 * @version 上午10:14:51 2014年9月24日 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class HibernateDaoTest {
	
	@Autowired
	GenericDao genericDao;
	
	@Test
	public void testSave() {
		try {
			Order order = null;
			Long id = (Long) genericDao.save(order);
			System.out.println("The id is: " + id);
			
//			Order order = new Order();
//			order.setPrimaryAccountId("guohua");
//			order.setEntityId(new Long(1));
//			Long id = (Long) genericDao.save(order);
//			Order order2 = new Order();
//			order2.setEntityId(id);
//			Long id2 = (Long) genericDao.save(order2);
//			System.out.println("The id2 is: " + id2);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

package com.cicc.gaf.test.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;



import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cicc.gaf.dao.GenericDao;
import com.cicc.gaf.dao.LikeMatchMode;
import com.cicc.gaf.dao.ParamMode;
import com.cicc.gaf.dao.StoreProcedureParam;
import com.cicc.gaf.pagesort.Comparator;
import com.cicc.gaf.test.model.TestEntity;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("test_spring_servlet.xml")
@TransactionConfiguration(transactionManager="transactionManager",defaultRollback = false)
@Transactional
public class GenericDaoTest {

	@Autowired
	private GenericDao dao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		
	}

	@Test
	public void testSave() {
		TestEntity entity = new TestEntity();
		entity.setTestName("test1");
		entity.setTestId(1L);
		Long id = (Long) dao.save(entity);
		TestEntity result = dao.get(TestEntity.class, id);
		Assert.assertEquals(result.getTestName(), entity.getTestName());
	}

	@Test
	public void testDelete() {
		List<TestEntity> entities = dao.loadAll(TestEntity.class);
		if(entities == null || entities.size() == 0){
			fail("not find any entity in repository");
		}else{
			dao.delete(entities.get(0));
		}
		
	}

	@Test
	public void testNativeDelete() {
		List<TestEntity> entities = dao.loadAll(TestEntity.class);
		if(entities == null || entities.size() == 0){
			fail("not find any entity in repository");
		}else{
			String delSql = "delete from t_test_table where test_name = ?";
			int rows = dao.nativeDelete(delSql, new String[]{entities.get(0).getTestName()});
			Assert.assertTrue(rows >= 1);
		}
	}

	@Test
	public void testUpdate() {
		TestEntity entity = new TestEntity();
		entity.setTestName("test3");
		entity.setTestId(3L);
		dao.save(entity);
		dao.flush();
		entity.setTestName("test4");
		TestEntity result = (TestEntity) dao.update(entity);
		Assert.assertEquals(result.getTestName(), "test4");;
		
	}

	@Test
	public void testNativeUpdate() {
		TestEntity entity = new TestEntity();
		entity.setTestName("test5");
		entity.setTestId(5L);
		Long id = (Long) dao.save(entity);
		dao.flush();
		String updateSQL = "update t_test_table set test_name = ? where id = ?";
		dao.nativeUpdate(updateSQL, new Object[]{"test6",id});
		dao.flush();
		dao.refresh(entity);
		TestEntity result = dao.get(TestEntity.class, id);
		assertEquals(result.getTestName(),"test6");
	}

	@Test
	public void testGet() {
		TestEntity entity = new TestEntity();
		entity.setTestName("test7");
		entity.setTestId(7L);
		dao.save(entity);
		dao.flush();
		TestEntity result = dao.get(TestEntity.class, entity.getEntityId());
		assertNotNull(result);
	}

	@Test
	public void testLoadAll() {
		TestEntity entity = new TestEntity();
		entity.setTestName("test7");
		entity.setTestId(7L);
		dao.save(entity);
		dao.flush();
		List<TestEntity> result = dao.loadAll(TestEntity.class);
		assertTrue(result != null && result.size() >= 1);
	}

	@Test
	public void testQueryClassOfTStringObject() {
		TestEntity entity = new TestEntity();
		entity.setTestName("test7");
		entity.setTestId(7L);
		dao.save(entity);
		dao.flush();
		List<TestEntity> result = dao.query(TestEntity.class, "testName", "test7");
		assertTrue(result != null && result.size() >= 1);
		
	}

	@Test
	public void testQueryClassOfTStringArrayObjectArray() {
		TestEntity entity = new TestEntity();
		entity.setTestName("test7");
		entity.setTestId(7L);
		dao.save(entity);
		dao.flush();
		List<TestEntity> result = dao.query(TestEntity.class, new String[]{"testName","testId"}, new Object[]{"test7",7l});
		assertTrue(result != null && result.size() >= 1);
	}

	
	@Test
	public void testQueryClassOfTStringArrayObjectArrayPagination() {
		dao.nativeDelete("delete from t_test_table", null);
		dao.flush();
		TestEntity entity8 = new TestEntity();
		entity8.setTestName("test8");
		entity8.setTestId(8L);
		dao.save(entity8);
		TestEntity entity9 = new TestEntity();
		entity9.setTestName("test8");
		entity9.setTestId(9L);
		dao.save(entity9);
		TestEntity entity10 = new TestEntity();
		entity10.setTestName("test8");
		entity10.setTestId(10L);
		dao.save(entity10);
		dao.flush();
		PageTest page = new PageTest();
		page.setPagesize(2);
		page.setCurrentPage(1);
		Comparator comparator = new Comparator("testId",true);
		List<Comparator> comparators = new ArrayList<Comparator>();
		comparators.add(comparator);
		page.setComparatorList(comparators);
		
		List<TestEntity> result = dao.query(TestEntity.class, new String[]{"testName"}, new Object[]{"test8"}, page);
		
		page.setCurrentPage(2);
		
		List<TestEntity> result2 = dao.query(TestEntity.class, new String[]{"testName"}, new Object[]{"test8"},  page);
		assertTrue(result.get(0).getTestId() == 8L && result.get(1).getTestId() == 9l && result2.get(0).getTestId() == 10l);
		
	}
	
	@Test
	public void testQueryClassOfTStringArrayObjectArrayStringArray() {
		TestEntity entity = new TestEntity();
		entity.setTestName(null);
		entity.setTestId(7L);
		dao.save(entity);
		dao.flush();
		List<TestEntity> result = dao.query(TestEntity.class,null,null,new String[]{"testName"});
		assertTrue(result != null && result.size() >= 1);
	}
	
	@Test
	public void testQueryClassOfTStringArrayObjectArrayStringArrayPagination() {
		dao.nativeDelete("delete from t_test_table", null);
		dao.flush();
		TestEntity entity8 = new TestEntity();
		entity8.setTestName(null);
		entity8.setTestId(8L);
		dao.save(entity8);
		TestEntity entity9 = new TestEntity();
		entity9.setTestName(null);
		entity9.setTestId(9L);
		dao.save(entity9);
		TestEntity entity10 = new TestEntity();
		entity10.setTestName(null);
		entity10.setTestId(10L);
		dao.save(entity10);
		dao.flush();
		PageTest page = new PageTest();
		page.setPagesize(2);
		page.setCurrentPage(1);
		Comparator comparator = new Comparator("testId",true);
		List<Comparator> comparators = new ArrayList<Comparator>();
		comparators.add(comparator);
		page.setComparatorList(comparators);
		
		List<TestEntity> result = dao.query(TestEntity.class, null,null,new String[]{"testName"}, page);
		
		page.setCurrentPage(2);
		
		List<TestEntity> result2 = dao.query(TestEntity.class,null,null,new String[]{"testName"},  page);
		assertTrue(result.get(0).getTestId() == 8L && result.get(1).getTestId() == 9l && result2.get(0).getTestId() == 10l);
	}

	@Test
	public void testQueryIn() {
		dao.nativeDelete("delete from t_test_table", null);
		dao.flush();
		TestEntity entity8 = new TestEntity();
		entity8.setTestName("test8");
		entity8.setTestId(8L);
		dao.save(entity8);
		TestEntity entity9 = new TestEntity();
		entity9.setTestName("TEST8");
		entity9.setTestId(9L);
		dao.save(entity9);
		TestEntity entity10 = new TestEntity();
		entity10.setTestName("test8999");
		entity10.setTestId(10L);
		dao.save(entity10);
		dao.flush();
		List<TestEntity> result = dao.queryIn(TestEntity.class, "testId", new Object[]{8l,9l});
		assertTrue(result != null && result.size() == 2);
	}



	@Test
	public void testQueryByExampleClassOfTTPagination() {
		dao.nativeDelete("delete from t_test_table", null);
		dao.flush();
		TestEntity entity8 = new TestEntity();
		entity8.setTestName("test8");
		entity8.setTestId(8L);
		dao.save(entity8);
		TestEntity entity9 = new TestEntity();
		entity9.setTestName("test8");
		entity9.setTestId(9L);
		dao.save(entity9);
		TestEntity entity10 = new TestEntity();
		entity10.setTestName("test8");
		entity10.setTestId(10L);
		dao.save(entity10);
		dao.flush();
		PageTest page = new PageTest();
		page.setPagesize(2);
		page.setCurrentPage(1);
		Comparator comparator = new Comparator("testId",true);
		List<Comparator> comparators = new ArrayList<Comparator>();
		comparators.add(comparator);
		page.setComparatorList(comparators);
		
		TestEntity example = new TestEntity();
		example.setTestName("test8");
		List<TestEntity> result = dao.queryByExample(TestEntity.class, example, page);
		
		page.setCurrentPage(2);
		
		List<TestEntity> result2 = dao.queryByExample(TestEntity.class, example, page);
		
		assertTrue(result.get(0).getTestId() == 8L && result.get(1).getTestId() == 9l && result2.get(0).getTestId() == 10l);
	}


	@Test
	public void testQueryByExampleClassOfTTBooleanBooleanLikeMatchModePagination() {
		dao.nativeDelete("delete from t_test_table", null);
		dao.flush();
		TestEntity entity8 = new TestEntity();
		entity8.setTestName("test8");
		entity8.setTestId(8L);
		dao.save(entity8);
		TestEntity entity9 = new TestEntity();
		entity9.setTestName("TEST8");
		entity9.setTestId(9L);
		dao.save(entity9);
		TestEntity entity10 = new TestEntity();
		entity10.setTestName("test8999");
		entity10.setTestId(10L);
		dao.save(entity10);
		dao.flush();
		PageTest page = new PageTest();
		page.setPagesize(2);
		page.setCurrentPage(1);
		Comparator comparator = new Comparator("testId",true);
		List<Comparator> comparators = new ArrayList<Comparator>();
		comparators.add(comparator);
		page.setComparatorList(comparators);
		
		TestEntity example = new TestEntity();
		example.setTestName("test8");
		List<TestEntity> result = dao.queryByExample(TestEntity.class, example, true,true,LikeMatchMode.ANYWHERE,page);
		
		page.setCurrentPage(2);
		
		List<TestEntity> result2 = dao.queryByExample(TestEntity.class, example, true,true,LikeMatchMode.ANYWHERE,page);
		
		assertTrue(result.get(0).getTestId() == 8L && result.get(1).getTestId() == 9l && result2.get(0).getTestId() == 10l);
	}

	@Test
	public void testNativeQuery4SingleResult() {
		TestEntity entity8 = new TestEntity();
		entity8.setTestName("test8");
		entity8.setTestId(8L);
		dao.save(entity8);
		dao.flush();
		TestEntity result = dao.nativeQuery4SingleResult(TestEntity.class, "select * from t_test_table where id = ?", new Object[]{entity8.getEntityId()});
		assertNotNull(result);
	}

	@Test
	public void testNativeQuery() {
		TestEntity entity8 = new TestEntity();
		entity8.setTestName("test8");
		entity8.setTestId(8L);
		dao.save(entity8);
		dao.flush();
		List<TestEntity> result = dao.nativeQuery(TestEntity.class, "select * from t_test_table where test_name = ? and test_id = ?", new Object[]{"test8",8l});
		assertTrue(result != null && result.size() >= 1);
	}
	
	@Test
	public void testNativeQueryEntityClass() {

		List<TestEntity> result = dao.nativeQuery(TestEntity.class, "select test_name,test_id from t_test_table where test_name = :testName and test_id = :testId",new String[]{"testName","testId"} ,new Object[]{"test8",8l});
		
		assertTrue(result != null && result.size() >= 1);
	}
	
	@Test
	public void testNativeQueryAll() {
		String sql = "select test_name,test_id from t_test_table where test_id in (:ids) and test_name != :testName";
		Object[] ids = new Object[]{1,3,8};
		List<Object[]> rows = dao.nativeQuery(sql, new String[]{"ids","testName"}, new Object[]{ids,"test4"});
		
		assertTrue(rows.size() == 8);
	}

	@Test
	public void testExecuteStoreProcedure() {
		StoreProcedureParam param1 = new StoreProcedureParam(ParamMode.IN,"test",String.class);
		StoreProcedureParam param2 = new StoreProcedureParam(ParamMode.IN,5,Integer.class);
		StoreProcedureParam param3 = new StoreProcedureParam(ParamMode.IN,6,Integer.class);
		StoreProcedureParam param4 = new StoreProcedureParam(ParamMode.OUT,null,String.class);
		StoreProcedureParam param5 = new StoreProcedureParam(ParamMode.OUT,null,Integer.class);
		StoreProcedureParam param6 = new StoreProcedureParam(ParamMode.OUT,null,Integer.class);
		StoreProcedureParam[] params = new StoreProcedureParam[]{param1,param2,param3,param4,param5,param6};
		dao.executeStoreProcedure("p_test", params);
		assertTrue("test".equals(params[3].getValue())  &&  (Integer)params[4].getValue() == 5 &&  (Integer)params[5].getValue() == 6);
	}


}

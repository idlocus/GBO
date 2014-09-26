package com.cicc.gaf.datadictionary;

import static org.junit.Assert.assertTrue;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cicc.gaf.datadictionary.service.DataDictionaryService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "applicationContext.xml",
		"spring_servlet.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
@Transactional
public class DataDictionaryImplTest {

	@Autowired
	private DataDictionaryService ds;

	@Test
	public void testGetMapString() {
		Map<String, Object> data = ds.getMap("sex");
		assertTrue(data != null && data.containsKey("F")
				&& data.containsKey("M") && data.get("F").equals("Female")
				&& data.get("M").equals("Male"));
	}

	@Test
	public void testGetMapStringStringString() {
		Map<String, Object> data = ds.getMap("t_location", "location_name",
				"firm_id");

		assertTrue(data != null && data.containsKey("BJ")
				&& data.containsKey("HK")
				&& ((BigDecimal) data.get("BJ")).intValue() == 1
				&& ((BigDecimal) data.get("HK")).intValue() == 2);
	}

	@Test
	public void testGetDisplayValueByKeyValue() {
		Object value = ds.getDisplayValueByKeyValue("side", "S");
		assertTrue(value != null && value.equals("Sell"));
	}

	@Test
	public void testGetDisplayValueByKeyValue2() {
		Object value = ds.getDisplayValueByKeyValue("t_location", "entity_id",
				"location_name", "4");
		assertTrue(value != null && value.equals("HK"));
	}

	@Test
	public void testGetDisplayValueByKeyValue3() {
		Object[] value = ds.getDisplayValueByKeyValue("t_location",
				"entity_id", new String[] { "location_name", "firm_id" }, "1");
		assertTrue(value != null && value.length == 2 && value[0].equals("BJ")
				&& ((BigDecimal) value[1]).equals(BigDecimal.ONE));
	}

	@Test
	public void testAutocompletion() {
		List<AutoCompletionDataElement> data = ds.getMapByCretiria("t_market",
				"entity_id", "market_code", "C", 4);
		assertTrue(data != null);
	}
}

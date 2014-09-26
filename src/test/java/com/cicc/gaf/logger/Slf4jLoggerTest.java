package com.cicc.gaf.logger;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author Guo Hua
 * @version 下午1:44:10 2014年8月27日 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:WebContent/WEB-INF/applicationContext.xml")
public class Slf4jLoggerTest {
	
	public static Logger logger = LoggerFactory.getLogger(Slf4jLoggerTest.class);
	
	@Test
	public void test() {
		logger.debug("test debug");
	}

}

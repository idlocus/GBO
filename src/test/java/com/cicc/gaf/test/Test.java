package com.cicc.gaf.test;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cicc.gaf.logger.Logger;
import com.cicc.gaf.logger.LoggerFactory;

@RestController
public class Test {

	public static Logger log = LoggerFactory.getLogger(Test.class);

/*	@RequestMapping(method = RequestMethod.GET, value = "/c/{?}")
	public void getIndexPage() {
		log.info("test");
	}

	
	@RequestMapping(method = RequestMethod.GET, value = "/c/d")
	public void getIndexPage2() {
		log.info("test2");
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/{?}/{?}")
	public void getIndexPage3() {
		log.info("test3");
	}*/
	
	
/*	@RequestMapping(method = RequestMethod.GET, value = "/c/{?}")
	public void getIndexPage4() {
		log.info("test4");
	}*/
	
}

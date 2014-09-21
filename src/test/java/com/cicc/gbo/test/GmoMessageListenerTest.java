package com.cicc.gbo.test;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author Guo Hua
 * @version 下午1:29:56 2014年9月16日 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath*:config/gbo-tps.xml"})
public class GmoMessageListenerTest {

	public static void main(String args[]) {
	}
}

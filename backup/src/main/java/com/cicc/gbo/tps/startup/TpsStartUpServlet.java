package com.cicc.gbo.tps.startup;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * @author Guo Hua
 * @version 上午11:15:50 2014年9月16日 
 */
public class TpsStartUpServlet implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("TpsStartUp...");
		TpsStartUp tsu = new TpsStartUp();
		tsu.start();
	}
	

}

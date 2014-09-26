package com.cicc.gbo.core.component;
/**
 * @author Guo Hua
 * @version 下午1:53:01 2014年9月10日 
 */
public interface Service {
	boolean init();
	boolean isInitiated();
	
	boolean start();
	boolean isStarted();
	
	boolean stop();
	boolean isStopped();
}

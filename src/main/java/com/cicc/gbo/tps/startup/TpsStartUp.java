package com.cicc.gbo.tps.startup;

import java.util.concurrent.Semaphore;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cicc.gaf.logger.Logger;
import com.cicc.gaf.logger.LoggerFactory;
import com.cicc.gbo.core.component.Service;


/**
 * @author Yang Li
 * @create Mar 15, 2011
 */

public class TpsStartUp {
	protected ClassLoader fixnetworkClassLoader = null;
	private final static Logger logger = LoggerFactory.getLogger(TpsStartUp.class);
	private static TpsStartUp daemon = null;
	private boolean waitingForever = false;
	private String configureFile = "classpath*:spring_tps.xml";
	private Service service = null;
	/**
	 * Use shutdown hook flag.
	 */
	protected boolean useShutdownHook = true;

	/**
	 * Shutdown hook.
	 */
	protected Thread shutdownHook = null;

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			if (daemon == null) {
				TpsStartUp startup = new TpsStartUp();
				daemon = startup;
			}
			String command = "start";
			if (args.length > 0){
				if(args.length == 1) {
					command = args[args.length - 1];
				}
				else if (args.length == 2){
					command = args[0];
					daemon.configureFile = args[1];
				}
			}

			if (command.equals("start")) {
				daemon.registerShutdownHook();
				daemon.start();
				daemon.startWaitingForever();
			} else if (command.equals("stop")) {
				daemon.stop();
			} else {
				logger.warn("Startup: command \"" + command + "\" does not exist.");
			}

		} catch (Exception e) {
			handleThrowable(e);
			e.printStackTrace();
		} catch (Throwable t) {
			handleThrowable(t);
			t.printStackTrace();
		}

	}
	private void registerShutdownHook(){
		Runtime.getRuntime().addShutdownHook(new Thread() {
			public void run() {
				logger.info("Tps was shut down!");
				try {
					daemon.stop();
				} catch (Exception e1) {
					logger.error("can not update balancer status!");
					e1.printStackTrace();
				}

			}
		});

	}
	private static void handleThrowable(Throwable t) {
		//AlertMessageUtil.sendMessageAlert("cicc fix network", " cicc fix network start failed!");
		if (t instanceof ThreadDeath) {
			throw (ThreadDeath) t;
		}
		if (t instanceof VirtualMachineError) {
			throw (VirtualMachineError) t;
		}

	}

	public void startWaitingForever() {
		waitingForever = true;
		try {
			logger.debug("Starting to wait forever");
			new Semaphore(0).acquire();
		} catch (InterruptedException e) {
			logger.debug("Exception in sema wait:" + e.getLocalizedMessage());
		} finally {
			waitingForever = false;
		}
	}

	public void stop() {
		try {
			if(service != null){
				if(service.isStarted()){
					service.stop();
				}
			}
			
		} catch (Exception e) {
			handleThrowable(e);
			e.printStackTrace();
		} catch (Throwable t) {
			handleThrowable(t);
			t.printStackTrace();
		}
	}

	public void start() {
		try {
			ClassLoader oldClassLoader = Thread.currentThread().getContextClassLoader();
	
			@SuppressWarnings("resource")
			ApplicationContext context = new ClassPathXmlApplicationContext(configureFile);

			service = (Service) context.getBean("service");
			if(service != null){
				service.init();
				if(service.isInitiated()){
					service.start();
				}
				
			}
			
			Thread.currentThread().setContextClassLoader(oldClassLoader);

			try {
				// Register shutdown hook
				if (useShutdownHook) {
					if (shutdownHook == null) {
						shutdownHook = new BackOfficeShutdownHook();
					}
					Runtime.getRuntime().addShutdownHook(shutdownHook);
				}
			} catch (Throwable t) {
				logger.warn("error when register shutdown hook:" + t.getMessage());
			}
		} catch (Exception e) {
			handleThrowable(e);
			e.printStackTrace();
		} catch (Throwable t) {
			handleThrowable(t);
			t.printStackTrace();
		}

	}

	protected class BackOfficeShutdownHook extends Thread {

		@Override
		public void run() {
			try {
				logger.info("Start to stop fix network!");
				TpsStartUp.this.stop();
				logger.info("End to stop fix network!");

			} catch (Throwable ex) {
				logger.info("Exception when stop fix network:" + ex.getMessage());
			} finally {
				logger.info("finish stopping fix network!");
			}
		}
	}

}

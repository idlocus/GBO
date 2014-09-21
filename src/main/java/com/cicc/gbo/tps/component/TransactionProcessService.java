package com.cicc.gbo.tps.component;

import java.util.List;

import org.springframework.stereotype.Component;

import com.cicc.gaf.logger.Logger;
import com.cicc.gaf.logger.LoggerFactory;
import com.cicc.gbo.core.component.ProcessService;
import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.process.WorkFlow;
import com.cicc.gbo.core.process.WorkFlowLocator;


/**
 * @author Guo Hua
 * @version 下午1:54:27 2014年9月10日 
 */
@Component
public class TransactionProcessService implements ProcessService {
	
	private static Logger logger = LoggerFactory.getLogger(TransactionProcessService.class);
	
	private WorkFlowLocator workFlowLocator;
	

	public WorkFlowLocator getWorkFlowLocator() {
		return workFlowLocator;
	}

	public void setWorkFlowLocator(WorkFlowLocator workFlowLocator) {
		this.workFlowLocator = workFlowLocator;
	}

	@Override
	public boolean init() {
		logger.info("TransactionProcessService initiating...");
		return true;
	}

	@Override
	public boolean isInitiated() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean start() {
		logger.info("TransactionProcessService starting...");
		return false;
	}

	@Override
	public boolean isStarted() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean stop() {
		logger.info("TransactionProcessService stoping...");
		return false;
	}

	@Override
	public boolean isStopped() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void process(ProcessObject processObject) {
		List<WorkFlow> workFlowList = workFlowLocator
				.getWorkFlow(processObject);
		for (WorkFlow workFlow : workFlowList) {
			workFlow.process(processObject);
		}
	}
}

package com.cicc.gbo.core.process;

import java.util.ArrayList;
import java.util.List;

import com.cicc.gbo.core.model.ProcessObject;

/**
 * @author Guo Hua
 * @version 下午2:43:38 2014年9月10日 
 */
public abstract class WorkFlowImpl implements WorkFlow {
	
	String workFlowName;
	List<Processor> processList = new ArrayList<Processor>();

	public String getWorkFlowName() {
		return workFlowName;
	}

	public void setWorkFlowName(String workFlowName) {
		this.workFlowName = workFlowName;
	}
	
	public List<Processor> getProcessList() {
		return processList;
	}

	public void setProcessList(List<Processor> processList) {
		this.processList = processList;
	}

	@Override
	public boolean isSuitable(ProcessObject processObject) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void process(ProcessObject processObject) {
		try {
			for (Processor processor : processList) {
				processor.process(processObject);
			}	
		} catch (Exception e) {
			
		}
	}
}

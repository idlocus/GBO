package com.cicc.gbo.core.process;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.cicc.gbo.core.model.ProcessObject;

/**
 * @author Guo Hua
 * @version 下午2:40:22 2014年9月10日 
 */
public class AbstractWorkFlowLocator implements WorkFlowLocator {
	List<WorkFlow> workFlowList;
	HashMap<String, List<WorkFlow>> workFlowMap = new HashMap<String, List<WorkFlow>>();
	

	public List<WorkFlow> getWorkFlowList() {
		return workFlowList;
	}



	public void setWorkFlowList(List<WorkFlow> workFlowList) {
		this.workFlowList = workFlowList;
	}



	@Override
	public List<WorkFlow> getWorkFlow(ProcessObject processObject) {
		List<WorkFlow> suitableWorkFlowList = new ArrayList<WorkFlow>();

		for (WorkFlow workFlow : workFlowList) {
			if (workFlow.isSuitable(processObject)) {
				suitableWorkFlowList.add(workFlow);
			}
		}
		return suitableWorkFlowList;
	}

}

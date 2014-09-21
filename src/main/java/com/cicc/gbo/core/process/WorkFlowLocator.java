package com.cicc.gbo.core.process;

import java.util.List;

import com.cicc.gbo.core.model.ProcessObject;


/**
 * @author Guo Hua
 * @version 下午2:34:10 2014年9月10日 
 */
public interface WorkFlowLocator {
	List<WorkFlow> getWorkFlow(ProcessObject processObject);
}

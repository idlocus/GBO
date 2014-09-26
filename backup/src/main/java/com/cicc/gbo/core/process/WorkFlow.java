package com.cicc.gbo.core.process;

import com.cicc.gbo.core.model.ProcessObject;


/**
 * @author Guo Hua
 * @version 下午2:34:35 2014年9月10日 
 */
public interface WorkFlow {
	boolean isSuitable(ProcessObject processObject);
	void process(ProcessObject processObject);
}

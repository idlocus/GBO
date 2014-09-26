package com.cicc.gbo.core.component;

import com.cicc.gbo.core.model.ProcessObject;

/**
 * @author Guo Hua
 * @version 下午2:02:50 2014年9月10日 
 */
public interface ProcessService extends Service {
	void process(ProcessObject processObject);
}

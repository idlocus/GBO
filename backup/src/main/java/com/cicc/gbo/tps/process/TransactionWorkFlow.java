package com.cicc.gbo.tps.process;

import org.springframework.stereotype.Component;

import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.process.WorkFlowImpl;

/**
 * @author Guo Hua
 * @version 上午9:59:22 2014年9月16日 
 */
@Component
public class TransactionWorkFlow extends WorkFlowImpl {
	@Override
	public boolean isSuitable(ProcessObject processObject) {		
		return true;
	}
}

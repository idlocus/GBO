package com.cicc.gbo.core.capturer;

import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;

/**
 * @author Guo Hua
 * @version 下午2:54:05 2014年9月10日 
 */
public abstract class AbstractCapturer implements Capturer {

	@Override
	public boolean capture(TransactionBaseEntity transactionEntity) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean capture(ProcessObject processObject) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void clearCache() {
		// TODO Auto-generated method stub
		
	}

}

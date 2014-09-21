package com.cicc.gbo.core.capturer;

import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;


/**
 * @author Guo Hua
 * @version 下午2:51:52 2014年9月10日 
 */
public interface Capturer {
	public boolean capture(TransactionBaseEntity transactionEntity);
	public boolean capture(ProcessObject processObject);
	public void clearCache();
}

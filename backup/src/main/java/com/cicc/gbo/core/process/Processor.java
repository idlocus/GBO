package com.cicc.gbo.core.process;

import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;

/**
 * @author Guo Hua
 * @version 下午7:22:25 2014年9月21日 
 */
public interface Processor {
	public boolean process(ProcessObject processObject);
	public boolean processException(TransactionBaseEntity processTransaction, Exception e);
}

package com.cicc.gbo.core.generator;

import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;


/**
 * @author Guo Hua
 * @version 下午3:30:06 2014年9月10日 
 */
public interface Generator {
	public boolean generate(ProcessObject processObject);
	public boolean generate(TransactionBaseEntity transactionEntity);
}

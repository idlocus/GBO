package com.cicc.gbo.core.enricher;

import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;


/**
 * @author Guo Hua
 * @version 下午3:28:51 2014年9月10日 
 */
public interface Enricher {
	public boolean enrich(TransactionBaseEntity transactionEntity);
	public boolean enrich(ProcessObject processObject);
}

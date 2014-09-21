package com.cicc.gbo.core.enricher;

import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;

/**
 * @author Guo Hua
 * @version 下午3:29:28 2014年9月10日 
 */
public abstract class AbstractEnricher implements Enricher {

	@Override
	public boolean enrich(TransactionBaseEntity transactionEntity) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean enrich(ProcessObject processObject) {
		// TODO Auto-generated method stub
		return false;
	}

}

package com.cicc.gbo.tps.enricher;

import com.cicc.gbo.core.enricher.AbstractEnricher;
import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionEntity;

/**
 * @author Guo Hua
 * @version 上午10:29:11 2014年9月15日 
 */
public class TransactionEnricher extends AbstractEnricher {

	@Override
	public boolean enrich(TransactionEntity processTransaction, ProcessObject processObject) {	
		try {
			if (processTransaction.getPrimaryAccountLocation() == null) {
				processTransaction.setPrimaryAccountLocation("BJ");
			}
		} catch (Exception e) {
			this.processException(processTransaction, e);
			return false;
		}
		return true;
	}
}

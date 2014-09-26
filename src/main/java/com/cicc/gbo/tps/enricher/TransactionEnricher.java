package com.cicc.gbo.tps.enricher;

import com.cicc.gbo.core.enricher.AbstractEnricher;
import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionEntity;
import com.cicc.gbo.core.shared.RecordRemarkConstants;
import com.cicc.gbo.core.shared.RecordStatus;

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
			processTransaction.setRecordStatus(RecordStatus.FAILURE.name());
			processTransaction.setRecordRemark(RecordRemarkConstants.ERROR_TRANSACTION_CONDITION);
			return false;
		}
		return true;
	}
}

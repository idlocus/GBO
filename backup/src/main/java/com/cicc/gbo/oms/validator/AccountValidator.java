package com.cicc.gbo.oms.validator;

import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.shared.RecordRemarkConstants;
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.core.validator.AbstractValidator;
import com.cicc.gbo.tps.model.TransactionEntity;

/**
 * @author Guo Hua
 * @version 下午3:39:50 2014年9月18日 
 */
public class AccountValidator extends AbstractValidator {

	@Override
	public boolean validate(TransactionEntity processTransaction, 
			ProcessObject processObject) {
		if (processTransaction.getVersusAccountId() == null) {
			processTransaction.setRecordStatus(RecordStatus.INVALID.name());
			processTransaction.setRecordRemark(RecordRemarkConstants.INVALID_ACCT_FIELD);
		}
		return true;
	}
}

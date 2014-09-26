package com.cicc.gbo.oms.validator;

import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionEntity;
import com.cicc.gbo.core.shared.RecordRemarkConstants;
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.core.validator.AbstractValidator;

/**
 * @author Guo Hua
 * @version 下午3:41:17 2014年9月18日 
 */
public class ExchangeValidator extends AbstractValidator {

	@Override
	public boolean validate(TransactionEntity processTransaction, 
			ProcessObject processObject) {
		try {
			if (processTransaction.getVersusAccountId() == null) {
				processTransaction.setRecordStatus(RecordStatus.INVALID.name());
				processTransaction.setRecordRemark(RecordRemarkConstants.INVALID_ACCT_FIELD);
			}
		} catch (Exception e) {
			this.processException(processTransaction, e);
		}
		return true;
	}
}

package com.cicc.gbo.tps.validator;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;
import com.cicc.gbo.core.shared.RecordRemarkConstants;
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.core.validator.AbstractValidator;
import com.cicc.gbo.tps.model.TransactionEntity;

/**
 * @author Guo Hua
 * @version 下午7:53:37 2014年9月14日 
 */
public class TransactionValidator extends AbstractValidator {

	@Override
	public boolean validate(ProcessObject processObject) {
		List<? extends TransactionBaseEntity> processTransactionList = processObject.getProcessTransactionList();
		if(CollectionUtils.isNotEmpty(processTransactionList)){
			for (TransactionBaseEntity processTransaction : processTransactionList) {
				if (processTransaction.getRecordStatus().equalsIgnoreCase(RecordStatus.ACTIVE.name())) {
					if (processTransaction instanceof TransactionEntity) {
						this.validate((TransactionEntity) processTransaction, processObject);
					} else {
						processTransaction.setRecordStatus(RecordStatus.ERROR.name());
					}
				}
			}
		}
		return true;
	}
	
	public boolean validate(TransactionEntity transactionEntity, ProcessObject processObject) {
		if (transactionEntity.getVersusAccountId() == null) {
			transactionEntity.setRecordStatus(RecordStatus.INVALID.name());
			transactionEntity.setRecordRemark(RecordRemarkConstants.INVALID_ACCT_FIELD);
		}
		return true;
	}

}

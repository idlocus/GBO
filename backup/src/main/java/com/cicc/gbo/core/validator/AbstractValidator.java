package com.cicc.gbo.core.validator;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.cicc.gbo.core.exception.BusinessErrorCode;
import com.cicc.gbo.core.exception.BusinessException;
import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;
import com.cicc.gbo.core.process.AbstractProcessor;
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.tps.model.TransactionEntity;

/**
 * @author Guo Hua
 * @version 下午3:28:02 2014年9月10日 
 */
public abstract class AbstractValidator extends AbstractProcessor implements Validator {

	@Override
	public boolean process(ProcessObject processObject) {
		return this.validate(processObject);
	}
	
	@Override
	public boolean validate(ProcessObject processObject) {
		List<? extends TransactionBaseEntity> processTransactionList = processObject.getProcessTransactionList();
		if(CollectionUtils.isNotEmpty(processTransactionList)){
			for (TransactionBaseEntity processTransaction : processTransactionList) {
				if (processTransaction.getRecordStatus().equalsIgnoreCase(RecordStatus.ACTIVE.name())) {
					if (processTransaction instanceof TransactionEntity) {
						this.validate((TransactionEntity) processTransaction, processObject);
					} else {
						this.processException(processTransaction, new BusinessException(BusinessErrorCode.VALIDATE_UN_KNOWN_TYPE));
					}
				}
			}
		}
		return true;
	}
	

	public abstract boolean validate(TransactionEntity processTransaction, ProcessObject processObject);
}

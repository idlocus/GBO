package com.cicc.gbo.core.capturer;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.cicc.gbo.core.exception.BusinessErrorCode;
import com.cicc.gbo.core.exception.BusinessException;
import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;
import com.cicc.gbo.core.model.TransactionEntity;
import com.cicc.gbo.core.process.AbstractProcessor;
import com.cicc.gbo.core.shared.RecordStatus;


/**
 * @author Guo Hua
 * @version 下午2:54:05 2014年9月10日 
 */
public abstract class AbstractCapturer extends AbstractProcessor implements Capturer {

	@Override
	public boolean process(ProcessObject processObject) {
		return this.capture(processObject);
	}

	@Override
	public boolean capture(ProcessObject processObject) {
		List<? extends TransactionBaseEntity> processTransactionList = processObject.getProcessTransactionList();
		if(CollectionUtils.isNotEmpty(processTransactionList)){
			for (TransactionBaseEntity processTransaction : processTransactionList) {
				if (processTransaction.getRecordStatus().equalsIgnoreCase(RecordStatus.ACTIVE.name())) {
					if (processTransaction instanceof TransactionEntity) {
						this.capture((TransactionEntity) processTransaction, processObject);
					} else {
						this.processException(processTransaction, new BusinessException(BusinessErrorCode.CAPTURE_UN_KNOWN_TYPE));
					}
				}
			}
		}
		return true;
	}

	public abstract boolean capture(TransactionEntity processTransaction, ProcessObject processObject);

}

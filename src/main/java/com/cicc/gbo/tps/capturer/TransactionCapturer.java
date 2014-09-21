package com.cicc.gbo.tps.capturer;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.cicc.gbo.core.capturer.AbstractCapturer;
import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;
import com.cicc.gbo.core.service.AuditableBaseService;
import com.cicc.gbo.core.shared.RecordRemarkConstants;
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.tps.model.TransactionEntity;

/**
 * @author Guo Hua
 * @version 下午5:53:01 2014年9月15日 
 */
public class TransactionCapturer extends AbstractCapturer {
	
	private boolean autoSave;
	@Autowired
	AuditableBaseService transactionBaseService;

	public boolean isAutoSave() {
		return autoSave;
	}

	public void setAutoSave(boolean autoSave) {
		this.autoSave = autoSave;
	}

	public boolean capture(TransactionBaseEntity transactionEntity, ProcessObject processObject) {
		if (autoSave) {
			transactionBaseService.updateAndCreate(transactionEntity);
		}
		return true;
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
						processTransaction.setRecordStatus(RecordStatus.ERROR.name());
						processTransaction.setRecordRemark(RecordRemarkConstants.ERROR_CAPTURE_TRANSACTION_TYPE);
					}
				}
			}
		}
		return true;
	}
}

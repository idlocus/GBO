package com.cicc.gbo.tps.capturer;

import org.springframework.beans.factory.annotation.Autowired;

import com.cicc.gbo.core.capturer.AbstractCapturer;
import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.service.AuditableBaseService;
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

	@Override
	public boolean capture(TransactionEntity processTransaction, ProcessObject processObject) {
		try {
			if (autoSave) {
				transactionBaseService.updateAndCreate(processTransaction);
			}
		} catch (Throwable e) {
			
		}
		return true;
	}

}

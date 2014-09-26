package com.cicc.gbo.core.generator;

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
 * @version 上午10:34:30 2014年9月15日 
 */
public abstract class AbstractGenerator extends AbstractProcessor implements Generator {
	
	@Override
	public boolean process(ProcessObject processObject) {
		return this.generate(processObject);
	}
	
	@Override
	public boolean generate(ProcessObject processObject) {
		List<? extends TransactionBaseEntity> processTransactionList = processObject.getProcessTransactionList();
		if(CollectionUtils.isNotEmpty(processTransactionList)){
			for (TransactionBaseEntity processTransaction : processTransactionList) {
				if (processTransaction.getRecordStatus().equalsIgnoreCase(RecordStatus.ACTIVE.name())) {
					if (processTransaction instanceof TransactionEntity) {
						this.generate((TransactionEntity) processTransaction, processObject);
					} else {
						this.processException(processTransaction, new BusinessException(BusinessErrorCode.GENERATE_UN_KNOWN_TYPE));
					}
				}
			}
		}
		return true;
	}
	
	public abstract boolean generate(TransactionEntity processTransaction, ProcessObject processObject);
	
}

package com.cicc.gbo.core.figurator;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.cicc.gbo.core.exception.BusinessErrorCode;
import com.cicc.gbo.core.exception.BusinessException;
import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;
import com.cicc.gbo.core.process.AbstractProcessor;
import com.cicc.gbo.core.shared.RecordStatus;
import com.cicc.gbo.tps.model.Trade;

/**
 * @author Guo Hua
 * @version 上午10:30:21 2014年9月15日 
 */
public abstract class AbstractFigurator extends AbstractProcessor implements Figurator {

	@Override
	public boolean process(ProcessObject processObject) {
		return this.figure(processObject);
	}
	
	@Override
	public boolean figure(ProcessObject processObject) {
		List<? extends TransactionBaseEntity> processTransactionList = processObject.getResultTransactionList();
		if(CollectionUtils.isNotEmpty(processTransactionList)){
			for (TransactionBaseEntity processTransaction : processTransactionList) {
				if (processTransaction.getRecordStatus().equalsIgnoreCase(RecordStatus.ACTIVE.name())) {
					if (processTransaction instanceof Trade) {
						this.figure((Trade) processTransaction, processObject);
					} else {
						this.processException(processTransaction, new BusinessException(BusinessErrorCode.FIGURE_UN_KNOWN_TYPE));
					}
				}
			}
		}
		return true;
	}
	
	public abstract boolean figure(Trade processTransaction, ProcessObject processObject);
}

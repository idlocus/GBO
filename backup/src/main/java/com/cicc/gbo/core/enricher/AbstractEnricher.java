package com.cicc.gbo.core.enricher;

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
 * @version 下午3:29:28 2014年9月10日 
 */
public abstract class AbstractEnricher extends AbstractProcessor implements Enricher {
	
	@Override
	public boolean process(ProcessObject processObject) {
		return this.enrich(processObject);
	}
	
	@Override
	public boolean enrich(ProcessObject processObject) {
		List<? extends TransactionBaseEntity> processTransactionList = processObject.getProcessTransactionList();
		if(CollectionUtils.isNotEmpty(processTransactionList)){
			for (TransactionBaseEntity processTransaction : processTransactionList) {
				if (processTransaction.getRecordStatus().equalsIgnoreCase(RecordStatus.ACTIVE.name())) {
					if (processTransaction instanceof TransactionEntity) {
						this.enrich((TransactionEntity) processTransaction, processObject);
					} else {
						this.processException(processTransaction, new BusinessException(BusinessErrorCode.ENRICH_UN_KNOWN_TYPE));
					}
				}
			}
		}
		return true;
	}
	
	public abstract boolean enrich(TransactionEntity processTransaction, ProcessObject processObject);

}

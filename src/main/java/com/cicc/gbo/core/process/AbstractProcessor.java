package com.cicc.gbo.core.process;

import com.cicc.gaf.logger.Logger;
import com.cicc.gaf.logger.LoggerFactory;
import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;
import com.cicc.gbo.core.shared.RecordStatus;

/**
 * @author Guo Hua
 * @version 下午2:37:30 2014年9月22日 
 */
public abstract class AbstractProcessor implements Processor {
	
	private static final Logger logger = LoggerFactory.getLogger(AbstractProcessor.class);
	
	public abstract boolean process(ProcessObject processObject);

	@Override
	public boolean processException(TransactionBaseEntity processTransaction, Exception e) {
		processTransaction.setRecordStatus(RecordStatus.ERROR.name());
		processTransaction.setRecordRemark(e.getMessage());
		logger.error(e);
		return false;
	}
}

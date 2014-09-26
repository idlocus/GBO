package com.cicc.gbo.tps.process;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;
import com.cicc.gbo.core.process.AbstractProcessor;
import com.cicc.gbo.core.service.TransactionBaseService;

/**
 * @author Guo Hua
 * @version 下午1:52:01 2014年9月26日 
 */
@Component
public class TransactionPostProcessor extends AbstractProcessor {
	
	@Autowired
	TransactionBaseService transactionBaseService;

	@Override
	public boolean process(ProcessObject processObject) {
		try {
			List<? extends TransactionBaseEntity> processTransactionList = processObject.getProcessTransactionList();
			List<? extends TransactionBaseEntity> resultTransactionList = processObject.getResultTransactionList();
			if(CollectionUtils.isNotEmpty(processTransactionList)){
				transactionBaseService.createAndUpdate(processTransactionList);
				transactionBaseService.createAndUpdate(resultTransactionList);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

}

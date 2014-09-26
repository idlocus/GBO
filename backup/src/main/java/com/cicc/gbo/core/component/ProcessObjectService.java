package com.cicc.gbo.core.component;

import java.util.List;

import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;

/**
 * @author Guo Hua
 * @version 下午8:21:13 2014年9月14日 
 */
public interface ProcessObjectService {
	public void addErrorTransaction(ProcessObject processObject, List<? extends TransactionBaseEntity> transactionBaseList);
	public void addInvalidTransaction(ProcessObject processObject, List<? extends TransactionBaseEntity> transactionBaseList);
	public void addResultTransaction(ProcessObject processObject, List<? extends TransactionBaseEntity> transactionBaseList);
}

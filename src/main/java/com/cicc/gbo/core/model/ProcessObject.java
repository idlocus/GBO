package com.cicc.gbo.core.model;

import java.util.List;

/**
 * @author Guo Hua
 * @version 下午2:04:14 2014年9月10日 
 */
public class ProcessObject {

	List<? extends TransactionBaseEntity> processTransactionList;
	
	List<? extends TransactionBaseEntity> invalidTransactionList;
	
	List<? extends TransactionBaseEntity> errorTransactionList;

	List<? extends TransactionBaseEntity> resultTransactionList;

	public List<? extends TransactionBaseEntity> getProcessTransactionList() {
		return processTransactionList;
	}

	public void setProcessTransactionList(
			List<? extends TransactionBaseEntity> processTransactionList) {
		this.processTransactionList = processTransactionList;
	}
	
	public List<? extends TransactionBaseEntity> getInvalidTransactionList() {
		return invalidTransactionList;
	}

	public void setInvalidTransactionList(
			List<? extends TransactionBaseEntity> invalidTransactionList) {
		this.invalidTransactionList = invalidTransactionList;
	}
	
	public List<? extends TransactionBaseEntity> getErrorTransactionList() {
		return errorTransactionList;
	}

	public void setErrorTransactionList(
			List<? extends TransactionBaseEntity> errorTransactionList) {
		this.errorTransactionList = errorTransactionList;
	}

	public List<? extends TransactionBaseEntity> getResultTransactionList() {
		return resultTransactionList;
	}

	public void setResultTransactionList(
			List<? extends TransactionBaseEntity> resultTransactionList) {
		this.resultTransactionList = resultTransactionList;
	}

	
}

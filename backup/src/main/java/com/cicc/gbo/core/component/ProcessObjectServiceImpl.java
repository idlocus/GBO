package com.cicc.gbo.core.component;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.ListUtils;
import org.springframework.stereotype.Component;

import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;

/**
 * @author Guo Hua
 * @version 下午8:28:08 2014年9月14日 
 */
@Component
public class ProcessObjectServiceImpl implements ProcessObjectService {

	@Override
	public void addErrorTransaction(ProcessObject processObject,
			List<? extends TransactionBaseEntity> transactionBaseList) {
		try {
			if (CollectionUtils.isNotEmpty(transactionBaseList)) {
				List<? extends TransactionBaseEntity> existingList = processObject.getErrorTransactionList();
				if (CollectionUtils.isNotEmpty(existingList)) {
					processObject.setErrorTransactionList(transactionBaseList);
				} else {
					@SuppressWarnings("unchecked")
					List<? extends TransactionBaseEntity> result = ListUtils.union(existingList, transactionBaseList);
					processObject.setErrorTransactionList(result);
				}
			}
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void addInvalidTransaction(ProcessObject processObject,
			List<? extends TransactionBaseEntity> transactionBaseList) {
		try {
			if (CollectionUtils.isNotEmpty(transactionBaseList)) {
				List<? extends TransactionBaseEntity> existingList = processObject.getErrorTransactionList();
				if (CollectionUtils.isNotEmpty(existingList)) {
					processObject.setInvalidTransactionList(transactionBaseList);
				} else {
					@SuppressWarnings("unchecked")
					List<? extends TransactionBaseEntity> result = ListUtils.union(existingList, transactionBaseList);
					processObject.setInvalidTransactionList(result);
				}
			}
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void addResultTransaction(ProcessObject processObject,
			List<? extends TransactionBaseEntity> transactionBaseList) {
		try {
			if (CollectionUtils.isNotEmpty(transactionBaseList)) {
				List<? extends TransactionBaseEntity> existingList = processObject.getErrorTransactionList();
				if (CollectionUtils.isNotEmpty(existingList)) {
					@SuppressWarnings("unchecked")
					List<? extends TransactionBaseEntity> result = ListUtils.union(existingList, transactionBaseList);
					processObject.setResultTransactionList(result);
				} else {
					processObject.setResultTransactionList(transactionBaseList);
				}
			}
		} catch (Exception e) {
			throw e;
		}
	}



}

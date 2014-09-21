package com.cicc.gbo.core.validator;

import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.model.TransactionBaseEntity;

/**
 * @author Guo Hua
 * @version 下午3:28:02 2014年9月10日 
 */
public abstract class AbstractValidator implements Validator {

	@Override
	public boolean validate(TransactionBaseEntity transactionEntity) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean validate(ProcessObject processObject) {
		// TODO Auto-generated method stub
		return false;
	}

}

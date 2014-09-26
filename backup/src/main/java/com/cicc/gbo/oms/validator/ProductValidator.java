package com.cicc.gbo.oms.validator;

import com.cicc.gbo.core.model.ProcessObject;
import com.cicc.gbo.core.validator.AbstractValidator;
import com.cicc.gbo.tps.model.TransactionEntity;

/**
 * @author Guo Hua
 * @version 下午3:42:09 2014年9月18日 
 */
public class ProductValidator extends AbstractValidator {

	@Override
	public boolean validate(TransactionEntity processTransaction, 
			ProcessObject processObject) {
		return true;
	}
}

package com.cicc.gbo.core.validator;

import com.cicc.gbo.core.model.ProcessObject;


/**
 * @author Guo Hua
 * @version 下午3:26:11 2014年9月10日 
 */
public interface Validator {
	public boolean validate(ProcessObject processObject);
}

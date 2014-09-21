package com.cicc.gbo.message.parser;

import com.cicc.gbo.core.model.TransactionBaseEntity;

/**
 * @author Guo Hua
 * @version 下午3:38:39 2014年9月12日 
 */
public interface FixProtocolParser {

	public TransactionBaseEntity parseMessage(String message);
	
}

package com.cicc.gbo.core.exception;

import org.springframework.stereotype.Component;
import org.springframework.util.ErrorHandler;

import com.cicc.gaf.logger.Logger;
import com.cicc.gaf.logger.LoggerFactory;
import com.cicc.gbo.core.shared.LogMessageConstants;

/**
 * @author Guo Hua
 * @version 下午3:30:51 2014年9月17日 
 */
@Component
public class JmsExceptionHandler implements ErrorHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(JmsExceptionHandler.class);

	@Override
	public void handleError(Throwable arg0) {
		logger.error(LogMessageConstants.ERROR_JMS_LISTENER);
	}

}

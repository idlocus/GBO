package com.cicc.gbo.core.exception;
/**
 * @author Guo Hua
 * @version 下午3:58:19 2014年9月22日 
 */
public class BusinessException extends Exception {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5326286439851400608L;
	
	private BusinessErrorCode errorCode;
	
	public BusinessException(BusinessErrorCode errorCode) {
		super(errorCode.getDescription());
		this.errorCode = errorCode;
	}
	
	public BusinessErrorCode getErrorCode() {
		return errorCode;
	}
	
	public String getMessage() {
		return super.getMessage();
	}
}

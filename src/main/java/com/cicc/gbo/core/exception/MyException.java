package com.cicc.gbo.core.exception;
/**
 * @author Guo Hua
 * @version 下午2:12:58 2014年9月21日 
 */
public class MyException extends Exception {
	    
	private static final long serialVersionUID = 4664456874499611218L;
	     
    private String errorCode="Unknown_Exception";
     
    public MyException(String message, String errorCode){
        super(message);
        this.errorCode=errorCode;
    }
     
    public String getErrorCode(){
        return this.errorCode;
    }
	
}

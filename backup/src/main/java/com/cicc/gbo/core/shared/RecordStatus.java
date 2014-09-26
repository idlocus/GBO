package com.cicc.gbo.core.shared;
/**
 * @author Guo Hua
 * @version 上午10:14:33 2014年9月15日 
 */
public enum RecordStatus {
	ACTIVE("Active Record"), 	
	INACTIVE("InActive Record"), 
	INVALID("InValid Record"),
	DELETED("Deleted Record"),
	FAILURE("Failured Record"),
	ERROR("Error Record");
	
	private String desc;
	
	RecordStatus(String desc) {
		this.desc = desc;
	}
	
	public String getDescription() {
		return this.desc;
	}
}

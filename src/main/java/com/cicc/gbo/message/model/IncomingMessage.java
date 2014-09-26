package com.cicc.gbo.message.model;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author Guo Hua
 * @version 下午4:36:23 2014年9月11日 
 */
@Entity
@Table(name = "GBO_INCOMING_MESSAGE")
public class IncomingMessage extends MessageEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8893269025191136618L;

	String incomingSystemId;
	String incomingSystemName;
	
	public String getIncomingSystemId() {
		return incomingSystemId;
	}
	public void setIncomingSystemId(String incomingSystemId) {
		this.incomingSystemId = incomingSystemId;
	}
	public String getIncomingSystemName() {
		return incomingSystemName;
	}
	public void setIncomingSystemName(String incomingSystemName) {
		this.incomingSystemName = incomingSystemName;
	}
	
	
}

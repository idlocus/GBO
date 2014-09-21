package com.cicc.gbo.message.model;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.cicc.gbo.core.model.NonAuditableEntity;

/**
 * @author Guo Hua
 * @version 下午4:31:03 2014年9月11日 
 */
@MappedSuperclass
public class MessageEntity extends NonAuditableEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6097297291599336244L;
	
	String messageId;
	String systemId;
	String systemName;
	String messageServerMessageId;
	
	Date messageServerMessageTime;
	
	String messageServerIp;
	String messageServerPort;
	String messageServerUrl;
	String messageServerUser;
	
	String messageDestinationType;//Topic or Queue
	String messageDestinationName;
	
	String messageContent;
	
	String messageLob;
	
	@Id
	@GeneratedValue(generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
	public Long getEntityId() {
		return entityId;
	}

	public void setEntityId(Long entityId) {
		this.entityId = entityId;
	}

	public String getMessageId() {
		return messageId;
	}

	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}

	public String getSystemId() {
		return systemId;
	}

	public void setSystemId(String systemId) {
		this.systemId = systemId;
	}

	public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}

	public String getMessageServerMessageId() {
		return messageServerMessageId;
	}

	public void setMessageServerMessageId(String messageServerMessageId) {
		this.messageServerMessageId = messageServerMessageId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	public Date getMessageServerMessageTime() {
		return messageServerMessageTime;
	}

	public void setMessageServerMessageTime(Date messageServerMessageTime) {
		this.messageServerMessageTime = messageServerMessageTime;
	}

	public String getMessageServerIp() {
		return messageServerIp;
	}

	public void setMessageServerIp(String messageServerIp) {
		this.messageServerIp = messageServerIp;
	}

	public String getMessageServerPort() {
		return messageServerPort;
	}

	public void setMessageServerPort(String messageServerPort) {
		this.messageServerPort = messageServerPort;
	}

	public String getMessageServerUrl() {
		return messageServerUrl;
	}

	public void setMessageServerUrl(String messageServerUrl) {
		this.messageServerUrl = messageServerUrl;
	}

	public String getMessageServerUser() {
		return messageServerUser;
	}

	public void setMessageServerUser(String messageServerUser) {
		this.messageServerUser = messageServerUser;
	}

	public String getMessageDestinationType() {
		return messageDestinationType;
	}

	public void setMessageDestinationType(String messageDestinationType) {
		this.messageDestinationType = messageDestinationType;
	}

	public String getMessageDestinationName() {
		return messageDestinationName;
	}

	public void setMessageDestinationName(String messageDestinationName) {
		this.messageDestinationName = messageDestinationName;
	}

	@Lob
	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	@Lob
	public String getMessageLob() {
		return messageLob;
	}

	public void setMessageLob(String messageLob) {
		this.messageLob = messageLob;
	}
	
	
}

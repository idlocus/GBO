package com.cicc.gbo.core.model;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.MappedSuperclass;

import org.hibernate.annotations.GenericGenerator;

/**
 * @author Guo Hua
 * @version 上午9:35:36 2014年9月10日 
 */
@MappedSuperclass
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)
public class TransactionBaseEntity extends AuditableEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2998375327598272270L;
	
	public String transactionId;
	public String transactionChannel;//mobile, gui, telephone, FIX
	public String transactionSystem;//GMO, Online Trading, ebroker
	public String transactionCategory;//Trade,Voucher,Corp Action
	public String transactionBusinessCode;//Trade Create, Trade Amend, Trade Cancel, Interest, Deposit, Withdraw
	public String transactionStatus;
	public String transactionBusinessLineId;// Market Making, CF, SBL
	public String transactionFeedMethod;//Manual book, Import, Fix, other
	public String transactionBatchId;
	public Date transactionTime;
	
	@Id
	@GeneratedValue(generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
	public Long getEntityId() {
		return entityId;
	}

	public void setEntityId(Long entityId) {
		this.entityId = entityId;
	}
	
	
	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public String getTransactionChannel() {
		return transactionChannel;
	}
	public void setTransactionChannel(String transactionChannel) {
		this.transactionChannel = transactionChannel;
	}
	public String getTransactionSystem() {
		return transactionSystem;
	}
	public void setTransactionSystem(String transactionSystem) {
		this.transactionSystem = transactionSystem;
	}
	public String getTransactionCategory() {
		return transactionCategory;
	}
	public void setTransactionCategory(String transactionCategory) {
		this.transactionCategory = transactionCategory;
	}
	public String getTransactionBusinessCode() {
		return transactionBusinessCode;
	}
	public void setTransactionBusinessCode(String transactionBusinessCode) {
		this.transactionBusinessCode = transactionBusinessCode;
	}
	public String getTransactionStatus() {
		return transactionStatus;
	}
	public void setTransactionStatus(String transactionStatus) {
		this.transactionStatus = transactionStatus;
	}
	public String getTransactionBusinessLineId() {
		return transactionBusinessLineId;
	}
	public void setTransactionBusinessLineId(String transactionBusinessLineId) {
		this.transactionBusinessLineId = transactionBusinessLineId;
	}
	public String getTransactionFeedMethod() {
		return transactionFeedMethod;
	}
	public void setTransactionFeedMethod(String transactionFeedMethod) {
		this.transactionFeedMethod = transactionFeedMethod;
	}
	public String getTransactionBatchId() {
		return transactionBatchId;
	}
	public void setTransactionBatchId(String transactionBatchId) {
		this.transactionBatchId = transactionBatchId;
	}
	
	public Date getTransactionTime() {
		return transactionTime;
	}

	public void setTransactionTime(Date transactionTime) {
		this.transactionTime = transactionTime;
	}
	
	

}

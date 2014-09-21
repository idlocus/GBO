package com.cicc.gbo.tps.model;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author Guo Hua
 * @version 下午1:05:23 2014年9月10日 
 */
@Entity
@Table(name = "GBO_TRANSACTION_CONDITION")
public class TransactionConditionTemplate extends TransactionEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2323560762822016794L;

	public String conditionNumber;
	public String conditionValue;
	
	public String getConditionNumber() {
		return conditionNumber;
	}
	public void setConditionNumber(String conditionNumber) {
		this.conditionNumber = conditionNumber;
	}
	public String getConditionValue() {
		return conditionValue;
	}
	public void setConditionValue(String conditionValue) {
		this.conditionValue = conditionValue;
	}
	
	
}

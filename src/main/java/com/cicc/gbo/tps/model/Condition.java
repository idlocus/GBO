package com.cicc.gbo.tps.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.cicc.gbo.core.model.TransactionEntity;

/**
 * @author Guo Hua
 * @version 下午1:05:23 2014年9月10日 
 */
@Entity
@Table(name = "GBO_CONDITION")
public class Condition extends TransactionEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2323560762822016794L;

	public String categoryName;
	public String conditionNumber;
	public String conditionValue;
	
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
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

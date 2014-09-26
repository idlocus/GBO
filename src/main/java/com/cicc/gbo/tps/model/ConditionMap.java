package com.cicc.gbo.tps.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.cicc.gbo.core.model.AuditableEntity;

/**
 * @author Guo Hua
 * @version 下午5:10:15 2014年9月18日 
 */
@Entity
@Table(name = "GBO_CONDITION_MAP")
public class ConditionMap extends AuditableEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3661025345817778499L;
	
	public String categoryName;
	public String fieldName;
	public String fieldValue;
	public String allIncludeNumber;
	public String allExcludeNumber;
	public String priorityNumber;
	
	@Id
	@GeneratedValue(generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
	public Long getEntityId() {
		return entityId;
	}

	public void setEntityId(Long entityId) {
		this.entityId = entityId;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getFieldValue() {
		return fieldValue;
	}

	public void setFieldValue(String fieldValue) {
		this.fieldValue = fieldValue;
	}

	public String getAllIncludeNumber() {
		return allIncludeNumber;
	}

	public void setAllIncludeNumber(String allIncludeNumber) {
		this.allIncludeNumber = allIncludeNumber;
	}

	public String getAllExcludeNumber() {
		return allExcludeNumber;
	}

	public void setAllExcludeNumber(String allExcludeNumber) {
		this.allExcludeNumber = allExcludeNumber;
	}

	public String getPriorityNumber() {
		return priorityNumber;
	}

	public void setPriorityNumber(String priorityNumber) {
		this.priorityNumber = priorityNumber;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	

}

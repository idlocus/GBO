package com.cicc.gbo.tps.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.cicc.gbo.core.model.AuditableEntity;

/**
 * @author Guo Hua
 * @version 下午5:07:27 2014年9月21日 
 */
@Entity
@Table (name = "GBO_CONDITION_FIELD")
public class ConditionField extends AuditableEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3688006395447286440L;
	
	public String categoryName;
	public String keyItem;
	public String valueItem;
	public String remark;
	
	@Id
	@GeneratedValue(generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
	public Long getEntityId() {
		return entityId;
	}

	public void setEntityId(Long entityId) {
		this.entityId = entityId;
	}
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getKeyItem() {
		return keyItem;
	}
	public void setKeyItem(String keyItem) {
		this.keyItem = keyItem;
	}
	public String getValueItem() {
		return valueItem;
	}
	public void setValueItem(String valueItem) {
		this.valueItem = valueItem;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	

}

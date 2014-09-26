package com.cicc.gbo.core.model;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author Guo Hua
 * @version 下午5:45:14 2014年9月24日 
 */
@Entity
@Table(name = "GBO_REFERENCE")
public class ReferenceEntity extends ReferenceBaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5589983386756354008L;
	
	public Boolean isEnable;

	public Boolean getIsEnable() {
		return isEnable;
	}

	public void setIsEnable(Boolean isEnable) {
		this.isEnable = isEnable;
	}
	
	

}

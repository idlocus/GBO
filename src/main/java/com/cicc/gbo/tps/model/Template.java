package com.cicc.gbo.tps.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.cicc.gbo.core.model.TransactionEntity;

/**
 * @author Guo Hua
 * @version 下午1:43:55 2014年9月10日 
 */
@Entity
@Table(name = "GBO_TEMPLATE")
public class Template extends TransactionEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6441424058426776118L;
	
	public String categoryName;
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	
	

}

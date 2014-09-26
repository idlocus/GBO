package com.cicc.gbo.tps.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.cicc.gbo.core.model.TransactionEntity;

/**
 * @author Guo Hua
 * @version 下午1:39:57 2014年9月10日 
 */
@Entity
@Table(name = "GBO_TRADE")
public class Trade extends TransactionEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3021011534889834004L;
	
}

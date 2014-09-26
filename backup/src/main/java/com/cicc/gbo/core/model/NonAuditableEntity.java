package com.cicc.gbo.core.model;

import javax.persistence.MappedSuperclass;

import com.cicc.gaf.base.BaseModel;

/**
 * @author Guo Hua
 * @version 上午9:07:32 2014年9月18日 
 */
@MappedSuperclass
public class NonAuditableEntity extends BaseModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6276399836445465094L;

}

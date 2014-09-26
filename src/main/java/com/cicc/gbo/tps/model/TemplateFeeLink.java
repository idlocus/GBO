package com.cicc.gbo.tps.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.cicc.gbo.core.model.ReferenceEntity;

/**
 * @author Guo Hua
 * @version 下午6:47:07 2014年9月24日 
 */
@Entity
@Table(name = "GBO_TEMPLATE_FEE_LINK")
public class TemplateFeeLink extends ReferenceEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3706122015878339098L;
	
	String templateId;
	String feeId;
	
	public String getTemplateId() {
		return templateId;
	}
	public void setTemplateId(String templateId) {
		this.templateId = templateId;
	}
	public String getFeeId() {
		return feeId;
	}
	public void setFeeId(String feeId) {
		this.feeId = feeId;
	}

}

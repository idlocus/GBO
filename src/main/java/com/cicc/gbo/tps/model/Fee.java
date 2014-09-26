package com.cicc.gbo.tps.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.cicc.gbo.core.model.ReferenceEntity;

/**
 * @author Guo Hua
 * @version 下午5:41:59 2014年9月24日 
 */
@Entity
@Table (name = "GBO_FEE")
public class Fee extends ReferenceEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4837539982304947861L;
	
	public String feeId;
	public String feeCode; // Commission, Stamp Duty, Levy, Trading Fee, Gst, Sec Fee,
	public String feeName; // Commission, Stamp Duty, Levy, Trading Fee, Gst, Sec Fee,
	public String feeType;// Exchange/ Client/ Regulation/ Tax
	public String feeCategory;// Exchange/ Client/ Regulation/ Tax
	public String charger;
	public String description;
	public String getFeeId() {
		return feeId;
	}
	public void setFeeId(String feeId) {
		this.feeId = feeId;
	}
	public String getFeeCode() {
		return feeCode;
	}
	public void setFeeCode(String feeCode) {
		this.feeCode = feeCode;
	}
	public String getFeeName() {
		return feeName;
	}
	public void setFeeName(String feeName) {
		this.feeName = feeName;
	}
	public String getFeeType() {
		return feeType;
	}
	public void setFeeType(String feeType) {
		this.feeType = feeType;
	}
	public String getFeeCategory() {
		return feeCategory;
	}
	public void setFeeCategory(String feeCategory) {
		this.feeCategory = feeCategory;
	}
	public String getCharger() {
		return charger;
	}
	public void setCharger(String charger) {
		this.charger = charger;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

}

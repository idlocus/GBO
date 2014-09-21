package com.cicc.gbo.core.model;

import javax.persistence.MappedSuperclass;

import com.cicc.gaf.base.BaseModel;
import com.cicc.gbo.core.shared.RecordStatus;

/**
 * @author Guo Hua
 * @version 下午6:48:33 2014年9月17日 
 */
@MappedSuperclass
public class AuditableEntity extends BaseModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5432924157782876812L;
	
	public String internalRecordId;
	public String originalRecordId;
	public String externalRecordId;
	public String rootRecordId;
	public String groupRecordId;
	public String recordStatus = RecordStatus.ACTIVE.name();
	public String recordRemark;

	
	public String getInternalRecordId() {
		return internalRecordId;
	}
	public void setInternalRecordId(String internalRecordId) {
		this.internalRecordId = internalRecordId;
	}
	public String getExternalRecordId() {
		return externalRecordId;
	}
	public void setExternalRecordId(String externalRecordId) {
		this.externalRecordId = externalRecordId;
	}
	public String getOriginalRecordId() {
		return originalRecordId;
	}
	public void setOriginalRecordId(String originalRecordId) {
		this.originalRecordId = originalRecordId;
	}
	public String getRootRecordId() {
		return rootRecordId;
	}
	public void setRootRecordId(String rootRecordId) {
		this.rootRecordId = rootRecordId;
	}
	public String getGroupRecordId() {
		return groupRecordId;
	}
	public void setGroupRecordId(String groupRecordId) {
		this.groupRecordId = groupRecordId;
	}
	public String getRecordStatus() {
		return recordStatus;
	}
	public void setRecordStatus(String recordStatus) {
		this.recordStatus = recordStatus;
	}
	public String getRecordRemark() {
		return recordRemark;
	}
	public void setRecordRemark(String recordRemark) {
		this.recordRemark = recordRemark;
	}
	
	
}

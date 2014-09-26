package com.cicc.gbo.tps.model;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.cicc.gbo.core.model.TransactionBaseEntity;

/**
 * @author Guo Hua
 * @version 下午6:42:34 2014年9月24日 
 */
@Entity
@Table(name="GBO_FIGURATION")
public class Figuration extends TransactionBaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 670636993089723187L;

	String feeId;
	String feeCode;
	String feeName;
	String templateId;
	String figurationDefinitionId;
	String figurationId;
	String figurationCode;
	String figurationName;
	String figurationBase;// quantity, price, amount, commission
	BigDecimal figurationBaseValue;
	BigDecimal figurationRate;
	Long figurationPrecision;
	BigDecimal figurationAmount;
	
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
	public String getTemplateId() {
		return templateId;
	}
	public void setTemplateId(String templateId) {
		this.templateId = templateId;
	}
	public String getFigurationDefinitionId() {
		return figurationDefinitionId;
	}
	public void setFigurationDefinitionId(String figurationDefinitionId) {
		this.figurationDefinitionId = figurationDefinitionId;
	}
	public String getFigurationId() {
		return figurationId;
	}
	public void setFigurationId(String figurationId) {
		this.figurationId = figurationId;
	}
	public String getFigurationCode() {
		return figurationCode;
	}
	public void setFigurationCode(String figurationCode) {
		this.figurationCode = figurationCode;
	}
	public String getFigurationName() {
		return figurationName;
	}
	public void setFigurationName(String figurationName) {
		this.figurationName = figurationName;
	}
	public String getFigurationBase() {
		return figurationBase;
	}
	public void setFigurationBase(String figurationBase) {
		this.figurationBase = figurationBase;
	}
	public BigDecimal getFigurationBaseValue() {
		return figurationBaseValue;
	}
	public void setFigurationBaseValue(BigDecimal figurationBaseValue) {
		this.figurationBaseValue = figurationBaseValue;
	}
	public BigDecimal getFigurationRate() {
		return figurationRate;
	}
	public void setFigurationRate(BigDecimal figurationRate) {
		this.figurationRate = figurationRate;
	}
	public Long getFigurationPrecision() {
		return figurationPrecision;
	}
	public void setFigurationPrecision(Long figurationPrecision) {
		this.figurationPrecision = figurationPrecision;
	}
	public BigDecimal getFigurationAmount() {
		return figurationAmount;
	}
	public void setFigurationAmount(BigDecimal figurationAmount) {
		this.figurationAmount = figurationAmount;
	}
	
	
}

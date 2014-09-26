package com.cicc.gbo.oms.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.cicc.gbo.core.model.TransactionEntity;

/**
 * @author Guo Hua
 * @version 上午11:07:55 2014年9月12日 
 */
@Entity
@Table(name = "GBO_EXECUTION")
public class Execution extends TransactionEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2941922873727726516L;

	public String executionId;
	public String externalExecutionId;
	public String clientOrderId;
	public String orderId;
	public String parentOrderId;
	public String rootOrderId;
	public String ciccClientReqId;
	public String ciccClientOrdId;
	public String ciccParentOrdId;
	public String execTransType;
	public String executionReferenceId;
	public String productIdSource;
	public String cusip;
	public String sedol;
	public String isin;
	public String orderStatus;
	public String orderType;
	public BigDecimal orderPrice;
	public String timeInForce;
	public String orderCapacity;
	public String settlementType;
	public BigDecimal orderStopPrice;
	public BigDecimal settlementAmount;
	public String settlementCurrencyId;
	public Date expireTime;
	public String settleCurFxRateMethod;
	public String commissionType;
	public BigDecimal commission;
	public BigDecimal orderQuantity;
	public String executeInstruction;
	public String issuer;
	public BigDecimal filledQuantity;
	public BigDecimal filledAveragePrice;
	public BigDecimal lastFilledQuantity;
	public BigDecimal lastFilledPrice;
	public String execType;
	public BigDecimal leavesQuantity;
	
	public String getExecutionId() {
		return executionId;
	}
	public void setExecutionId(String executionId) {
		this.executionId = executionId;
	}
	public String getExternalExecutionId() {
		return externalExecutionId;
	}
	public void setExternalExecutionId(String externalExecutionId) {
		this.externalExecutionId = externalExecutionId;
	}
	public String getClientOrderId() {
		return clientOrderId;
	}
	public void setClientOrderId(String clientOrderId) {
		this.clientOrderId = clientOrderId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	public String getParentOrderId() {
		return parentOrderId;
	}
	public void setParentOrderId(String parentOrderId) {
		this.parentOrderId = parentOrderId;
	}
	public String getRootOrderId() {
		return rootOrderId;
	}
	public void setRootOrderId(String rootOrderId) {
		this.rootOrderId = rootOrderId;
	}
	public String getExecTransType() {
		return execTransType;
	}
	public void setExecTransType(String execTransType) {
		this.execTransType = execTransType;
	}
	public String getExecutionReferenceId() {
		return executionReferenceId;
	}
	public void setExecutionReferenceId(String executionReferenceId) {
		this.executionReferenceId = executionReferenceId;
	}
	public String getProductIdSource() {
		return productIdSource;
	}
	public void setProductIdSource(String productIdSource) {
		this.productIdSource = productIdSource;
	}
	public String getCusip() {
		return cusip;
	}
	public void setCusip(String cusip) {
		this.cusip = cusip;
	}
	public String getSedol() {
		return sedol;
	}
	public void setSedol(String sedol) {
		this.sedol = sedol;
	}
	public String getIsin() {
		return isin;
	}
	public void setIsin(String isin) {
		this.isin = isin;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public BigDecimal getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(BigDecimal orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getTimeInForce() {
		return timeInForce;
	}
	public void setTimeInForce(String timeInForce) {
		this.timeInForce = timeInForce;
	}
	public String getOrderCapacity() {
		return orderCapacity;
	}
	public void setOrderCapacity(String orderCapacity) {
		this.orderCapacity = orderCapacity;
	}
	public String getSettlementType() {
		return settlementType;
	}
	public void setSettlementType(String settlementType) {
		this.settlementType = settlementType;
	}
	public BigDecimal getOrderStopPrice() {
		return orderStopPrice;
	}
	public void setOrderStopPrice(BigDecimal orderStopPrice) {
		this.orderStopPrice = orderStopPrice;
	}
	public BigDecimal getSettlementAmount() {
		return settlementAmount;
	}
	public void setSettlementAmount(BigDecimal settlementAmount) {
		this.settlementAmount = settlementAmount;
	}
	public String getSettlementCurrencyId() {
		return settlementCurrencyId;
	}
	public void setSettlementCurrencyId(String settlementCurrencyId) {
		this.settlementCurrencyId = settlementCurrencyId;
	}
	public Date getExpireTime() {
		return expireTime;
	}
	public void setExpireTime(Date expireTime) {
		this.expireTime = expireTime;
	}
	public String getSettleCurFxRateMethod() {
		return settleCurFxRateMethod;
	}
	public void setSettleCurFxRateMethod(String settleCurFxRateMethod) {
		this.settleCurFxRateMethod = settleCurFxRateMethod;
	}
	public String getCommissionType() {
		return commissionType;
	}
	public void setCommissionType(String commissionType) {
		this.commissionType = commissionType;
	}
	public BigDecimal getCommission() {
		return commission;
	}
	public void setCommission(BigDecimal commission) {
		this.commission = commission;
	}
	public BigDecimal getOrderQuantity() {
		return orderQuantity;
	}
	public void setOrderQuantity(BigDecimal orderQuantity) {
		this.orderQuantity = orderQuantity;
	}
	public String getExecuteInstruction() {
		return executeInstruction;
	}
	public void setExecuteInstruction(String executeInstruction) {
		this.executeInstruction = executeInstruction;
	}
	public String getIssuer() {
		return issuer;
	}
	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}
	public BigDecimal getFilledQuantity() {
		return filledQuantity;
	}
	public void setFilledQuantity(BigDecimal filledQuantity) {
		this.filledQuantity = filledQuantity;
	}
	public BigDecimal getFilledAveragePrice() {
		return filledAveragePrice;
	}
	public void setFilledAveragePrice(BigDecimal filledAveragePrice) {
		this.filledAveragePrice = filledAveragePrice;
	}
	public BigDecimal getLastFilledQuantity() {
		return lastFilledQuantity;
	}
	public void setLastFilledQuantity(BigDecimal lastFilledQuantity) {
		this.lastFilledQuantity = lastFilledQuantity;
	}
	public BigDecimal getLastFilledPrice() {
		return lastFilledPrice;
	}
	public void setLastFilledPrice(BigDecimal lastFilledPrice) {
		this.lastFilledPrice = lastFilledPrice;
	}
	public String getExecType() {
		return execType;
	}
	public void setExecType(String execType) {
		this.execType = execType;
	}
	public BigDecimal getLeavesQuantity() {
		return leavesQuantity;
	}
	public void setLeavesQuantity(BigDecimal leavesQuantity) {
		this.leavesQuantity = leavesQuantity;
	}
	public String getCiccClientReqId() {
		return ciccClientReqId;
	}
	public void setCiccClientReqId(String ciccClientReqId) {
		this.ciccClientReqId = ciccClientReqId;
	}
	public String getCiccClientOrdId() {
		return ciccClientOrdId;
	}
	public void setCiccClientOrdId(String ciccClientOrdId) {
		this.ciccClientOrdId = ciccClientOrdId;
	}
	public String getCiccParentOrdId() {
		return ciccParentOrdId;
	}
	public void setCiccParentOrdId(String ciccParentOrdId) {
		this.ciccParentOrdId = ciccParentOrdId;
	}
	
}

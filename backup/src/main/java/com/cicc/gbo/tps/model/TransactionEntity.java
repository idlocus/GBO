package com.cicc.gbo.tps.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.cicc.gbo.core.model.TransactionBaseEntity;

/**
 * @author Guo Hua
 * @version 上午10:57:09 2014年9月10日 
 */
@Entity
@Table(name = "GBO_TRANSACTION")
public class TransactionEntity extends TransactionBaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3178982547329056168L;
	
	public String primaryAccountId;
	public String primaryAccountLocation;
	public String versusAccountId;
	public String versusAccountLocation;
	public String washAccountId;
	public String introducerAccountId;
	public String bookAccountId;
	public String clearingAccountId;
	public String clearingBrokerId;
	public String primaryBrokerId;
	public String versusBrokerId;
	public String productType;
	public String productId;
	public String tradingCurrency;
	public String settlementCurrency;
	public Date tradingDate;
	public Date settlementDate;
	public String side;
	public String listExchangeId;
	public String tradeExchangeId;
	public BigDecimal quantity;
	public BigDecimal price;
	public BigDecimal amount;
	public String salesId;
	public String dealerId;
	
	public Boolean isLateTrade;
	public Boolean isManualCrossing;
	public Boolean isUnsolicited;
	public Boolean isManualFill;
	public Boolean isOddLot;
	
	public String templateGroupId;
	
	public String getPrimaryAccountId() {
		return primaryAccountId;
	}
	public void setPrimaryAccountId(String primaryAccountId) {
		this.primaryAccountId = primaryAccountId;
	}
	public String getPrimaryAccountLocation() {
		return primaryAccountLocation;
	}
	public void setPrimaryAccountLocation(String primaryAccountLocation) {
		this.primaryAccountLocation = primaryAccountLocation;
	}
	public String getVersusAccountId() {
		return versusAccountId;
	}
	public void setVersusAccountId(String versusAccountId) {
		this.versusAccountId = versusAccountId;
	}
	public String getVersusAccountLocation() {
		return versusAccountLocation;
	}
	public void setVersusAccountLocation(String versusAccountLocation) {
		this.versusAccountLocation = versusAccountLocation;
	}
	public String getWashAccountId() {
		return washAccountId;
	}
	public void setWashAccountId(String washAccountId) {
		this.washAccountId = washAccountId;
	}
	public String getIntroducerAccountId() {
		return introducerAccountId;
	}
	public void setIntroducerAccountId(String introducerAccountId) {
		this.introducerAccountId = introducerAccountId;
	}
	public String getBookAccountId() {
		return bookAccountId;
	}
	public void setBookAccountId(String bookAccountId) {
		this.bookAccountId = bookAccountId;
	}
	public String getClearingAccountId() {
		return clearingAccountId;
	}
	public void setClearingAccountId(String clearingAccountId) {
		this.clearingAccountId = clearingAccountId;
	}
	public String getClearingBrokerId() {
		return clearingBrokerId;
	}
	public void setClearingBrokerId(String clearingBrokerId) {
		this.clearingBrokerId = clearingBrokerId;
	}
	public String getPrimaryBrokerId() {
		return primaryBrokerId;
	}
	public void setPrimaryBrokerId(String primaryBrokerId) {
		this.primaryBrokerId = primaryBrokerId;
	}
	public String getVersusBrokerId() {
		return versusBrokerId;
	}
	public void setVersusBrokerId(String versusBrokerId) {
		this.versusBrokerId = versusBrokerId;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getTradingCurrency() {
		return tradingCurrency;
	}
	public void setTradingCurrency(String tradingCurrency) {
		this.tradingCurrency = tradingCurrency;
	}
	
	public String getSettlementCurrency() {
		return settlementCurrency;
	}
	public void setSettlementCurrency(String settlementCurrency) {
		this.settlementCurrency = settlementCurrency;
	}
	@DateTimeFormat(pattern="yyyyMMdd")
	public Date getTradingDate() {
		return tradingDate;
	}
	public void setTradingDate(Date tradingDate) {
		this.tradingDate = tradingDate;
	}
	@DateTimeFormat(pattern="yyyyMMdd")
	public Date getSettlementDate() {
		return settlementDate;
	}
	public void setSettlementDate(Date settlementDate) {
		this.settlementDate = settlementDate;
	}
	
	public String getSide() {
		return side;
	}
	public void setSide(String side) {
		this.side = side;
	}
	public String getListExchangeId() {
		return listExchangeId;
	}
	public void setListExchangeId(String listExchangeId) {
		this.listExchangeId = listExchangeId;
	}
	public String getTradeExchangeId() {
		return tradeExchangeId;
	}
	public void setTradeExchangeId(String tradeExchangeId) {
		this.tradeExchangeId = tradeExchangeId;
	}
	public BigDecimal getQuantity() {
		return quantity;
	}
	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public Boolean getIsLateTrade() {
		return isLateTrade;
	}
	public void setIsLateTrade(Boolean isLateTrade) {
		this.isLateTrade = isLateTrade;
	}
	public Boolean getIsManualCrossing() {
		return isManualCrossing;
	}
	public void setIsManualCrossing(Boolean isManualCrossing) {
		this.isManualCrossing = isManualCrossing;
	}
	public Boolean getIsUnsolicited() {
		return isUnsolicited;
	}
	public void setIsUnsolicited(Boolean isUnsolicited) {
		this.isUnsolicited = isUnsolicited;
	}
	public Boolean getIsManualFill() {
		return isManualFill;
	}
	public void setIsManualFill(Boolean isManualFill) {
		this.isManualFill = isManualFill;
	}
	public Boolean getIsOddLot() {
		return isOddLot;
	}
	public void setIsOddLot(Boolean isOddLot) {
		this.isOddLot = isOddLot;
	}
	public String getSalesId() {
		return salesId;
	}
	public void setSalesId(String salesId) {
		this.salesId = salesId;
	}
	public String getDealerId() {
		return dealerId;
	}
	public void setDealerId(String dealerId) {
		this.dealerId = dealerId;
	}
	public String getTemplateGroupId() {
		return templateGroupId;
	}
	public void setTemplateGroupId(String templateGroupId) {
		this.templateGroupId = templateGroupId;
	}

	
}

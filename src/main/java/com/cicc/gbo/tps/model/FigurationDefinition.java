package com.cicc.gbo.tps.model;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.cicc.gbo.core.model.AuditableEntity;

/**
 * @author Guo Hua
 * @version 下午6:44:12 2014年9月24日 
 */
@Entity
@Table(name = "GBO_FIGURATION_DEFINITION")
public class FigurationDefinition extends AuditableEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6438880673628765679L;

	public final static String CHECK_PASS = "ALL";
	public final static String MEASUREMENT_CHECK_PASS = "NONE";
	Integer priority = 0;// higher with bigger value
	String figurationDefinitionId;
	String feeId;
	String feeCode;
	// condition
	String accountId = CHECK_PASS;
	String accountOwnerType = CHECK_PASS;// Firm, Client, Broker
	String accountType = CHECK_PASS;// DVP, Custodian
	String accountCategory = CHECK_PASS;// Institution, Person
	String tradeExchangeId = CHECK_PASS;// NYSE, SS, SZ
	String listExchangeId = CHECK_PASS;// NYSE, SS, SZ
	String tradingCurrency = CHECK_PASS;
	String settlementCurrency = CHECK_PASS;

	String side = CHECK_PASS;// B, S, SS, SE, BC
	String productType = CHECK_PASS;// Stock, ETF, Bond, Future
	String productId = CHECK_PASS;
	String businessStrategy = CHECK_PASS;// Agency, Prop Trading, Market marker,
											// Program
	// trading
	String transactionChannel = CHECK_PASS;// Mobile, GUI, manually, email
	String transactionManagementSystem = CHECK_PASS;// GMO
	String traderId = CHECK_PASS;
	String salesId = CHECK_PASS;
	String orderLocation = CHECK_PASS;// where the order is placed
	String accountLocation = CHECK_PASS;// where the account client location
										// (GST)

	String measurement = MEASUREMENT_CHECK_PASS;// quantity, price, amount
												// (Tiered Commission)
	BigDecimal measurementValue;
	BigDecimal lowerLimit;
	BigDecimal upperLimit;

	// fee definition
	String figurationBase = "filledConsideration";// filledQuantity, price,
													// filledConsideration,
													// commission
	BigDecimal figurationBaseValue;
	BigDecimal figurationBaseUnit = new BigDecimal("1.0");
	BigDecimal figurationRate = new BigDecimal("0.0");
	Long figurationPrecision = new Long(4);

	// fee adjustment
	String roundingRule = "RoundHalf";// Round up, Round down, Round half
	BigDecimal minAmount = new BigDecimal("0.0");
	BigDecimal maxAmount = new BigDecimal("0.0");
	BigDecimal discountAmount = new BigDecimal("0.0");
	
	@Id
	@GeneratedValue(generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
	public Long getEntityId() {
		return entityId;
	}

	public void setEntityId(Long entityId) {
		this.entityId = entityId;
	}
	
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public String getFigurationDefinitionId() {
		return figurationDefinitionId;
	}
	public void setFigurationDefinitionId(String figurationDefinitionId) {
		this.figurationDefinitionId = figurationDefinitionId;
	}
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
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getAccountOwnerType() {
		return accountOwnerType;
	}
	public void setAccountOwnerType(String accountOwnerType) {
		this.accountOwnerType = accountOwnerType;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public String getAccountCategory() {
		return accountCategory;
	}
	public void setAccountCategory(String accountCategory) {
		this.accountCategory = accountCategory;
	}
	public String getTradeExchangeId() {
		return tradeExchangeId;
	}
	public void setTradeExchangeId(String tradeExchangeId) {
		this.tradeExchangeId = tradeExchangeId;
	}
	public String getListExchangeId() {
		return listExchangeId;
	}
	public void setListExchangeId(String listExchangeId) {
		this.listExchangeId = listExchangeId;
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

	public String getSide() {
		return side;
	}
	public void setSide(String side) {
		this.side = side;
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
	public String getBusinessStrategy() {
		return businessStrategy;
	}
	public void setBusinessStrategy(String businessStrategy) {
		this.businessStrategy = businessStrategy;
	}
	public String getTransactionChannel() {
		return transactionChannel;
	}
	public void setTransactionChannel(String transactionChannel) {
		this.transactionChannel = transactionChannel;
	}
	public String getTransactionManagementSystem() {
		return transactionManagementSystem;
	}
	public void setTransactionManagementSystem(String transactionManagementSystem) {
		this.transactionManagementSystem = transactionManagementSystem;
	}
	public String getTraderId() {
		return traderId;
	}
	public void setTraderId(String traderId) {
		this.traderId = traderId;
	}
	public String getSalesId() {
		return salesId;
	}
	public void setSalesId(String salesId) {
		this.salesId = salesId;
	}
	public String getOrderLocation() {
		return orderLocation;
	}
	public void setOrderLocation(String orderLocation) {
		this.orderLocation = orderLocation;
	}
	public String getAccountLocation() {
		return accountLocation;
	}
	public void setAccountLocation(String accountLocation) {
		this.accountLocation = accountLocation;
	}
	public String getMeasurement() {
		return measurement;
	}
	public void setMeasurement(String measurement) {
		this.measurement = measurement;
	}
	public BigDecimal getMeasurementValue() {
		return measurementValue;
	}
	public void setMeasurementValue(BigDecimal measurementValue) {
		this.measurementValue = measurementValue;
	}
	public BigDecimal getLowerLimit() {
		return lowerLimit;
	}
	public void setLowerLimit(BigDecimal lowerLimit) {
		this.lowerLimit = lowerLimit;
	}
	public BigDecimal getUpperLimit() {
		return upperLimit;
	}
	public void setUpperLimit(BigDecimal upperLimit) {
		this.upperLimit = upperLimit;
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
	public BigDecimal getFigurationBaseUnit() {
		return figurationBaseUnit;
	}
	public void setFigurationBaseUnit(BigDecimal figurationBaseUnit) {
		this.figurationBaseUnit = figurationBaseUnit;
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
	public String getRoundingRule() {
		return roundingRule;
	}
	public void setRoundingRule(String roundingRule) {
		this.roundingRule = roundingRule;
	}
	public BigDecimal getMinAmount() {
		return minAmount;
	}
	public void setMinAmount(BigDecimal minAmount) {
		this.minAmount = minAmount;
	}
	public BigDecimal getMaxAmount() {
		return maxAmount;
	}
	public void setMaxAmount(BigDecimal maxAmount) {
		this.maxAmount = maxAmount;
	}
	public BigDecimal getDiscountAmount() {
		return discountAmount;
	}
	public void setDiscountAmount(BigDecimal discountAmount) {
		this.discountAmount = discountAmount;
	}
	public static String getCheckPass() {
		return CHECK_PASS;
	}
	public static String getMeasurementCheckPass() {
		return MEASUREMENT_CHECK_PASS;
	}

	
	
}

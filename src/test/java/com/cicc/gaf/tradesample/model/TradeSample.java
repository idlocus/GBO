package com.cicc.gaf.tradesample.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

import com.cicc.gaf.base.BaseModel;
import com.cicc.gaf.datadictionary.Dictionary;
import com.cicc.gaf.datadictionary.RemoteAutoCompletion;
import com.cicc.gaf.validation.DateValidation;
import com.cicc.gaf.validation.EmailValidation;
import com.cicc.gaf.validation.NumberValidation;
import com.cicc.gaf.validation.RequiredValidation;
import com.cicc.gaf.validation.SizeValidation;

@Entity
@Table(name = "t_trade_sample")
public class TradeSample extends BaseModel {
	private static final long serialVersionUID = 1193564661742387745L;

	private String client;
	private String symbol;
	private String instrumentType;
	private Date tradeDate;
	private Date settlementDate;
	private String side;
	private String currency;
	private String market;
	private Integer qty;
	private Double price;
	private Double amount;
	private String remark;
	private String industrySector;

	@Dictionary(categoryName = "INSTRUMENT_TYPE")
	public String getInstrumentType() {
		return instrumentType;
	}

	public void setInstrumentType(String instrumentType) {
		this.instrumentType = instrumentType;
	}

	@DateValidation(format = "YYYY-MM-DD")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@RequiredValidation
	public Date getSettlementDate() {
		return settlementDate;
	}

	public void setSettlementDate(Date settlementDate) {
		this.settlementDate = settlementDate;
	}

	@RequiredValidation
	@Dictionary(tableName = "t_market", keyColumnName = "entity_id", valueColumnName = "market_code", categoryName = "")
	public String getMarket() {
		return market;
	}

	public void setMarket(String market) {
		this.market = market;
	}

	@NumberValidation
	@RequiredValidation
	@NumberFormat(pattern="#,###")/* Number should add number format, this is integer sample*/
	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}

	@NumberValidation(precision=2)
	@RequiredValidation
	@NumberFormat(pattern="#,###.##")/* Number should add number format, this is double sample*/
	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}





	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "trade_seq")
	@SequenceGenerator(name = "trade_seq", sequenceName = "seq_trade", allocationSize = 1)
	public Long getEntityId() {
		return entityId;
	}

	public void setEntityId(Long entityId) {
		this.entityId = entityId;
	}

	@DateValidation(format = "YYYY-MM-DD")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@RequiredValidation
	public Date getTradeDate() {
		return tradeDate;
	}

	public void setTradeDate(Date tradeDate) {
		this.tradeDate = tradeDate;
	}

	@RequiredValidation
	@RemoteAutoCompletion(minLength = 1, maxRows = 20)
	@Dictionary(tableName = "t_account_sample", keyColumnName = "account_id", valueColumnName = "account_code", categoryName = "")
	public String getClient() {
		return client;
	}

	public void setClient(String client) {
		this.client = client;
	}

	@RequiredValidation
	@SizeValidation(maxLength=5)
	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
	@RequiredValidation
	@Dictionary(categoryName = "SIDE")
	public String getSide() {
		return side;
	}

	public void setSide(String side) {
		this.side = side;
	}
	@RequiredValidation
	@Dictionary(tableName = "t_currency", keyColumnName = "entity_id", valueColumnName = "currency_code", categoryName = "")
	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	@RequiredValidation
	@NumberValidation(precision = 6)
	@NumberFormat(pattern="#,###.######")/* Number should add number format, this is double sample*/
	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@SizeValidation(maxLength = 20)
	@EmailValidation
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public void setIndustrySector(String industrySector) {
		this.industrySector = industrySector;
	}
	@Dictionary(categoryName = "INDUSTRY_SECTOR")
	public String getIndustrySector() {
		return industrySector;
	}

}

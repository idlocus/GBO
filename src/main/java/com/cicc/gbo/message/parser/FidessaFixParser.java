package com.cicc.gbo.message.parser;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import quickfix.FieldNotFound;
import quickfix.InvalidMessage;
import quickfix.Message;
import quickfix.StringField;
import quickfix.field.Account;
import quickfix.field.AvgPx;
import quickfix.field.ClOrdID;
import quickfix.field.ClearingFirm;
import quickfix.field.ClientID;
import quickfix.field.CommType;
import quickfix.field.Commission;
import quickfix.field.CumQty;
import quickfix.field.Currency;
import quickfix.field.ExecID;
import quickfix.field.ExecInst;
import quickfix.field.ExecRefID;
import quickfix.field.ExecTransType;
import quickfix.field.ExecType;
import quickfix.field.ExpireTime;
import quickfix.field.FutSettDate;
import quickfix.field.IDSource;
import quickfix.field.Issuer;
import quickfix.field.LastMkt;
import quickfix.field.LastPx;
import quickfix.field.LastShares;
import quickfix.field.LeavesQty;
import quickfix.field.MsgType;
import quickfix.field.OrdStatus;
import quickfix.field.OrdType;
import quickfix.field.OrderID;
import quickfix.field.OrderQty;
import quickfix.field.Price;
import quickfix.field.Rule80A;
import quickfix.field.SecurityExchange;
import quickfix.field.SecurityID;
import quickfix.field.SecurityType;
import quickfix.field.SettlCurrAmt;
import quickfix.field.SettlCurrFxRateCalc;
import quickfix.field.SettlCurrency;
import quickfix.field.SettlmntTyp;
import quickfix.field.Side;
import quickfix.field.StopPx;
import quickfix.field.Symbol;
import quickfix.field.TimeInForce;
import quickfix.field.TradeDate;
import quickfix.field.TransactTime;

import com.cicc.gaf.logger.Logger;
import com.cicc.gaf.logger.LoggerFactory;
import com.cicc.gbo.core.model.TransactionBaseEntity;
import com.cicc.gbo.core.shared.LogMessageConstants;
import com.cicc.gbo.core.shared.ProcessConstants;
import com.cicc.gbo.core.shared.TransactionConstants;
import com.cicc.gbo.message.shared.CiccFidessaFixField;
import com.cicc.gbo.oms.model.Execution;
import com.cicc.gbo.oms.model.Order;
import com.cicc.gbo.tps.model.TransactionEntity;

/**
 * @author Guo Hua
 * @version 上午11:12:58 2014年9月12日 
 */
@Component
public class FidessaFixParser extends FixProtocolParserImpl implements FixProtocolParser {

	private static Logger logger = LoggerFactory.getLogger(FidessaFixParser.class);
	
	private static final String FIDESSA_MSG_TYPE = "8";
	private static final int FIDESSA_RECORD_TYPE = 5401;
	private static final String FIDESSA_RECORD_TYPE_TRADE = "M";
	private static final String FIDESSA_RECORD_TYPE_ALLOCATION = "A";
	
	private SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYYMMDD");
	
	public <T extends TransactionBaseEntity> boolean parseFidessaMessage(String message, T tbe) {
		quickfix.Message fixMessage = null;
		try {
			fixMessage = new quickfix.Message(message);
			MsgType msgType = new MsgType();
			if (fixMessage.getHeader().getField(msgType).valueEquals(FIDESSA_MSG_TYPE)) {	
				if (tbe instanceof Order) {
					parseTransanctionBaseInfo(fixMessage, tbe);
					parseTransactionInfo(fixMessage, (TransactionEntity)tbe);
					parseOrderInfo(fixMessage, (Order) tbe);
				} else if (tbe instanceof Execution){
					if (fixMessage.isSetField(FIDESSA_RECORD_TYPE)) {
						String value = fixMessage.getString(FIDESSA_RECORD_TYPE);
						if (FIDESSA_RECORD_TYPE_TRADE.equalsIgnoreCase(value.trim())) {
							parseTransanctionBaseInfo(fixMessage, tbe);
							parseTransactionInfo(fixMessage, (TransactionEntity)tbe);
							parseExecutionInfo(fixMessage, (Execution) tbe);
						}
						else if(FIDESSA_RECORD_TYPE_ALLOCATION.equalsIgnoreCase(value.trim())) {
							return false;
						}
					} else {
						logger.error(LogMessageConstants.ERROR_FIDESSA_MSG);
						return false;
					}
				} 
			} else {
				logger.error(LogMessageConstants.ERROR_FIDESSA_MSG);
				return false;
			}
		} catch (InvalidMessage | FieldNotFound e) {
			logger.error(e.getMessage(), e);
			return false;
		}
		return true;
	}
	
	public String getMessageType(Message fixMessage) throws FieldNotFound {
		if (fixMessage.isSetField(ExecTransType.FIELD) && fixMessage.isSetField(OrdStatus.FIELD) && fixMessage.isSetField(ExecType.FIELD)) {
			String execTransType = fixMessage.getString(ExecTransType.FIELD);
			String ordStatus = fixMessage.getString(OrdStatus.FIELD);
			String execType = fixMessage.getString(ExecType.FIELD);
			
			if (execTransType.equals("0") && ordStatus.equals("0") && execType.equals("0")) {
				return "New Order";
			} else if (execTransType.equals("0") && ordStatus.equals("1") && execType.equals("1")) {
				return "Partial Fill";
			} else if (execTransType.equals("0") && ordStatus.equals("2") && execType.equals("2")) {
				return "Full Fill";
			} else if (execTransType.equals("0") && (ordStatus.equals("0") || ordStatus.equals("1") || ordStatus.equals("2")) && execType.equals("D")) {
				return "Order Amend";
			} else if (execTransType.equals("0") && ordStatus.equals("4") && execType.equals("4")) {
				return "Order Cancel";
			} else if (execTransType.equals("1") && (ordStatus.equals("0") || ordStatus.equals("1")) && (execType.equals("0") || execType.equals("1"))) {
				return "Trade Bust";
			} else if (execTransType.equals("2") && (ordStatus.equals("0") || ordStatus.equals("1") || ordStatus.equals("2")) && (execType.equals("0") || execType.equals("1") || execType.equals("2"))) {
				return "Trade Correct";
			} else if (execTransType.equals("0") && ordStatus.equals("E") && execType.equals("E")) {
				return "Pending Amend";
			} else if (execTransType.equals("0") && ordStatus.equals("6") && execType.equals("6")) {
				return "Pending Cancel";
			} else if (execTransType.equals("0") && ordStatus.equals("8") && execType.equals("8")) {
				return "Reject";
			} else if (execTransType.equals("3") && ordStatus.equals("3") && execType.equals("3")) {
				return "Done for Day";
			} else {
				return "Unknown Status";
			}
		}
		if (!fixMessage.isSetField(ExecTransType.FIELD) && !fixMessage.isSetField(OrdStatus.FIELD) && !fixMessage.isSetField(ExecType.FIELD)) {
			return "Group Bookings";
		}
		return "Unknown Status";
	}
	
	public <T extends TransactionBaseEntity> void parseTransanctionBaseInfo(Message fixMessage, T tbe) throws FieldNotFound {
		tbe.setTransactionChannel(TransactionConstants.FIDESSA_TRANSACTION_CHANNEL);
		tbe.setTransactionSystem(TransactionConstants.FIDESSA_TRANSACTION_SYSTEM);

		if (fixMessage.isSetField(OrderID.FIELD)) {
			String externalId = fixMessage.getString(OrderID.FIELD);
			tbe.setOriginalRecordId(externalId);
			tbe.setExternalRecordId(externalId);
		}
		
		tbe.setTransactionCategory(tbe.getClass().getName());
		tbe.setTransactionBusinessCode(this.getMessageType(fixMessage));
		tbe.setTransactionBusinessLineId(TransactionConstants.FIDESSA_TRANSACTION_BUSINESSLINE);
		tbe.setTransactionFeedMethod(TransactionConstants.FIDESSA_TRANSACTION_FEEDMETHOD);
		tbe.setTransactionBatchId(TransactionConstants.FIDESSA_TRANSACTION_BATCHID);
		
		if (fixMessage.isSetField(TransactTime.FIELD)) {
			Date transactTime = fixMessage.getUtcTimeStamp(TransactTime.FIELD);
			tbe.setTransactionTime(transactTime);
		}
	}
	
	public <T extends TransactionEntity> void parseTransactionInfo(Message fixMessage, T tbe) throws FieldNotFound {
		// Account
		if (fixMessage.isSetField(Account.FIELD)) {
			String account = fixMessage.getString(Account.FIELD);
			tbe.setPrimaryAccountId(account);
		}
		if (fixMessage.isSetField(ClientID.FIELD)) {
			String clientId = fixMessage.getString(ClientID.FIELD);
			tbe.setVersusAccountId(clientId);
		}
		if (fixMessage.isSetField(ClearingFirm.FIELD)) {
			String clearingBrokerId = fixMessage.getString(Side.FIELD);
			tbe.setClearingBrokerId(clearingBrokerId);
		}
		if (fixMessage.isSetField(SecurityType.FIELD)) {
			String securityType = fixMessage.getString(SecurityType.FIELD);
			tbe.setProductType(securityType);
		}
		if (fixMessage.isSetField(Symbol.FIELD)) {
			String symbol = fixMessage.getString(Symbol.FIELD);
			tbe.setProductId(symbol);
		}
		if (fixMessage.isSetField(Currency.FIELD)) {
			String dealCurrency = fixMessage.getString(Currency.FIELD);
			tbe.setTradingCurrency(dealCurrency);
		}
		if (fixMessage.isSetField(SettlCurrency.FIELD)) {
			String settlCurrency = fixMessage.getString(SettlCurrency.FIELD);
			tbe.setSettlementCurrency(settlCurrency);
		}
		if (fixMessage.isSetField(TradeDate.FIELD)) {
			String tradeDate = fixMessage.getString(TradeDate.FIELD);
			if (tradeDate != null) {
				try {
					tbe.setSettlementDate(simpleDateFormat
							.parse(tradeDate));
				} catch (ParseException e) {
					logger.error(LogMessageConstants.ERROR_FIDESSA_TRADE_DATE);
					//e.printStackTrace();
				}
			}
		}
		if (fixMessage.isSetField(FutSettDate.FIELD)) {
			String settlementDate = fixMessage.getString(FutSettDate.FIELD);
			if (settlementDate != null) {
				try {
					tbe.setSettlementDate(simpleDateFormat
							.parse(settlementDate));
				} catch (ParseException e) {
					logger.error(LogMessageConstants.ERROR_FIDESSA_SETTLE_DATE);
					//e.printStackTrace();
				}
			}
		}
		if (fixMessage.isSetField(Side.FIELD)) {
			String side = fixMessage.getString(Side.FIELD);
			tbe.setSide(side);
		}
		if (fixMessage.isSetField(SecurityExchange.FIELD)) {
			String securityExchange = fixMessage
					.getString(SecurityExchange.FIELD);
			tbe.setListExchangeId(securityExchange);
		}

		if (fixMessage.isSetField(LastMkt.FIELD)) {
			String lastMkt = fixMessage.getString(LastMkt.FIELD);
			tbe.setTradeExchangeId(lastMkt);
		} else {
			tbe.setTradeExchangeId(tbe.getListExchangeId());
		}
		
		if (fixMessage.isSetField(CumQty.FIELD)) {
			BigDecimal filledQuantity = fixMessage.getDecimal(CumQty.FIELD);
			tbe.setQuantity(filledQuantity);
		}
		if (fixMessage.isSetField(AvgPx.FIELD)) {
			BigDecimal filledAveragePrice = fixMessage.getDecimal(AvgPx.FIELD);
			tbe.setPrice(filledAveragePrice);
		}
		tbe.setAmount(tbe.getQuantity().multiply(tbe.getPrice()));
	}
	
	public <T extends Order> void setProductIdentifier(Message fixMessage, T order) throws FieldNotFound {
		if (fixMessage.isSetField(IDSource.FIELD)) {
			String idSource = fixMessage.getString(IDSource.FIELD);
			order.setProductIdSource(idSource);
			if (fixMessage.isSetField(SecurityID.FIELD)) {
				String securityId = fixMessage.getString(SecurityID.FIELD);
				if (idSource != null) {
					if (idSource.equals("1")) {
						order.setCusip(securityId);
					} else if (idSource.equals("2")) {
						order.setSedol(securityId);
					} else if (idSource.equals("4")) {
						order.setIsin(securityId);
					}
				}
			}
		} else {
			logger.error(LogMessageConstants.ERROR_FIDESSA_IDSOURCE);
		}
	}
	public <T extends Execution> void setProductIdentifier(Message fixMessage, T execution) throws FieldNotFound {
		if (fixMessage.isSetField(IDSource.FIELD)) {
			String idSource = fixMessage.getString(IDSource.FIELD);
			execution.setProductIdSource(idSource);
			if (fixMessage.isSetField(SecurityID.FIELD)) {
				String securityId = fixMessage.getString(SecurityID.FIELD);
				if (idSource != null) {
					if (idSource.equals("1")) {
						execution.setCusip(securityId);
					} else if (idSource.equals("2")) {
						execution.setSedol(securityId);
					} else if (idSource.equals("4")) {
						execution.setIsin(securityId);
					}
				}
			}
		} else {
			logger.error(LogMessageConstants.ERROR_FIDESSA_IDSOURCE);
		}
	}
	
	public void parseOrderInfo(Message fixMessage, Order order) throws FieldNotFound {
		if (fixMessage.isSetField(ClOrdID.FIELD)) {
			String clOrdId = fixMessage.getString(ClOrdID.FIELD);
			order.setClientOrderId(clOrdId);
		}
		if (fixMessage.isSetField(OrderID.FIELD)) {
			String orderId = fixMessage.getString(OrderID.FIELD);
			order.setOrderId(orderId);
		}
		//Set Product Identifier
		setProductIdentifier(fixMessage, order);
		
		if (fixMessage.isSetField(OrdStatus.FIELD)) {
			String ordStatus = fixMessage.getString(OrdStatus.FIELD);
			order.setOrderStatus(ordStatus);
		}
		if (fixMessage.isSetField(OrdType.FIELD)) {
			String orderType = fixMessage.getString(OrdType.FIELD);
			order.setOrderType(orderType);
		}
		if (fixMessage.isSetField(Price.FIELD)) {
			BigDecimal orderPrice = fixMessage.getDecimal(Price.FIELD);
			order.setOrderPrice(orderPrice);
		}
		if (fixMessage.isSetField(TimeInForce.FIELD)) {
			String timeInForce = fixMessage.getString(TimeInForce.FIELD);
			order.setTimeInForce(timeInForce);
		}
		// String orderCapacity = fixMessage.getString(OrderCapacity.FIELD);
		if (fixMessage.isSetField(Rule80A.FIELD)) {
			String orderCapacity = fixMessage.getString(Rule80A.FIELD);
			order.setOrderCapacity(orderCapacity);
		}
		if (fixMessage.isSetField(SettlmntTyp.FIELD)) {
			String settlementType = fixMessage.getString(SettlmntTyp.FIELD);
			order.setSettlementType(settlementType);
		}
		if (fixMessage.isSetField(StopPx.FIELD)) {
			BigDecimal stopPrice = fixMessage.getDecimal(StopPx.FIELD);
			order.setOrderStopPrice(stopPrice);
		}
		if (fixMessage.isSetField(SettlCurrAmt.FIELD)) {
			BigDecimal settlementCurrencyAmount = fixMessage
					.getDecimal(SettlCurrAmt.FIELD);
			order.setSettlementAmount(settlementCurrencyAmount);
		}

		if (fixMessage.isSetField(SettlCurrency.FIELD)) {
			String settlementCurrencyCode = fixMessage
					.getString(SettlCurrency.FIELD);
			order.setSettlementCurrencyId(settlementCurrencyCode);
		}
		if (fixMessage.isSetField(ExpireTime.FIELD)) {
			Date expireTime = fixMessage.getUtcTimeStamp(ExpireTime.FIELD);
			order.setExpireTime(expireTime);
		}
		if (fixMessage.isSetField(SettlCurrFxRateCalc.FIELD)) {
			String settlementCurrencyFxRateCalculateMethod = fixMessage
					.getString(SettlCurrFxRateCalc.FIELD);
			order.setSettleCurFxRateMethod(settlementCurrencyFxRateCalculateMethod);
		}
		if (fixMessage.isSetField(CommType.FIELD)) {
			String commissionType = fixMessage.getString(CommType.FIELD);
			order.setCommissionType(commissionType);
		}
		if (fixMessage.isSetField(Commission.FIELD)) {
			BigDecimal commission = fixMessage.getDecimal(Commission.FIELD);
			order.setCommission(commission);
		}
		if (fixMessage.isSetField(OrderQty.FIELD)) {
			BigDecimal orderQty = fixMessage.getDecimal(OrderQty.FIELD);
			order.setOrderQuantity(orderQty);
		}
		if (fixMessage.isSetField(ExecInst.FIELD)) {
			String executeInstruction = fixMessage.getString(ExecInst.FIELD);
			order.setExecuteInstruction(executeInstruction);
		}
		if (fixMessage.isSetField(Issuer.FIELD)) {
			String issuer = fixMessage.getString(Issuer.FIELD);
			order.setIssuer(issuer);
		}
		if (fixMessage.isSetField(CumQty.FIELD)) {
			BigDecimal filledQuantity = fixMessage.getDecimal(CumQty.FIELD);
			order.setFilledQuantity(filledQuantity);
		}
		if (fixMessage.isSetField(AvgPx.FIELD)) {
			BigDecimal filledAveragePrice = fixMessage.getDecimal(AvgPx.FIELD);
			order.setFilledAveragePrice(filledAveragePrice);
		}
		if (fixMessage.isSetField(LastShares.FIELD)) {
			BigDecimal lastShares = fixMessage.getDecimal(LastShares.FIELD);
			order.setLastFilledQuantity(lastShares);
		}
		if (fixMessage.isSetField(LastPx.FIELD)) {
			BigDecimal lastPx = fixMessage.getDecimal(LastPx.FIELD);
			order.setLastFilledPrice(lastPx);
		}
		if (fixMessage.isSetField(ExecType.FIELD)) {
			String execType = fixMessage.getString(ExecType.FIELD);
			order.setExecType(execType);
		}
		if (fixMessage.isSetField(LeavesQty.FIELD)) {
			BigDecimal leavesQty = fixMessage.getDecimal(LeavesQty.FIELD);
			order.setLeavesQuantity(leavesQty);
		}
	}
	
	public void parseExecutionInfo(Message fixMessage, Execution execution) throws FieldNotFound {
		if (fixMessage.isSetField(ExecID.FIELD)) {
			String execId = fixMessage.getString(ExecID.FIELD);
			execution.setExecutionId(execId);
			execution.setExternalExecutionId(execId);
		}
		if (fixMessage.isSetField(ClOrdID.FIELD)) {
			String clOrdId = fixMessage.getString(ClOrdID.FIELD);
			execution.setClientOrderId(clOrdId);
		}
		if (fixMessage.isSetField(OrderID.FIELD)) {
			String orderId = fixMessage.getString(OrderID.FIELD);
			execution.setOrderId(orderId);
		}
		if (fixMessage.isSetField(ExecTransType.FIELD)) {
			String execTransType = fixMessage.getString(ExecTransType.FIELD);
			execution.setExecTransType(execTransType);
		}
		if (fixMessage.isSetField(ExecRefID.FIELD)) {
			String execRefID = fixMessage.getString(ExecRefID.FIELD);
			execution.setExecutionReferenceId(execRefID);
		}
		//Set Product Identifier
		setProductIdentifier(fixMessage, execution);
		
		if (fixMessage.isSetField(OrdStatus.FIELD)) {
			String ordStatus = fixMessage.getString(OrdStatus.FIELD);
			execution.setOrderStatus(ordStatus);
		}
		if (fixMessage.isSetField(OrdType.FIELD)) {
			String orderType = fixMessage.getString(OrdType.FIELD);
			execution.setOrderType(orderType);
		}
		if (fixMessage.isSetField(Price.FIELD)) {
			BigDecimal orderPrice = fixMessage.getDecimal(Price.FIELD);
			execution.setOrderPrice(orderPrice);
		}
		if (fixMessage.isSetField(TimeInForce.FIELD)) {
			String timeInForce = fixMessage.getString(TimeInForce.FIELD);
			execution.setTimeInForce(timeInForce);
		}
		// String orderCapacity = fixMessage.getString(OrderCapacity.FIELD);
		if (fixMessage.isSetField(Rule80A.FIELD)) {
			String orderCapacity = fixMessage.getString(Rule80A.FIELD);
			execution.setOrderCapacity(orderCapacity);
		}
		if (fixMessage.isSetField(SettlmntTyp.FIELD)) {
			String settlementType = fixMessage.getString(SettlmntTyp.FIELD);
			execution.setSettlementType(settlementType);
		}
		if (fixMessage.isSetField(StopPx.FIELD)) {
			BigDecimal stopPrice = fixMessage.getDecimal(StopPx.FIELD);
			execution.setOrderStopPrice(stopPrice);
		}
		if (fixMessage.isSetField(SettlCurrAmt.FIELD)) {
			BigDecimal settlementCurrencyAmount = fixMessage
					.getDecimal(SettlCurrAmt.FIELD);
			execution.setSettlementAmount(settlementCurrencyAmount);
		}

		if (fixMessage.isSetField(SettlCurrency.FIELD)) {
			String settlementCurrencyCode = fixMessage
					.getString(SettlCurrency.FIELD);
			execution.setSettlementCurrencyId(settlementCurrencyCode);
		}
		if (fixMessage.isSetField(ExpireTime.FIELD)) {
			Date expireTime = fixMessage.getUtcTimeStamp(ExpireTime.FIELD);
			execution.setExpireTime(expireTime);
		}
		if (fixMessage.isSetField(SettlCurrFxRateCalc.FIELD)) {
			String settlementCurrencyFxRateCalculateMethod = fixMessage
					.getString(SettlCurrFxRateCalc.FIELD);
			execution.setSettleCurFxRateMethod(settlementCurrencyFxRateCalculateMethod);
		}
		if (fixMessage.isSetField(CommType.FIELD)) {
			String commissionType = fixMessage.getString(CommType.FIELD);
			execution.setCommissionType(commissionType);
		}
		if (fixMessage.isSetField(Commission.FIELD)) {
			BigDecimal commission = fixMessage.getDecimal(Commission.FIELD);
			execution.setCommission(commission);
		}
		if (fixMessage.isSetField(OrderQty.FIELD)) {
			BigDecimal orderQty = fixMessage.getDecimal(OrderQty.FIELD);
			execution.setOrderQuantity(orderQty);
		}
		if (fixMessage.isSetField(ExecInst.FIELD)) {
			String executeInstruction = fixMessage.getString(ExecInst.FIELD);
			execution.setExecuteInstruction(executeInstruction);
		}
		if (fixMessage.isSetField(Issuer.FIELD)) {
			String issuer = fixMessage.getString(Issuer.FIELD);
			execution.setIssuer(issuer);
		}
		if (fixMessage.isSetField(CumQty.FIELD)) {
			BigDecimal filledQuantity = fixMessage.getDecimal(CumQty.FIELD);
			execution.setFilledQuantity(filledQuantity);
		}
		if (fixMessage.isSetField(AvgPx.FIELD)) {
			BigDecimal filledAveragePrice = fixMessage.getDecimal(AvgPx.FIELD);
			execution.setFilledAveragePrice(filledAveragePrice);
		}
		if (fixMessage.isSetField(LastShares.FIELD)) {
			BigDecimal lastShares = fixMessage.getDecimal(LastShares.FIELD);
			execution.setLastFilledQuantity(lastShares);
		}
		if (fixMessage.isSetField(LastPx.FIELD)) {
			BigDecimal lastPx = fixMessage.getDecimal(LastPx.FIELD);
			execution.setLastFilledPrice(lastPx);
		}
		if (fixMessage.isSetField(ExecType.FIELD)) {
			String execType = fixMessage.getString(ExecType.FIELD);
			execution.setExecType(execType);
		}
		if (fixMessage.isSetField(LeavesQty.FIELD)) {
			BigDecimal leavesQty = fixMessage.getDecimal(LeavesQty.FIELD);
			execution.setLeavesQuantity(leavesQty);
		}
	}
	
	public <T extends TransactionEntity> void setCFOrder(String bookName, T tbe) {
		// TODO change to right logic
		if (bookName == null || "".equals(bookName)) {
			return;
		}
		if (bookName.equals("FAC") || bookName.equals("SSB")) {
			tbe.setTransactionBusinessLineId("CF");
		} else {
			tbe.setTransactionBusinessLineId("AGENCY");
		}
	}
	
	public <T extends TransactionEntity> void parseCustomizedTransactionInfo(Message fixMessage, T tbe) throws FieldNotFound {
		if (fixMessage.isSetField(new StringField(CiccFidessaFixField.ciccHouseBook))) {
			String houseBook = fixMessage.getField(
					new StringField(CiccFidessaFixField.ciccHouseBook)).getValue();
			if (houseBook != null) {
				tbe.setBookAccountId(houseBook);
				setCFOrder(houseBook, tbe);
			}
		}
//		if (fixMessage.isSetField(new StringField(CiccFidessaFixField.tradingBook))) {
//			String book = fixMessage.getField(new StringField(CiccFidessaFixField.tradingBook))
//					.getValue();
//			setCFOrder(book, tbe);
//		}
//
//		if (fixMessage.isSetField(new StringField(CiccFidessaFixField.counterpartyCode))) {
//			String client = fixMessage.getField(new StringField(CiccFidessaFixField.counterpartyCode))
//					.getValue();
//			setCFOrder(client, tbe);
//		}
		Boolean isLate = false;
		if (fixMessage.isSetField(new StringField(CiccFidessaFixField.ciccTradeFlags))) {
			String tradeFlag = fixMessage.getField(new StringField(CiccFidessaFixField.ciccTradeFlags))
					.getValue();
			if (tradeFlag != null && tradeFlag.contains("LT")) {
				isLate = true;
			}
		} else {

		}
		tbe.setIsLateTrade(isLate);


		if (fixMessage.isSetField(new StringField(CiccFidessaFixField.ciccManualCrossing))) {
			String flag = fixMessage.getField(new StringField(CiccFidessaFixField.ciccManualCrossing)).getValue();
			boolean manualCrossing = ProcessConstants.STRING_TRUE.equalsIgnoreCase(flag)? true:false;
			tbe.setIsManualCrossing(manualCrossing);
		}
		
		if (fixMessage.isSetField(new StringField(CiccFidessaFixField.ciccUnsolicitMTrade))) {
			String flag = fixMessage.getField(new StringField(CiccFidessaFixField.ciccUnsolicitMTrade)).getValue();
			boolean unsolicitTrade = ProcessConstants.STRING_TRUE.equalsIgnoreCase(flag)? true:false;
			tbe.setIsUnsolicited(unsolicitTrade);
		}
		
		if (fixMessage.isSetField(new StringField(CiccFidessaFixField.ciccManualFill))) {
			String flag = fixMessage.getField(new StringField(CiccFidessaFixField.ciccManualFill)).getValue();
			boolean isManualFill = ProcessConstants.STRING_TRUE.equalsIgnoreCase(flag)? true:false;
			tbe.setIsManualFill(isManualFill);
		}
		if (fixMessage.isSetField(new StringField(CiccFidessaFixField.ciccOddLot))) {
			String flag = fixMessage.getField(new StringField(CiccFidessaFixField.ciccOddLot)).getValue();
			boolean isOddLot = ProcessConstants.STRING_TRUE.equalsIgnoreCase(flag)? true:false;
			tbe.setIsOddLot(isOddLot);
		}
		if (fixMessage.isSetField(new StringField(CiccFidessaFixField.ciccSalesId))) {
			String salesId = fixMessage.getField(new StringField(CiccFidessaFixField.ciccSalesId))
					.getValue();
			tbe.setSalesId(salesId);
		}

		if (fixMessage.isSetField(new StringField(CiccFidessaFixField.ciccDealerId))) {
			String dealerId = fixMessage.getField(new StringField(CiccFidessaFixField.ciccDealerId))
					.getValue();
			tbe.setDealerId(dealerId);
		}
		if (fixMessage.isSetField(new StringField(CiccFidessaFixField.ciccHKExBrokerId))) {
			String primaryBrokerId = fixMessage.getField(new StringField(CiccFidessaFixField.ciccHKExBrokerId))
					.getValue();
			tbe.setPrimaryBrokerId(primaryBrokerId);
		}
		if (fixMessage.isSetField(new StringField(CiccFidessaFixField.ciccCounterPartyId))) {
			String versusBrokerId = fixMessage.getField(new StringField(CiccFidessaFixField.ciccCounterPartyId))
					.getValue();
			tbe.setVersusBrokerId(versusBrokerId);
		}
	}
	
	public void parseCustomizedOrderInfo(Message fixMessage, Order order)
			throws FieldNotFound {
		
		if (fixMessage.isSetField(CiccFidessaFixField.parentOrderId)) {
			order.setParentOrderId(fixMessage.getString(CiccFidessaFixField.parentOrderId));
		}
		if (fixMessage.isSetField(CiccFidessaFixField.rootOrderId)) {
			order.setRootOrderId(fixMessage.getString(CiccFidessaFixField.rootOrderId));
		}
		if (fixMessage.isSetField(new StringField(CiccFidessaFixField.ciccClientReqId))) {
			String ciccClientReqId = fixMessage.getField(new StringField(CiccFidessaFixField.ciccClientReqId)).getValue();
			order.setCiccClientReqId(ciccClientReqId);
		} 
		if (fixMessage.isSetField(new StringField(CiccFidessaFixField.ciccClientOrdId))) {
			String ciccClientOrdId = fixMessage.getField(new StringField(CiccFidessaFixField.ciccClientOrdId)).getValue();
			order.setCiccClientOrdId(ciccClientOrdId);
		} 
		if (fixMessage.isSetField(new StringField(CiccFidessaFixField.ciccParentOrderId))) {
			String ciccParentOrdId = fixMessage.getField(new StringField(CiccFidessaFixField.ciccParentOrderId)).getValue();
			order.setParentOrderId(ciccParentOrdId);
		} 

		if (fixMessage.isSetField(CiccFidessaFixField.workflowInd)) {

			order.setTransactionChannel("FIX");

			String subAccount = "";
			if (fixMessage.isSetField(Account.FIELD)) {
				subAccount = fixMessage.getString(Account.FIELD);
				if (subAccount == null || subAccount.isEmpty()
						|| subAccount.startsWith("_")) {
					subAccount = "";
				}
			} else {
				// hack for the missing sub-account for Fidessa
				// List<ExecutionDAO> original =
				// LocalServcieProvider.getOrderByIDWithoutFilter(temp);
				List<Order> orderList = new ArrayList<Order>();
				// if the order is new and without sub account, then it is
				// really no sub-account
				if (orderList == null || orderList.isEmpty()) {
					subAccount = "";
				} else {
					// if the order is not new, then if sub-account is not set,
					// it succeeds the former's
					// subAccount = original.get(0).getAllocInst();
				}
			}
			// order.setAllocInst(subAccount);
		}
	}
	
	protected void parseCustomizedExecutionInfo(Message fixMessage,
			Execution execution) throws FieldNotFound {

		
		if (fixMessage.isSetField(CiccFidessaFixField.parentOrderId)) {
			execution.setParentOrderId(fixMessage.getString(CiccFidessaFixField.parentOrderId));
		}
		if (fixMessage.isSetField(CiccFidessaFixField.rootOrderId)) {
			execution.setRootOrderId(fixMessage.getString(CiccFidessaFixField.rootOrderId));
		}
		if (fixMessage.isSetField(new StringField(CiccFidessaFixField.ciccClientReqId))) {
			String ciccClientReqId = fixMessage.getField(new StringField(CiccFidessaFixField.ciccClientReqId)).getValue();
			execution.setCiccClientReqId(ciccClientReqId);
		} 
		if (fixMessage.isSetField(new StringField(CiccFidessaFixField.ciccClientOrdId))) {
			String ciccClientOrdId = fixMessage.getField(new StringField(CiccFidessaFixField.ciccClientOrdId)).getValue();
			execution.setCiccClientOrdId(ciccClientOrdId);
		} 
		if (fixMessage.isSetField(new StringField(CiccFidessaFixField.ciccParentOrderId))) {
			String ciccParentOrdId = fixMessage.getField(new StringField(CiccFidessaFixField.ciccParentOrderId)).getValue();
			execution.setParentOrderId(ciccParentOrdId);
		} 
		
	}

}

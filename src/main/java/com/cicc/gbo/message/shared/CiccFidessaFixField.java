package com.cicc.gbo.message.shared;


/**
 * @author Guo Hua
 * @version 下午6:00:20 2014年9月13日 
 */
public class CiccFidessaFixField {

	public static final int FIDESSA_RECORD_TYPE = 5401;

	//FIDESSA customized
	public static final int account = 1;
	public static final int avgPrice = 6;
	public static final int cliOrdId = 11;
	public static final int commission = 12;
	public static final int commissionType = 13;
	public static final int cumQuantity = 14;
	public static final int dealtCurrency = 15;
	public static final int execId = 17;
	public static final int execInstructions = 18;
	public static final int execRefId = 19;
	public static final int execTransType = 20;
	public static final int idSource = 22;
	public static final int lastCapacity = 29;
	public static final int lastMkt = 30;
	public static final int lastStoppedPrice = 31;
	public static final int lastStoppedQuantity = 32;
	public static final int ubaMsgType = 35;
	public static final int orderId = 37;
	public static final int orderQuantity = 38;
	public static final int orderStatus = 39;
	public static final int marketOrderType = 40; //Market, Limit, Stop, Stop Limit, Mkt Close, Limist Close
	public static final int price = 44;
	public static final int orderCapacity = 47;
	public static final int securityId = 48;
	public static final int side = 54;
	public static final int symbol = 55;
	public static final int text = 58;
	public static final int timeInForce = 59;
	public static final int transactStoppedDatetime = 60; //YYYYMMDD-hh:mm:ss
	public static final int settlementType = 63;
	public static final int settlementDate = 64; //YYYYMMDD
	public static final int symbolSuffix = 65;
	public static final int tradeDate = 75; //YYYYMMDD;
	public static final int execBroker = 76;
	public static final int openClose = 77;
	public static final int processCode = 81; //0 or 1
	public static final int stopPx = 99;
	public static final int counterpartyCode = 109;
	public static final int settleCurrency = 120;
	public static final int expiryDatetime = 126; //YYYYMMDD-hh:mm:ss
	public static final int execType = 150; //For stopped orders, the name "isStoppendFull"
	public static final int leavesQty = 151;
	public static final int settlementCurrencyRateCalc = 156;
	public static final int securityType = 167;
	public static final int securityExchange = 207;
	public static final int altExecHouseBook = 375;
	public static final int locateBroker = 5700;
	public static final int basketRef = 6376;
	public static final int benchmarkPrice = 6442;
	public static final int deskId = 6871;
	public static final int basketId = 7468;
	public static final int altTradeId = 7562;
	public static final int altEventType = 8001;
	public static final int eventDatetime = 8002; //YYYYMMDD hh:mm:ss:ssssss +/- GMT offset
	public static final int orderVersion = 8004;
	public static final int parentOrderId = 8011;
	public static final int orderOriginatorId = 8016;
	public static final int orderFlags = 8021;
	public static final int tradeFlags = 8022;
	public static final int primaryMkt = 8031;
	public static final int marketMaker = 8033;
	public static final int routedOrderCode = 8040;
	public static final int currentServiceId = 8041;
	public static final int currentExecutor = 8043;
	public static final int settlementNotes = 8052;
	public static final int streetSideCpty = 8055;
	public static final int tradingBook = 8056;
	public static final int firmAccount = 8058;
	public static final int crossIndicator = 8059;
	public static final int execDatetime = 8061;
	public static final int enteredBy = 8062;
	public static final int bidPrice = 8065;
	public static final int offerPrice = 8066;
	public static final int minimumCharge = 8069;
	public static final int maximumCharge = 8070;
	public static final int commissionAmount = 8071;
	public static final int statusIndicator = 8072;
	public static final int defaultCommissionRule = 8073;
	public static final int qtyAvail = 8074;
	public static final int clientOrderType = 8075; //Client, House
	public static final int rootOrderId = 8076;
	public static final int execAccountCode = 8077;
	public static final int rootOriginatorOrderId = 8078;
	public static final int markupType = 8080; //Per Unit, Percentage, Fixed Amount, Basis Point, SlidingScale
	public static final int markupAmount = 8081;
	public static final int salesCreditType = 8082; //same to markupType
	public static final int salesCreditRate = 8083;
	public static final int frontOfficeNote = 8084;
	public static final int specialCreditAmount = 8085;
	public static final int tradeSource = 8086; //FTW, NMS, EXPRESS, Drop copy
	public static final int brokerageType = 8088;
	public static final int brokerageRate = 8089;
	public static final int brokerageAmount = 8090;
	public static final int specialCreditType = 8091;
	public static final int specialCreditRate = 8092;
	public static final int specialCreditIndicator = 8093; //Gross, Net Local
	public static final int cptyCodeType = 8094; //Client-Side, Market-Side
	public static final int firmShortSell = 8095; // N-Not a short sell, S-Short sell, X-Short sell exempt
	public static final int cptyBook = 8096;
	public static final int giveupCpty = 8097;
	public static final int risklessTxn = 8098;
	public static final int cptyBookAcct = 8099;
	public static final int isinCode = 8100;
	public static final int workflowInd = 8101; // DLA, BASKET, CARE
	public static final int custSettlType = 8102; 
	public static final int eventQual1 = 8109;
	public static final int eventQual2 = 8110;
	public static final int eventQual3 = 8111;
	public static final int eventQual4 = 8112;
	public static final int eventQual5 = 8113;
	public static final int representativeId = 8115;
	public static final int custOriginatingCounterparty = 8117;
	public static final int globalOrderId = 8118;
	public static final int fxRate = 8120;
	public static final int markupRate = 8121;
	public static final int numCharges = 8125;
	public static final int chargeName = 8126;
	public static final int chargeType = 8127;
	public static final int chargeRate = 8128;
	public static final int chargeAmount = 8129;
	public static final int maturityDate = 8151; // YYYYMMDD
	public static final int optionType = 8152;
	public static final int optionVersion = 8153;
	public static final int contractSize = 8154;
	public static final int exerciseType = 8155;
	public static final int strikePrice = 8156;
	public static final int positionEffect = 8157;
	public static final int customerOrFirm = 8158; // C-Customer, F-Firm, B-Broker, A-Broker as Client
	public static final int clearingFirm = 8159;
	public static final int cmtaAccount = 8160;
	public static final int numberOfLegs = 8170;
	public static final int legRatioQuantity = 8171;
	public static final int legReference = 8172;
	public static final int whenIssuedInd = 8200;
	public static final int booking = 8320; //0-New, 1-Amend, 2-Cancel
	public static final int groupBookingId = 8337;
	public static final int numberOfOrdersInBooking = 8341;
	public static final int bookingOrderId = 8311;
	public static final int liquidityIndicator = 9730;
	public static final int risklessCapacity = 9862;
	
	//CICC customized
	public static final int ciccParentOrderId = 9580;
	public static final int ciccMarginCheck = 9582;
	public static final int ciccCancelBasket = 9584;
	public static final int ciccManualCrossing = 9586;
	public static final int ciccUnsolicitMTrade = 9587;
	public static final int ciccManualFill = 9588;
	public static final int ciccOddLot = 9589;
	public static final int ciccClientReqId = 20011;
	public static final int ciccHKExBrokerCommand = 20036;
	public static final int ciccClientOrdId = 20037;
	public static final int ciccParentOrdId = 20038;
	public static final int ciccSalesId = 20050;
	public static final int ciccDealerId = 20051;
	public static final int ciccHKExBrokerId = 20059;
	public static final int ciccCounterPartyId = 20060;
	public static final int ciccRegion = 20061;
	public static final int ciccHouseBook = 8053;
	public static final int ciccTradeFlags = 6450;
	
	//CICC customized header
	public static final int ciccOrdOwnerId = 5331;
	public static final int ciccMsgSeqNum = 20034;
	public static final int ciccMsgType = 20035;
	
}

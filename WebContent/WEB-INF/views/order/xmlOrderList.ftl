<#import "/gaf/common.ftl" as common/>
<#compress>
<response>
<@common.jqGridContext/>
  <rows>
   <#escape x as x?xml>
    <#list entityList as order>
      <row>
                       <amount>${order.amount!''}</amount>     
                                    <bookAccountId>${order.bookAccountId!''}</bookAccountId>     
                                    <childRecordId>${order.childRecordId!''}</childRecordId>     
                                    <ciccClientOrdId>${order.ciccClientOrdId!''}</ciccClientOrdId>     
                                    <ciccClientReqId>${order.ciccClientReqId!''}</ciccClientReqId>     
                                    <ciccParentOrdId>${order.ciccParentOrdId!''}</ciccParentOrdId>     
                                    <clearingAccountId>${order.clearingAccountId!''}</clearingAccountId>     
                                    <clearingBrokerId>${order.clearingBrokerId!''}</clearingBrokerId>     
                                    <clientOrderId>${order.clientOrderId!''}</clientOrderId>     
                                    <commission>${order.commission!''}</commission>     
                                    <commissionType>${order.commissionType!''}</commissionType>     
                                    <createdBy>${order.createdBy!''}</createdBy>     
                                    <cusip>${order.cusip!''}</cusip>     
                                    <dealerId>${order.dealerId!''}</dealerId>     
                                                  <execType>${order.execType!''}</execType>     
                                    <executeInstruction>${order.executeInstruction!''}</executeInstruction>     
                                    <expireTime><#if order.expireTime?exists>${order.expireTime?string("yyyy-MM-dd")}</#if></expireTime>
                                    <externalRecordId>${order.externalRecordId!''}</externalRecordId>     
                                    <filledAveragePrice>${order.filledAveragePrice!''}</filledAveragePrice>     
                                    <filledQuantity>${order.filledQuantity!''}</filledQuantity>     
                                    <groupRecordId>${order.groupRecordId!''}</groupRecordId>     
                                    <insertTime><#if order.insertTime?exists>${order.insertTime?string("yyyy-MM-dd")}</#if></insertTime>
                                    <internalRecordId>${order.internalRecordId!''}</internalRecordId>     
                                    <introducerAccountId>${order.introducerAccountId!''}</introducerAccountId>     
                                    <isLateTrade><#if order.isLateTrade?exists>${order.isLateTrade?string('Y','N')}</#if></isLateTrade>     
                                    <isManualCrossing><#if order.isManualCrossing?exists>${order.isManualCrossing?string('Y','N')}</#if></isManualCrossing>     
                                    <isManualFill><#if order.isManualFill?exists>${order.isManualFill?string('Y','N')}</#if></isManualFill>     
                                    <isOddLot><#if order.isOddLot?exists>${order.isOddLot?string('Y','N')}</#if></isOddLot>     
                                    <isUnsolicited><#if order.isUnsolicited?exists>${order.isUnsolicited?string('Y','N')}</#if></isUnsolicited>     
                                    <isin>${order.isin!''}</isin>     
                                    <issuer>${order.issuer!''}</issuer>     
                                    <lastFilledPrice>${order.lastFilledPrice!''}</lastFilledPrice>     
                                    <lastFilledQuantity>${order.lastFilledQuantity!''}</lastFilledQuantity>     
                                    <lastUpdateTime><#if order.lastUpdateTime?exists>${order.lastUpdateTime?string("yyyy-MM-dd")}</#if></lastUpdateTime>
                                    <leavesQuantity>${order.leavesQuantity!''}</leavesQuantity>     
                                    <listExchangeId>${order.listExchangeId!''}</listExchangeId>     
                                    <orderCapacity>${order.orderCapacity!''}</orderCapacity>     
                                    <orderId>${order.orderId!''}</orderId>     
                                    <orderPrice>${order.orderPrice!''}</orderPrice>     
                                    <orderQuantity>${order.orderQuantity!''}</orderQuantity>     
                                    <orderStatus>${order.orderStatus!''}</orderStatus>     
                                    <orderStopPrice>${order.orderStopPrice!''}</orderStopPrice>     
                                    <orderType>${order.orderType!''}</orderType>     
                                    <parentOrderId>${order.parentOrderId!''}</parentOrderId>     
                                    <parentRecordId>${order.parentRecordId!''}</parentRecordId>     
                                    <price>${order.price!''}</price>     
                                    <primaryAccountId>${order.primaryAccountId!''}</primaryAccountId>     
                                    <primaryAccountLocation>${order.primaryAccountLocation!''}</primaryAccountLocation>     
                                    <primaryBrokerId>${order.primaryBrokerId!''}</primaryBrokerId>     
                                    <productId>${order.productId!''}</productId>     
                                    <productIdSource>${order.productIdSource!''}</productIdSource>     
                                    <productType>${order.productType!''}</productType>     
                                    <quantity>${order.quantity!''}</quantity>     
                                    <recordRemark>${order.recordRemark!''}</recordRemark>     
                                    <recordStatus>${order.recordStatus!''}</recordStatus>     
                                    <rootOrderId>${order.rootOrderId!''}</rootOrderId>     
                                    <rootRecordId>${order.rootRecordId!''}</rootRecordId>     
                                    <salesId>${order.salesId!''}</salesId>     
                                    <sedol>${order.sedol!''}</sedol>     
                                    <settleCurFxRateMethod>${order.settleCurFxRateMethod!''}</settleCurFxRateMethod>     
                                    <settlementAmount>${order.settlementAmount!''}</settlementAmount>     
                                    <settlementCurrency>${order.settlementCurrency!''}</settlementCurrency>     
                                    <settlementCurrencyId>${order.settlementCurrencyId!''}</settlementCurrencyId>     
                                    <settlementDate><#if order.settlementDate?exists>${order.settlementDate?string("yyyy-MM-dd")}</#if></settlementDate>
                                    <settlementType>${order.settlementType!''}</settlementType>     
                                    <side>${order.side!''}</side>     
                                    <templateGroupId>${order.templateGroupId!''}</templateGroupId>     
                                    <timeInForce>${order.timeInForce!''}</timeInForce>     
                                    <tradeExchangeId>${order.tradeExchangeId!''}</tradeExchangeId>     
                                    <tradingCurrency>${order.tradingCurrency!''}</tradingCurrency>     
                                    <tradingDate><#if order.tradingDate?exists>${order.tradingDate?string("yyyy-MM-dd")}</#if></tradingDate>
                                    <transactionBatchId>${order.transactionBatchId!''}</transactionBatchId>     
                                    <transactionBusinessCode>${order.transactionBusinessCode!''}</transactionBusinessCode>     
                                    <transactionBusinessLineId>${order.transactionBusinessLineId!''}</transactionBusinessLineId>     
                                    <transactionCategory>${order.transactionCategory!''}</transactionCategory>     
                                    <transactionChannel>${order.transactionChannel!''}</transactionChannel>     
                                    <transactionFeedMethod>${order.transactionFeedMethod!''}</transactionFeedMethod>     
                                    <transactionId>${order.transactionId!''}</transactionId>     
                                    <transactionStatus>${order.transactionStatus!''}</transactionStatus>     
                                    <transactionSystem>${order.transactionSystem!''}</transactionSystem>     
                                    <transactionTime><#if order.transactionTime?exists>${order.transactionTime?string("yyyy-MM-dd")}</#if></transactionTime>
                                    <updatedBy>${order.updatedBy!''}</updatedBy>     
                                    <versionNumber>${order.versionNumber!''}</versionNumber>     
                                    <versusAccountId>${order.versusAccountId!''}</versusAccountId>     
                                    <versusAccountLocation>${order.versusAccountLocation!''}</versusAccountLocation>     
                                    <versusBrokerId>${order.versusBrokerId!''}</versusBrokerId>     
                                    <washAccountId>${order.washAccountId!''}</washAccountId>     
                          <entityId><#if order.entityId?exists>${order.entityId?c}</#if></entityId>
  </row>
    </#list>
   </#escape>
  </rows>
</response>
</#compress>  
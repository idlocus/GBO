<#import "/gaf/common.ftl" as common/>
<#compress>
<response>
<@common.jqGridContext/>
  <rows>
   <#escape x as x?xml>
    <#list entityList as execution>
      <row>
                       <amount>${execution.amount!''}</amount>     
                                    <bookAccountId>${execution.bookAccountId!''}</bookAccountId>     
                                    <childRecordId>${execution.childRecordId!''}</childRecordId>     
                                    <ciccClientOrdId>${execution.ciccClientOrdId!''}</ciccClientOrdId>     
                                    <ciccClientReqId>${execution.ciccClientReqId!''}</ciccClientReqId>     
                                    <ciccParentOrdId>${execution.ciccParentOrdId!''}</ciccParentOrdId>     
                                    <clearingAccountId>${execution.clearingAccountId!''}</clearingAccountId>     
                                    <clearingBrokerId>${execution.clearingBrokerId!''}</clearingBrokerId>     
                                    <clientOrderId>${execution.clientOrderId!''}</clientOrderId>     
                                    <commission>${execution.commission!''}</commission>     
                                    <commissionType>${execution.commissionType!''}</commissionType>     
                                    <createdBy>${execution.createdBy!''}</createdBy>     
                                    <cusip>${execution.cusip!''}</cusip>     
                                    <dealerId>${execution.dealerId!''}</dealerId>     
                                                  <execTransType>${execution.execTransType!''}</execTransType>     
                                    <execType>${execution.execType!''}</execType>     
                                    <executeInstruction>${execution.executeInstruction!''}</executeInstruction>     
                                    <executionId>${execution.executionId!''}</executionId>     
                                    <executionReferenceId>${execution.executionReferenceId!''}</executionReferenceId>     
                                    <expireTime><#if execution.expireTime?exists>${execution.expireTime?string("yyyy-MM-dd")}</#if></expireTime>
                                    <externalExecutionId>${execution.externalExecutionId!''}</externalExecutionId>     
                                    <externalRecordId>${execution.externalRecordId!''}</externalRecordId>     
                                    <filledAveragePrice>${execution.filledAveragePrice!''}</filledAveragePrice>     
                                    <filledQuantity>${execution.filledQuantity!''}</filledQuantity>     
                                    <groupRecordId>${execution.groupRecordId!''}</groupRecordId>     
                                    <insertTime><#if execution.insertTime?exists>${execution.insertTime?string("yyyy-MM-dd")}</#if></insertTime>
                                    <internalRecordId>${execution.internalRecordId!''}</internalRecordId>     
                                    <introducerAccountId>${execution.introducerAccountId!''}</introducerAccountId>     
                                    <isLateTrade><#if execution.isLateTrade?exists>${execution.isLateTrade?string('Y','N')}</#if></isLateTrade>     
                                    <isManualCrossing><#if execution.isManualCrossing?exists>${execution.isManualCrossing?string('Y','N')}</#if></isManualCrossing>     
                                    <isManualFill><#if execution.isManualFill?exists>${execution.isManualFill?string('Y','N')}</#if></isManualFill>     
                                    <isOddLot><#if execution.isOddLot?exists>${execution.isOddLot?string('Y','N')}</#if></isOddLot>     
                                    <isUnsolicited><#if execution.isUnsolicited?exists>${execution.isUnsolicited?string('Y','N')}</#if></isUnsolicited>     
                                    <isin>${execution.isin!''}</isin>     
                                    <issuer>${execution.issuer!''}</issuer>     
                                    <lastFilledPrice>${execution.lastFilledPrice!''}</lastFilledPrice>     
                                    <lastFilledQuantity>${execution.lastFilledQuantity!''}</lastFilledQuantity>     
                                    <lastUpdateTime><#if execution.lastUpdateTime?exists>${execution.lastUpdateTime?string("yyyy-MM-dd")}</#if></lastUpdateTime>
                                    <leavesQuantity>${execution.leavesQuantity!''}</leavesQuantity>     
                                    <listExchangeId>${execution.listExchangeId!''}</listExchangeId>     
                                    <orderCapacity>${execution.orderCapacity!''}</orderCapacity>     
                                    <orderId>${execution.orderId!''}</orderId>     
                                    <orderPrice>${execution.orderPrice!''}</orderPrice>     
                                    <orderQuantity>${execution.orderQuantity!''}</orderQuantity>     
                                    <orderStatus>${execution.orderStatus!''}</orderStatus>     
                                    <orderStopPrice>${execution.orderStopPrice!''}</orderStopPrice>     
                                    <orderType>${execution.orderType!''}</orderType>     
                                    <parentOrderId>${execution.parentOrderId!''}</parentOrderId>     
                                    <parentRecordId>${execution.parentRecordId!''}</parentRecordId>     
                                    <price>${execution.price!''}</price>     
                                    <primaryAccountId>${execution.primaryAccountId!''}</primaryAccountId>     
                                    <primaryAccountLocation>${execution.primaryAccountLocation!''}</primaryAccountLocation>     
                                    <primaryBrokerId>${execution.primaryBrokerId!''}</primaryBrokerId>     
                                    <productId>${execution.productId!''}</productId>     
                                    <productIdSource>${execution.productIdSource!''}</productIdSource>     
                                    <productType>${execution.productType!''}</productType>     
                                    <quantity>${execution.quantity!''}</quantity>     
                                    <recordRemark>${execution.recordRemark!''}</recordRemark>     
                                    <recordStatus>${execution.recordStatus!''}</recordStatus>     
                                    <rootOrderId>${execution.rootOrderId!''}</rootOrderId>     
                                    <rootRecordId>${execution.rootRecordId!''}</rootRecordId>     
                                    <salesId>${execution.salesId!''}</salesId>     
                                    <sedol>${execution.sedol!''}</sedol>     
                                    <settleCurFxRateMethod>${execution.settleCurFxRateMethod!''}</settleCurFxRateMethod>     
                                    <settlementAmount>${execution.settlementAmount!''}</settlementAmount>     
                                    <settlementCurrency>${execution.settlementCurrency!''}</settlementCurrency>     
                                    <settlementCurrencyId>${execution.settlementCurrencyId!''}</settlementCurrencyId>     
                                    <settlementDate><#if execution.settlementDate?exists>${execution.settlementDate?string("yyyy-MM-dd")}</#if></settlementDate>
                                    <settlementType>${execution.settlementType!''}</settlementType>     
                                    <side>${execution.side!''}</side>     
                                    <templateGroupId>${execution.templateGroupId!''}</templateGroupId>     
                                    <timeInForce>${execution.timeInForce!''}</timeInForce>     
                                    <tradeExchangeId>${execution.tradeExchangeId!''}</tradeExchangeId>     
                                    <tradingCurrency>${execution.tradingCurrency!''}</tradingCurrency>     
                                    <tradingDate><#if execution.tradingDate?exists>${execution.tradingDate?string("yyyy-MM-dd")}</#if></tradingDate>
                                    <transactionBatchId>${execution.transactionBatchId!''}</transactionBatchId>     
                                    <transactionBusinessCode>${execution.transactionBusinessCode!''}</transactionBusinessCode>     
                                    <transactionBusinessLineId>${execution.transactionBusinessLineId!''}</transactionBusinessLineId>     
                                    <transactionCategory>${execution.transactionCategory!''}</transactionCategory>     
                                    <transactionChannel>${execution.transactionChannel!''}</transactionChannel>     
                                    <transactionFeedMethod>${execution.transactionFeedMethod!''}</transactionFeedMethod>     
                                    <transactionId>${execution.transactionId!''}</transactionId>     
                                    <transactionStatus>${execution.transactionStatus!''}</transactionStatus>     
                                    <transactionSystem>${execution.transactionSystem!''}</transactionSystem>     
                                    <transactionTime><#if execution.transactionTime?exists>${execution.transactionTime?string("yyyy-MM-dd")}</#if></transactionTime>
                                    <updatedBy>${execution.updatedBy!''}</updatedBy>     
                                    <versionNumber>${execution.versionNumber!''}</versionNumber>     
                                    <versusAccountId>${execution.versusAccountId!''}</versusAccountId>     
                                    <versusAccountLocation>${execution.versusAccountLocation!''}</versusAccountLocation>     
                                    <versusBrokerId>${execution.versusBrokerId!''}</versusBrokerId>     
                                    <washAccountId>${execution.washAccountId!''}</washAccountId>     
                          <entityId><#if execution.entityId?exists>${execution.entityId?c}</#if></entityId>
  </row>
    </#list>
   </#escape>
  </rows>
</response>
</#compress>  
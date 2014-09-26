<#import "/gaf/common.ftl" as common/>
<#compress>
<response>
<@common.jqGridContext/>
  <rows>
   <#escape x as x?xml>
    <#list entityList as trade>
      <row>
                       <amount>${trade.amount!''}</amount>     
                                    <bookAccountId>${trade.bookAccountId!''}</bookAccountId>     
                                    <childRecordId>${trade.childRecordId!''}</childRecordId>     
                                    <clearingAccountId>${trade.clearingAccountId!''}</clearingAccountId>     
                                    <clearingBrokerId>${trade.clearingBrokerId!''}</clearingBrokerId>     
                                    <createdBy>${trade.createdBy!''}</createdBy>     
                                    <dealerId>${trade.dealerId!''}</dealerId>     
                                                  <externalRecordId>${trade.externalRecordId!''}</externalRecordId>     
                                    <groupRecordId>${trade.groupRecordId!''}</groupRecordId>     
                                    <insertTime><#if trade.insertTime?exists>${trade.insertTime?string("yyyy-MM-dd")}</#if></insertTime>
                                    <internalRecordId>${trade.internalRecordId!''}</internalRecordId>     
                                    <introducerAccountId>${trade.introducerAccountId!''}</introducerAccountId>     
                                    <isLateTrade><#if trade.isLateTrade?exists>${trade.isLateTrade?string('Y','N')}</#if></isLateTrade>     
                                    <isManualCrossing><#if trade.isManualCrossing?exists>${trade.isManualCrossing?string('Y','N')}</#if></isManualCrossing>     
                                    <isManualFill><#if trade.isManualFill?exists>${trade.isManualFill?string('Y','N')}</#if></isManualFill>     
                                    <isOddLot><#if trade.isOddLot?exists>${trade.isOddLot?string('Y','N')}</#if></isOddLot>     
                                    <isUnsolicited><#if trade.isUnsolicited?exists>${trade.isUnsolicited?string('Y','N')}</#if></isUnsolicited>     
                                    <lastUpdateTime><#if trade.lastUpdateTime?exists>${trade.lastUpdateTime?string("yyyy-MM-dd")}</#if></lastUpdateTime>
                                    <listExchangeId>${trade.listExchangeId!''}</listExchangeId>     
                                    <parentRecordId>${trade.parentRecordId!''}</parentRecordId>     
                                    <price>${trade.price!''}</price>     
                                    <primaryAccountId>${trade.primaryAccountId!''}</primaryAccountId>     
                                    <primaryAccountLocation>${trade.primaryAccountLocation!''}</primaryAccountLocation>     
                                    <primaryBrokerId>${trade.primaryBrokerId!''}</primaryBrokerId>     
                                    <productId>${trade.productId!''}</productId>     
                                    <productType>${trade.productType!''}</productType>     
                                    <quantity>${trade.quantity!''}</quantity>     
                                    <recordRemark>${trade.recordRemark!''}</recordRemark>     
                                    <recordStatus>${trade.recordStatus!''}</recordStatus>     
                                    <rootRecordId>${trade.rootRecordId!''}</rootRecordId>     
                                    <salesId>${trade.salesId!''}</salesId>     
                                    <settlementCurrency>${trade.settlementCurrency!''}</settlementCurrency>     
                                    <settlementDate><#if trade.settlementDate?exists>${trade.settlementDate?string("yyyy-MM-dd")}</#if></settlementDate>
                                    <side>${trade.side!''}</side>     
                                    <templateGroupId>${trade.templateGroupId!''}</templateGroupId>     
                                    <templateId>${trade.templateId!''}</templateId>     
                                    <tradeExchangeId>${trade.tradeExchangeId!''}</tradeExchangeId>     
                                    <tradingCurrency>${trade.tradingCurrency!''}</tradingCurrency>     
                                    <tradingDate><#if trade.tradingDate?exists>${trade.tradingDate?string("yyyy-MM-dd")}</#if></tradingDate>
                                    <transactionBatchId>${trade.transactionBatchId!''}</transactionBatchId>     
                                    <transactionBusinessCode>${trade.transactionBusinessCode!''}</transactionBusinessCode>     
                                    <transactionBusinessLineId>${trade.transactionBusinessLineId!''}</transactionBusinessLineId>     
                                    <transactionCategory>${trade.transactionCategory!''}</transactionCategory>     
                                    <transactionChannel>${trade.transactionChannel!''}</transactionChannel>     
                                    <transactionFeedMethod>${trade.transactionFeedMethod!''}</transactionFeedMethod>     
                                    <transactionId>${trade.transactionId!''}</transactionId>     
                                    <transactionStatus>${trade.transactionStatus!''}</transactionStatus>     
                                    <transactionSystem>${trade.transactionSystem!''}</transactionSystem>     
                                    <transactionTime><#if trade.transactionTime?exists>${trade.transactionTime?string("yyyy-MM-dd")}</#if></transactionTime>
                                    <updatedBy>${trade.updatedBy!''}</updatedBy>     
                                    <versionNumber>${trade.versionNumber!''}</versionNumber>     
                                    <versusAccountId>${trade.versusAccountId!''}</versusAccountId>     
                                    <versusAccountLocation>${trade.versusAccountLocation!''}</versusAccountLocation>     
                                    <versusBrokerId>${trade.versusBrokerId!''}</versusBrokerId>     
                                    <washAccountId>${trade.washAccountId!''}</washAccountId>     
                          <entityId><#if trade.entityId?exists>${trade.entityId?c}</#if></entityId>
  </row>
    </#list>
   </#escape>
  </rows>
</response>
</#compress>  
<#import "/gaf/common.ftl" as common/>
<#compress>
<response>
<@common.jqGridContext/>
  <rows>
   <#escape x as x?xml>
    <#list entityList as tradeTemplate>
      <row>
                       <amount>${tradeTemplate.amount!''}</amount>     
                                    <bookAccountId>${tradeTemplate.bookAccountId!''}</bookAccountId>     
                                    <childRecordId>${tradeTemplate.childRecordId!''}</childRecordId>     
                                    <clearingAccountId>${tradeTemplate.clearingAccountId!''}</clearingAccountId>     
                                    <clearingBrokerId>${tradeTemplate.clearingBrokerId!''}</clearingBrokerId>     
                                    <createdBy>${tradeTemplate.createdBy!''}</createdBy>     
                                    <dealerId>${tradeTemplate.dealerId!''}</dealerId>     
                                                  <externalRecordId>${tradeTemplate.externalRecordId!''}</externalRecordId>     
                                    <groupRecordId>${tradeTemplate.groupRecordId!''}</groupRecordId>     
                                    <insertTime><#if tradeTemplate.insertTime?exists>${tradeTemplate.insertTime?string("yyyy-MM-dd")}</#if></insertTime>
                                    <internalRecordId>${tradeTemplate.internalRecordId!''}</internalRecordId>     
                                    <introducerAccountId>${tradeTemplate.introducerAccountId!''}</introducerAccountId>     
                                    <isLateTrade><#if tradeTemplate.isLateTrade?exists>${tradeTemplate.isLateTrade?string('Y','N')}</#if></isLateTrade>     
                                    <isManualCrossing><#if tradeTemplate.isManualCrossing?exists>${tradeTemplate.isManualCrossing?string('Y','N')}</#if></isManualCrossing>     
                                    <isManualFill><#if tradeTemplate.isManualFill?exists>${tradeTemplate.isManualFill?string('Y','N')}</#if></isManualFill>     
                                    <isOddLot><#if tradeTemplate.isOddLot?exists>${tradeTemplate.isOddLot?string('Y','N')}</#if></isOddLot>     
                                    <isUnsolicited><#if tradeTemplate.isUnsolicited?exists>${tradeTemplate.isUnsolicited?string('Y','N')}</#if></isUnsolicited>     
                                    <lastUpdateTime><#if tradeTemplate.lastUpdateTime?exists>${tradeTemplate.lastUpdateTime?string("yyyy-MM-dd")}</#if></lastUpdateTime>
                                    <listExchangeId>${tradeTemplate.listExchangeId!''}</listExchangeId>     
                                    <parentRecordId>${tradeTemplate.parentRecordId!''}</parentRecordId>     
                                    <price>${tradeTemplate.price!''}</price>     
                                    <primaryAccountId>${tradeTemplate.primaryAccountId!''}</primaryAccountId>     
                                    <primaryAccountLocation>${tradeTemplate.primaryAccountLocation!''}</primaryAccountLocation>     
                                    <primaryBrokerId>${tradeTemplate.primaryBrokerId!''}</primaryBrokerId>     
                                    <productId>${tradeTemplate.productId!''}</productId>     
                                    <productType>${tradeTemplate.productType!''}</productType>     
                                    <quantity>${tradeTemplate.quantity!''}</quantity>     
                                    <recordRemark>${tradeTemplate.recordRemark!''}</recordRemark>     
                                    <recordStatus>${tradeTemplate.recordStatus!''}</recordStatus>     
                                    <rootRecordId>${tradeTemplate.rootRecordId!''}</rootRecordId>     
                                    <salesId>${tradeTemplate.salesId!''}</salesId>     
                                    <settlementCurrency>${tradeTemplate.settlementCurrency!''}</settlementCurrency>     
                                    <settlementDate><#if tradeTemplate.settlementDate?exists>${tradeTemplate.settlementDate?string("yyyy-MM-dd")}</#if></settlementDate>
                                    <side>${tradeTemplate.side!''}</side>     
                                    <templateGroupId>${tradeTemplate.templateGroupId!''}</templateGroupId>     
                                    <templateId>${tradeTemplate.templateId!''}</templateId>     
                                    <tradeExchangeId>${tradeTemplate.tradeExchangeId!''}</tradeExchangeId>     
                                    <tradingCurrency>${tradeTemplate.tradingCurrency!''}</tradingCurrency>     
                                    <tradingDate><#if tradeTemplate.tradingDate?exists>${tradeTemplate.tradingDate?string("yyyy-MM-dd")}</#if></tradingDate>
                                    <transactionBatchId>${tradeTemplate.transactionBatchId!''}</transactionBatchId>     
                                    <transactionBusinessCode>${tradeTemplate.transactionBusinessCode!''}</transactionBusinessCode>     
                                    <transactionBusinessLineId>${tradeTemplate.transactionBusinessLineId!''}</transactionBusinessLineId>     
                                    <transactionCategory>${tradeTemplate.transactionCategory!''}</transactionCategory>     
                                    <transactionChannel>${tradeTemplate.transactionChannel!''}</transactionChannel>     
                                    <transactionFeedMethod>${tradeTemplate.transactionFeedMethod!''}</transactionFeedMethod>     
                                    <transactionId>${tradeTemplate.transactionId!''}</transactionId>     
                                    <transactionStatus>${tradeTemplate.transactionStatus!''}</transactionStatus>     
                                    <transactionSystem>${tradeTemplate.transactionSystem!''}</transactionSystem>     
                                    <transactionTime><#if tradeTemplate.transactionTime?exists>${tradeTemplate.transactionTime?string("yyyy-MM-dd")}</#if></transactionTime>
                                    <updatedBy>${tradeTemplate.updatedBy!''}</updatedBy>     
                                    <versionNumber>${tradeTemplate.versionNumber!''}</versionNumber>     
                                    <versusAccountId>${tradeTemplate.versusAccountId!''}</versusAccountId>     
                                    <versusAccountLocation>${tradeTemplate.versusAccountLocation!''}</versusAccountLocation>     
                                    <versusBrokerId>${tradeTemplate.versusBrokerId!''}</versusBrokerId>     
                                    <washAccountId>${tradeTemplate.washAccountId!''}</washAccountId>     
                          <entityId><#if tradeTemplate.entityId?exists>${tradeTemplate.entityId?c}</#if></entityId>
  </row>
    </#list>
   </#escape>
  </rows>
</response>
</#compress>  
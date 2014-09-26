<#import "/gaf/common.ftl" as common/>
<#compress>
<response>
<@common.jqGridContext/>
  <rows>
   <#escape x as x?xml>
    <#list entityList as transactionCondition>
      <row>
                       <amount>${transactionCondition.amount!''}</amount>     
                                    <bookAccountId>${transactionCondition.bookAccountId!''}</bookAccountId>     
                                    <childRecordId>${transactionCondition.childRecordId!''}</childRecordId>     
                                    <clearingAccountId>${transactionCondition.clearingAccountId!''}</clearingAccountId>     
                                    <clearingBrokerId>${transactionCondition.clearingBrokerId!''}</clearingBrokerId>     
                                    <conditionNumber>${transactionCondition.conditionNumber!''}</conditionNumber>     
                                    <conditionValue>${transactionCondition.conditionValue!''}</conditionValue>     
                                    <createdBy>${transactionCondition.createdBy!''}</createdBy>     
                                    <dealerId>${transactionCondition.dealerId!''}</dealerId>     
                                                  <externalRecordId>${transactionCondition.externalRecordId!''}</externalRecordId>     
                                    <groupRecordId>${transactionCondition.groupRecordId!''}</groupRecordId>     
                                    <insertTime><#if transactionCondition.insertTime?exists>${transactionCondition.insertTime?string("yyyy-MM-dd")}</#if></insertTime>
                                    <internalRecordId>${transactionCondition.internalRecordId!''}</internalRecordId>     
                                    <introducerAccountId>${transactionCondition.introducerAccountId!''}</introducerAccountId>     
                                    <isLateTrade><#if transactionCondition.isLateTrade?exists>${transactionCondition.isLateTrade?string('Y','N')}</#if></isLateTrade>     
                                    <isManualCrossing><#if transactionCondition.isManualCrossing?exists>${transactionCondition.isManualCrossing?string('Y','N')}</#if></isManualCrossing>     
                                    <isManualFill><#if transactionCondition.isManualFill?exists>${transactionCondition.isManualFill?string('Y','N')}</#if></isManualFill>     
                                    <isOddLot><#if transactionCondition.isOddLot?exists>${transactionCondition.isOddLot?string('Y','N')}</#if></isOddLot>     
                                    <isUnsolicited><#if transactionCondition.isUnsolicited?exists>${transactionCondition.isUnsolicited?string('Y','N')}</#if></isUnsolicited>     
                                    <lastUpdateTime><#if transactionCondition.lastUpdateTime?exists>${transactionCondition.lastUpdateTime?string("yyyy-MM-dd")}</#if></lastUpdateTime>
                                    <listExchangeId>${transactionCondition.listExchangeId!''}</listExchangeId>     
                                    <parentRecordId>${transactionCondition.parentRecordId!''}</parentRecordId>     
                                    <price>${transactionCondition.price!''}</price>     
                                    <primaryAccountId>${transactionCondition.primaryAccountId!''}</primaryAccountId>     
                                    <primaryAccountLocation>${transactionCondition.primaryAccountLocation!''}</primaryAccountLocation>     
                                    <primaryBrokerId>${transactionCondition.primaryBrokerId!''}</primaryBrokerId>     
                                    <productId>${transactionCondition.productId!''}</productId>     
                                    <productType>${transactionCondition.productType!''}</productType>     
                                    <quantity>${transactionCondition.quantity!''}</quantity>     
                                    <recordRemark>${transactionCondition.recordRemark!''}</recordRemark>     
                                    <recordStatus>${transactionCondition.recordStatus!''}</recordStatus>     
                                    <rootRecordId>${transactionCondition.rootRecordId!''}</rootRecordId>     
                                    <salesId>${transactionCondition.salesId!''}</salesId>     
                                    <settlementCurrency>${transactionCondition.settlementCurrency!''}</settlementCurrency>     
                                    <settlementDate><#if transactionCondition.settlementDate?exists>${transactionCondition.settlementDate?string("yyyy-MM-dd")}</#if></settlementDate>
                                    <side>${transactionCondition.side!''}</side>     
                                    <templateGroupId>${transactionCondition.templateGroupId!''}</templateGroupId>     
                                    <tradeExchangeId>${transactionCondition.tradeExchangeId!''}</tradeExchangeId>     
                                    <tradingCurrency>${transactionCondition.tradingCurrency!''}</tradingCurrency>     
                                    <tradingDate><#if transactionCondition.tradingDate?exists>${transactionCondition.tradingDate?string("yyyy-MM-dd")}</#if></tradingDate>
                                    <transactionBatchId>${transactionCondition.transactionBatchId!''}</transactionBatchId>     
                                    <transactionBusinessCode>${transactionCondition.transactionBusinessCode!''}</transactionBusinessCode>     
                                    <transactionBusinessLineId>${transactionCondition.transactionBusinessLineId!''}</transactionBusinessLineId>     
                                    <transactionCategory>${transactionCondition.transactionCategory!''}</transactionCategory>     
                                    <transactionChannel>${transactionCondition.transactionChannel!''}</transactionChannel>     
                                    <transactionFeedMethod>${transactionCondition.transactionFeedMethod!''}</transactionFeedMethod>     
                                    <transactionId>${transactionCondition.transactionId!''}</transactionId>     
                                    <transactionStatus>${transactionCondition.transactionStatus!''}</transactionStatus>     
                                    <transactionSystem>${transactionCondition.transactionSystem!''}</transactionSystem>     
                                    <transactionTime><#if transactionCondition.transactionTime?exists>${transactionCondition.transactionTime?string("yyyy-MM-dd")}</#if></transactionTime>
                                    <updatedBy>${transactionCondition.updatedBy!''}</updatedBy>     
                                    <versionNumber>${transactionCondition.versionNumber!''}</versionNumber>     
                                    <versusAccountId>${transactionCondition.versusAccountId!''}</versusAccountId>     
                                    <versusAccountLocation>${transactionCondition.versusAccountLocation!''}</versusAccountLocation>     
                                    <versusBrokerId>${transactionCondition.versusBrokerId!''}</versusBrokerId>     
                                    <washAccountId>${transactionCondition.washAccountId!''}</washAccountId>     
                          <entityId><#if transactionCondition.entityId?exists>${transactionCondition.entityId?c}</#if></entityId>
  </row>
    </#list>
   </#escape>
  </rows>
</response>
</#compress>  
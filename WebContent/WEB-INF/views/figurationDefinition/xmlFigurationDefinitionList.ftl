<#import "/gaf/common.ftl" as common/>
<#compress>
<response>
<@common.jqGridContext/>
  <rows>
   <#escape x as x?xml>
    <#list entityList as figurationDefinition>
      <row>
                       <accountCategory>${figurationDefinition.accountCategory!''}</accountCategory>     
                                    <accountId>${figurationDefinition.accountId!''}</accountId>     
                                    <accountLocation>${figurationDefinition.accountLocation!''}</accountLocation>     
                                    <accountOwnerType>${figurationDefinition.accountOwnerType!''}</accountOwnerType>     
                                    <accountType>${figurationDefinition.accountType!''}</accountType>     
                                    <businessStrategy>${figurationDefinition.businessStrategy!''}</businessStrategy>     
                                    <childRecordId>${figurationDefinition.childRecordId!''}</childRecordId>     
                                    <createdBy>${figurationDefinition.createdBy!''}</createdBy>     
                                    <discountAmount>${figurationDefinition.discountAmount!''}</discountAmount>     
                                                  <externalRecordId>${figurationDefinition.externalRecordId!''}</externalRecordId>     
                                    <feeCode>${figurationDefinition.feeCode!''}</feeCode>     
                                    <feeId>${figurationDefinition.feeId!''}</feeId>     
                                    <figurationBase>${figurationDefinition.figurationBase!''}</figurationBase>     
                                    <figurationBaseUnit>${figurationDefinition.figurationBaseUnit!''}</figurationBaseUnit>     
                                    <figurationBaseValue>${figurationDefinition.figurationBaseValue!''}</figurationBaseValue>     
                                    <figurationDefinitionId>${figurationDefinition.figurationDefinitionId!''}</figurationDefinitionId>     
                                    <figurationPrecision>${figurationDefinition.figurationPrecision!''}</figurationPrecision>     
                                    <figurationRate>${figurationDefinition.figurationRate!''}</figurationRate>     
                                    <groupRecordId>${figurationDefinition.groupRecordId!''}</groupRecordId>     
                                    <insertTime><#if figurationDefinition.insertTime?exists>${figurationDefinition.insertTime?string("yyyy-MM-dd")}</#if></insertTime>
                                    <internalRecordId>${figurationDefinition.internalRecordId!''}</internalRecordId>     
                                    <isEnable><#if figurationDefinition.isEnable?exists>${figurationDefinition.isEnable?string('Y','N')}</#if></isEnable>     
                                    <lastUpdateTime><#if figurationDefinition.lastUpdateTime?exists>${figurationDefinition.lastUpdateTime?string("yyyy-MM-dd")}</#if></lastUpdateTime>
                                    <listExchangeId>${figurationDefinition.listExchangeId!''}</listExchangeId>     
                                    <lowerLimit>${figurationDefinition.lowerLimit!''}</lowerLimit>     
                                    <maxAmount>${figurationDefinition.maxAmount!''}</maxAmount>     
                                    <measurement>${figurationDefinition.measurement!''}</measurement>     
                                    <measurementValue>${figurationDefinition.measurementValue!''}</measurementValue>     
                                    <minAmount>${figurationDefinition.minAmount!''}</minAmount>     
                                    <orderLocation>${figurationDefinition.orderLocation!''}</orderLocation>     
                                    <parentRecordId>${figurationDefinition.parentRecordId!''}</parentRecordId>     
                                    <priority>${figurationDefinition.priority!''}</priority>     
                                    <productId>${figurationDefinition.productId!''}</productId>     
                                    <productType>${figurationDefinition.productType!''}</productType>     
                                    <recordRemark>${figurationDefinition.recordRemark!''}</recordRemark>     
                                    <recordStatus>${figurationDefinition.recordStatus!''}</recordStatus>     
                                    <rootRecordId>${figurationDefinition.rootRecordId!''}</rootRecordId>     
                                    <roundingRule>${figurationDefinition.roundingRule!''}</roundingRule>     
                                    <salesId>${figurationDefinition.salesId!''}</salesId>     
                                    <settlementCurrencyId>${figurationDefinition.settlementCurrencyId!''}</settlementCurrencyId>     
                                    <side>${figurationDefinition.side!''}</side>     
                                    <tradeCurrencyId>${figurationDefinition.tradeCurrencyId!''}</tradeCurrencyId>     
                                    <tradeExchangeId>${figurationDefinition.tradeExchangeId!''}</tradeExchangeId>     
                                    <traderId>${figurationDefinition.traderId!''}</traderId>     
                                    <transactionChannel>${figurationDefinition.transactionChannel!''}</transactionChannel>     
                                    <transactionManagementSystem>${figurationDefinition.transactionManagementSystem!''}</transactionManagementSystem>     
                                    <updatedBy>${figurationDefinition.updatedBy!''}</updatedBy>     
                                    <upperLimit>${figurationDefinition.upperLimit!''}</upperLimit>     
                                    <versionNumber>${figurationDefinition.versionNumber!''}</versionNumber>     
                          <entityId><#if figurationDefinition.entityId?exists>${figurationDefinition.entityId?c}</#if></entityId>
  </row>
    </#list>
   </#escape>
  </rows>
</response>
</#compress>  
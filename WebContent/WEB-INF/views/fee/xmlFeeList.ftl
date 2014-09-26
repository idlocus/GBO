<#import "/gaf/common.ftl" as common/>
<#compress>
<response>
<@common.jqGridContext/>
  <rows>
   <#escape x as x?xml>
    <#list entityList as fee>
      <row>
                       <charger>${fee.charger!''}</charger>     
                                    <childRecordId>${fee.childRecordId!''}</childRecordId>     
                                    <createdBy>${fee.createdBy!''}</createdBy>     
                                    <description>${fee.description!''}</description>     
                                                  <externalRecordId>${fee.externalRecordId!''}</externalRecordId>     
                                    <feeCategory>${fee.feeCategory!''}</feeCategory>     
                                    <feeCode>${fee.feeCode!''}</feeCode>     
                                    <feeId>${fee.feeId!''}</feeId>     
                                    <feeName>${fee.feeName!''}</feeName>     
                                    <feeType>${fee.feeType!''}</feeType>     
                                    <groupRecordId>${fee.groupRecordId!''}</groupRecordId>     
                                    <insertTime><#if fee.insertTime?exists>${fee.insertTime?string("yyyy-MM-dd")}</#if></insertTime>
                                    <internalRecordId>${fee.internalRecordId!''}</internalRecordId>     
                                    <isEnable><#if fee.isEnable?exists>${fee.isEnable?string('Y','N')}</#if></isEnable>     
                                    <lastUpdateTime><#if fee.lastUpdateTime?exists>${fee.lastUpdateTime?string("yyyy-MM-dd")}</#if></lastUpdateTime>
                                    <parentRecordId>${fee.parentRecordId!''}</parentRecordId>     
                                    <recordRemark>${fee.recordRemark!''}</recordRemark>     
                                    <recordStatus>${fee.recordStatus!''}</recordStatus>     
                                    <rootRecordId>${fee.rootRecordId!''}</rootRecordId>     
                                    <updatedBy>${fee.updatedBy!''}</updatedBy>     
                                    <versionNumber>${fee.versionNumber!''}</versionNumber>     
                          <entityId><#if fee.entityId?exists>${fee.entityId?c}</#if></entityId>
  </row>
    </#list>
   </#escape>
  </rows>
</response>
</#compress>  
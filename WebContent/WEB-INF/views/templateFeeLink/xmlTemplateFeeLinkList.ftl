<#import "/gaf/common.ftl" as common/>
<#compress>
<response>
<@common.jqGridContext/>
  <rows>
   <#escape x as x?xml>
    <#list entityList as templateFeeLink>
      <row>
                       <childRecordId>${templateFeeLink.childRecordId!''}</childRecordId>     
                                    <createdBy>${templateFeeLink.createdBy!''}</createdBy>     
                                                  <externalRecordId>${templateFeeLink.externalRecordId!''}</externalRecordId>     
                                    <feeId>${templateFeeLink.feeId!''}</feeId>     
                                    <groupRecordId>${templateFeeLink.groupRecordId!''}</groupRecordId>     
                                    <insertTime><#if templateFeeLink.insertTime?exists>${templateFeeLink.insertTime?string("yyyy-MM-dd")}</#if></insertTime>
                                    <internalRecordId>${templateFeeLink.internalRecordId!''}</internalRecordId>     
                                    <isEnable><#if templateFeeLink.isEnable?exists>${templateFeeLink.isEnable?string('Y','N')}</#if></isEnable>     
                                    <lastUpdateTime><#if templateFeeLink.lastUpdateTime?exists>${templateFeeLink.lastUpdateTime?string("yyyy-MM-dd")}</#if></lastUpdateTime>
                                    <parentRecordId>${templateFeeLink.parentRecordId!''}</parentRecordId>     
                                    <recordRemark>${templateFeeLink.recordRemark!''}</recordRemark>     
                                    <recordStatus>${templateFeeLink.recordStatus!''}</recordStatus>     
                                    <rootRecordId>${templateFeeLink.rootRecordId!''}</rootRecordId>     
                                    <templateId>${templateFeeLink.templateId!''}</templateId>     
                                    <updatedBy>${templateFeeLink.updatedBy!''}</updatedBy>     
                                    <versionNumber>${templateFeeLink.versionNumber!''}</versionNumber>     
                          <entityId><#if templateFeeLink.entityId?exists>${templateFeeLink.entityId?c}</#if></entityId>
  </row>
    </#list>
   </#escape>
  </rows>
</response>
</#compress>  
<#import "/gaf/common.ftl" as common/>
<#compress>
<response>
<@common.jqGridContext/>
  <rows>
   <#escape x as x?xml>
    <#list entityList as figuration>
      <row>
                       <childRecordId>${figuration.childRecordId!''}</childRecordId>     
                                    <createdBy>${figuration.createdBy!''}</createdBy>     
                                                  <externalRecordId>${figuration.externalRecordId!''}</externalRecordId>     
                                    <feeCode>${figuration.feeCode!''}</feeCode>     
                                    <feeId>${figuration.feeId!''}</feeId>     
                                    <feeName>${figuration.feeName!''}</feeName>     
                                    <figurationAmount>${figuration.figurationAmount!''}</figurationAmount>     
                                    <figurationBase>${figuration.figurationBase!''}</figurationBase>     
                                    <figurationBaseValue>${figuration.figurationBaseValue!''}</figurationBaseValue>     
                                    <figurationCode>${figuration.figurationCode!''}</figurationCode>     
                                    <figurationDefinitionId>${figuration.figurationDefinitionId!''}</figurationDefinitionId>     
                                    <figurationId>${figuration.figurationId!''}</figurationId>     
                                    <figurationName>${figuration.figurationName!''}</figurationName>     
                                    <figurationPrecision>${figuration.figurationPrecision!''}</figurationPrecision>     
                                    <figurationRate>${figuration.figurationRate!''}</figurationRate>     
                                    <groupRecordId>${figuration.groupRecordId!''}</groupRecordId>     
                                    <insertTime><#if figuration.insertTime?exists>${figuration.insertTime?string("yyyy-MM-dd")}</#if></insertTime>
                                    <internalRecordId>${figuration.internalRecordId!''}</internalRecordId>     
                                    <lastUpdateTime><#if figuration.lastUpdateTime?exists>${figuration.lastUpdateTime?string("yyyy-MM-dd")}</#if></lastUpdateTime>
                                    <parentRecordId>${figuration.parentRecordId!''}</parentRecordId>     
                                    <recordRemark>${figuration.recordRemark!''}</recordRemark>     
                                    <recordStatus>${figuration.recordStatus!''}</recordStatus>     
                                    <rootRecordId>${figuration.rootRecordId!''}</rootRecordId>     
                                    <templateId>${figuration.templateId!''}</templateId>     
                                    <transactionId>${figuration.transactionId!''}</transactionId>     
                                    <updatedBy>${figuration.updatedBy!''}</updatedBy>     
                                    <versionNumber>${figuration.versionNumber!''}</versionNumber>     
                          <entityId><#if figuration.entityId?exists>${figuration.entityId?c}</#if></entityId>
  </row>
    </#list>
   </#escape>
  </rows>
</response>
</#compress>  
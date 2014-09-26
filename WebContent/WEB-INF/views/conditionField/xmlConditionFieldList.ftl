<#import "/gaf/common.ftl" as common/>
<#compress>
<response>
<@common.jqGridContext/>
  <rows>
   <#escape x as x?xml>
    <#list entityList as conditionField>
      <row>
                       <categoryName>${conditionField.categoryName!''}</categoryName>     
                                    <childRecordId>${conditionField.childRecordId!''}</childRecordId>     
                                    <createdBy>${conditionField.createdBy!''}</createdBy>     
                                                  <externalRecordId>${conditionField.externalRecordId!''}</externalRecordId>     
                                    <groupRecordId>${conditionField.groupRecordId!''}</groupRecordId>     
                                    <insertTime><#if conditionField.insertTime?exists>${conditionField.insertTime?string("yyyy-MM-dd")}</#if></insertTime>
                                    <internalRecordId>${conditionField.internalRecordId!''}</internalRecordId>     
                                    <keyItem>${conditionField.keyItem!''}</keyItem>     
                                    <lastUpdateTime><#if conditionField.lastUpdateTime?exists>${conditionField.lastUpdateTime?string("yyyy-MM-dd")}</#if></lastUpdateTime>
                                    <parentRecordId>${conditionField.parentRecordId!''}</parentRecordId>     
                                    <recordRemark>${conditionField.recordRemark!''}</recordRemark>     
                                    <recordStatus>${conditionField.recordStatus!''}</recordStatus>     
                                    <remark>${conditionField.remark!''}</remark>     
                                    <rootRecordId>${conditionField.rootRecordId!''}</rootRecordId>     
                                    <updatedBy>${conditionField.updatedBy!''}</updatedBy>     
                                    <valueItem>${conditionField.valueItem!''}</valueItem>     
                                    <versionNumber>${conditionField.versionNumber!''}</versionNumber>     
                          <entityId><#if conditionField.entityId?exists>${conditionField.entityId?c}</#if></entityId>
  </row>
    </#list>
   </#escape>
  </rows>
</response>
</#compress>  
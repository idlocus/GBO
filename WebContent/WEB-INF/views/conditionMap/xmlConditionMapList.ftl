<#import "/gaf/common.ftl" as common/>
<#compress>
<response>
<@common.jqGridContext/>
  <rows>
   <#escape x as x?xml>
    <#list entityList as conditionMap>
      <row>
                       <allExcludeNumber>${conditionMap.allExcludeNumber!''}</allExcludeNumber>     
                                    <allIncludeNumber>${conditionMap.allIncludeNumber!''}</allIncludeNumber>     
                                    <categoryName>${conditionMap.categoryName!''}</categoryName>     
                                    <childRecordId>${conditionMap.childRecordId!''}</childRecordId>     
                                    <createdBy>${conditionMap.createdBy!''}</createdBy>     
                                                  <externalRecordId>${conditionMap.externalRecordId!''}</externalRecordId>     
                                    <fieldName>${conditionMap.fieldName!''}</fieldName>     
                                    <fieldValue>${conditionMap.fieldValue!''}</fieldValue>     
                                    <groupRecordId>${conditionMap.groupRecordId!''}</groupRecordId>     
                                    <insertTime><#if conditionMap.insertTime?exists>${conditionMap.insertTime?string("yyyy-MM-dd")}</#if></insertTime>
                                    <internalRecordId>${conditionMap.internalRecordId!''}</internalRecordId>     
                                    <lastUpdateTime><#if conditionMap.lastUpdateTime?exists>${conditionMap.lastUpdateTime?string("yyyy-MM-dd")}</#if></lastUpdateTime>
                                    <parentRecordId>${conditionMap.parentRecordId!''}</parentRecordId>     
                                    <priorityNumber>${conditionMap.priorityNumber!''}</priorityNumber>     
                                    <recordRemark>${conditionMap.recordRemark!''}</recordRemark>     
                                    <recordStatus>${conditionMap.recordStatus!''}</recordStatus>     
                                    <rootRecordId>${conditionMap.rootRecordId!''}</rootRecordId>     
                                    <updatedBy>${conditionMap.updatedBy!''}</updatedBy>     
                                    <versionNumber>${conditionMap.versionNumber!''}</versionNumber>     
                          <entityId><#if conditionMap.entityId?exists>${conditionMap.entityId?c}</#if></entityId>
  </row>
    </#list>
   </#escape>
  </rows>
</response>
</#compress>  
<#import "/gaf/common.ftl" as common/>
<#import "/gaf/permission.ftl" as permission/>
<#include "conditionMapValidate.ftl"/>
<form id="conditionMapInputForm">
<div id="conditionMapTab" style="height:100px; width:550px;">
    <div title="ConditionMap">
        <table style="width: 99%;" class="gaf-ui-normal">
            <tbody>
               <tr>              
                  <input type="hidden" name="entityId" value="<#if conditionMap.entityId?exists>${conditionMap.entityId?c}</#if>"/>
                  <input type="hidden" name="createdBy" value="${conditionMap.createdBy!''}"/>
                  <input type="hidden" name="insertTime" value="<#if conditionMap.insertTime?exists>${conditionMap.insertTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="updatedBy" value="${conditionMap.updatedBy!''}"/>
                  <input type="hidden" name="lastUpdateTime" value="<#if conditionMap.lastUpdateTime?exists>${conditionMap.lastUpdateTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="versionNumber" value="${conditionMap.versionNumber!''}"/>
                  
               </tr>   
               
                                                                  <tr>
                  <td class="criteria-label" style="width:100">All Exclude Number</td>
                  <td class="content">
                      <input id="allExcludeNumber" name="allExcludeNumber" value="${conditionMap.allExcludeNumber!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">All Include Number</td>
                  <td class="content">
                      <input id="allIncludeNumber" name="allIncludeNumber" value="${conditionMap.allIncludeNumber!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Category Name</td>
                  <td class="content">
                      <input id="categoryName" name="categoryName" value="${conditionMap.categoryName!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Child Record Id</td>
                  <td class="content">
                      <input id="childRecordId" name="childRecordId" value="${conditionMap.childRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                                                        <tr>
                  <td class="criteria-label" style="width:100">External Record Id</td>
                  <td class="content">
                      <input id="externalRecordId" name="externalRecordId" value="${conditionMap.externalRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Field Name</td>
                  <td class="content">
                      <input id="fieldName" name="fieldName" value="${conditionMap.fieldName!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Field Value</td>
                  <td class="content">
                      <input id="fieldValue" name="fieldValue" value="${conditionMap.fieldValue!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Group Record Id</td>
                  <td class="content">
                      <input id="groupRecordId" name="groupRecordId" value="${conditionMap.groupRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Internal Record Id</td>
                  <td class="content">
                      <input id="internalRecordId" name="internalRecordId" value="${conditionMap.internalRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Parent Record Id</td>
                  <td class="content">
                      <input id="parentRecordId" name="parentRecordId" value="${conditionMap.parentRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Priority Number</td>
                  <td class="content">
                      <input id="priorityNumber" name="priorityNumber" value="${conditionMap.priorityNumber!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Record Remark</td>
                  <td class="content">
                      <input id="recordRemark" name="recordRemark" value="${conditionMap.recordRemark!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Record Status</td>
                  <td class="content">
                      <input id="recordStatus" name="recordStatus" value="${conditionMap.recordStatus!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Root Record Id</td>
                  <td class="content">
                      <input id="rootRecordId" name="rootRecordId" value="${conditionMap.rootRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                                                       
            </tbody>
        </table>
        <div class="gaf-ui-window-toolbar" style="margin-top:5px;">
<#if permission.checkFunctionPermitted("/conditionMap/update","POST")>
            <button type="submit" class="gafsubmitBtn">OK</button>
</#if>
            <button type="button" class="gafcancelBtn" onclick="$.gafwindow('close');">Cancel</button>
        </div>
    </div>
</div>
</form>
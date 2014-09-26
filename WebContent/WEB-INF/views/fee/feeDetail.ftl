<#import "/gaf/common.ftl" as common/>
<#import "/gaf/permission.ftl" as permission/>
<#include "feeValidate.ftl"/>
<form id="feeInputForm">
<div id="feeTab" style="height:100px; width:550px;">
    <div title="Fee">
        <table style="width: 99%;" class="gaf-ui-normal">
            <tbody>
               <tr>              
                  <input type="hidden" name="entityId" value="<#if fee.entityId?exists>${fee.entityId?c}</#if>"/>
                  <input type="hidden" name="createdBy" value="${fee.createdBy!''}"/>
                  <input type="hidden" name="insertTime" value="<#if fee.insertTime?exists>${fee.insertTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="updatedBy" value="${fee.updatedBy!''}"/>
                  <input type="hidden" name="lastUpdateTime" value="<#if fee.lastUpdateTime?exists>${fee.lastUpdateTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="versionNumber" value="${fee.versionNumber!''}"/>
                  
               </tr>   
               
                                                                  <tr>
                  <td class="criteria-label" style="width:100">Charger</td>
                  <td class="content">
                      <input id="charger" name="charger" value="${fee.charger!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Child Record Id</td>
                  <td class="content">
                      <input id="childRecordId" name="childRecordId" value="${fee.childRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Description</td>
                  <td class="content">
                      <input id="description" name="description" value="${fee.description!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">External Record Id</td>
                  <td class="content">
                      <input id="externalRecordId" name="externalRecordId" value="${fee.externalRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Fee Category</td>
                  <td class="content">
                      <input id="feeCategory" name="feeCategory" value="${fee.feeCategory!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Fee Code</td>
                  <td class="content">
                      <input id="feeCode" name="feeCode" value="${fee.feeCode!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Fee Id</td>
                  <td class="content">
                      <input id="feeId" name="feeId" value="${fee.feeId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Fee Name</td>
                  <td class="content">
                      <input id="feeName" name="feeName" value="${fee.feeName!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Fee Type</td>
                  <td class="content">
                      <input id="feeType" name="feeType" value="${fee.feeType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Group Record Id</td>
                  <td class="content">
                      <input id="groupRecordId" name="groupRecordId" value="${fee.groupRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Internal Record Id</td>
                  <td class="content">
                      <input id="internalRecordId" name="internalRecordId" value="${fee.internalRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Enable</td>
                  <td class="content">
                      <input id="isEnable" name="isEnable" value="${fee.isEnable!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Parent Record Id</td>
                  <td class="content">
                      <input id="parentRecordId" name="parentRecordId" value="${fee.parentRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Record Remark</td>
                  <td class="content">
                      <input id="recordRemark" name="recordRemark" value="${fee.recordRemark!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Record Status</td>
                  <td class="content">
                      <input id="recordStatus" name="recordStatus" value="${fee.recordStatus!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Root Record Id</td>
                  <td class="content">
                      <input id="rootRecordId" name="rootRecordId" value="${fee.rootRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                                                       
            </tbody>
        </table>
        <div class="gaf-ui-window-toolbar" style="margin-top:5px;">
<#if permission.checkFunctionPermitted("/fee/update","POST")>
            <button type="submit" class="gafsubmitBtn">OK</button>
</#if>
            <button type="button" class="gafcancelBtn" onclick="$.gafwindow('close');">Cancel</button>
        </div>
    </div>
</div>
</form>
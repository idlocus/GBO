<#import "/gaf/common.ftl" as common/>
<#import "/gaf/permission.ftl" as permission/>
<#include "figurationValidate.ftl"/>
<form id="figurationInputForm">
<div id="figurationTab" style="height:100px; width:550px;">
    <div title="Figuration">
        <table style="width: 99%;" class="gaf-ui-normal">
            <tbody>
               <tr>              
                  <input type="hidden" name="entityId" value="<#if figuration.entityId?exists>${figuration.entityId?c}</#if>"/>
                  <input type="hidden" name="createdBy" value="${figuration.createdBy!''}"/>
                  <input type="hidden" name="insertTime" value="<#if figuration.insertTime?exists>${figuration.insertTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="updatedBy" value="${figuration.updatedBy!''}"/>
                  <input type="hidden" name="lastUpdateTime" value="<#if figuration.lastUpdateTime?exists>${figuration.lastUpdateTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="versionNumber" value="${figuration.versionNumber!''}"/>
                  
               </tr>   
               
                                                                  <tr>
                  <td class="criteria-label" style="width:100">Child Record Id</td>
                  <td class="content">
                      <input id="childRecordId" name="childRecordId" value="${figuration.childRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                                                        <tr>
                  <td class="criteria-label" style="width:100">External Record Id</td>
                  <td class="content">
                      <input id="externalRecordId" name="externalRecordId" value="${figuration.externalRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Fee Code</td>
                  <td class="content">
                      <input id="feeCode" name="feeCode" value="${figuration.feeCode!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Fee Id</td>
                  <td class="content">
                      <input id="feeId" name="feeId" value="${figuration.feeId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Fee Name</td>
                  <td class="content">
                      <input id="feeName" name="feeName" value="${figuration.feeName!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Figuration Amount</td>
                  <td class="content">
                      <input id="figurationAmount" name="figurationAmount" value="${figuration.figurationAmount!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Figuration Base</td>
                  <td class="content">
                      <input id="figurationBase" name="figurationBase" value="${figuration.figurationBase!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Figuration Base Value</td>
                  <td class="content">
                      <input id="figurationBaseValue" name="figurationBaseValue" value="${figuration.figurationBaseValue!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Figuration Code</td>
                  <td class="content">
                      <input id="figurationCode" name="figurationCode" value="${figuration.figurationCode!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Figuration Definition Id</td>
                  <td class="content">
                      <input id="figurationDefinitionId" name="figurationDefinitionId" value="${figuration.figurationDefinitionId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Figuration Id</td>
                  <td class="content">
                      <input id="figurationId" name="figurationId" value="${figuration.figurationId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Figuration Name</td>
                  <td class="content">
                      <input id="figurationName" name="figurationName" value="${figuration.figurationName!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Figuration Precision</td>
                  <td class="content">
                      <input id="figurationPrecision" name="figurationPrecision" value="${figuration.figurationPrecision!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Figuration Rate</td>
                  <td class="content">
                      <input id="figurationRate" name="figurationRate" value="${figuration.figurationRate!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Group Record Id</td>
                  <td class="content">
                      <input id="groupRecordId" name="groupRecordId" value="${figuration.groupRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Internal Record Id</td>
                  <td class="content">
                      <input id="internalRecordId" name="internalRecordId" value="${figuration.internalRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Parent Record Id</td>
                  <td class="content">
                      <input id="parentRecordId" name="parentRecordId" value="${figuration.parentRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Record Remark</td>
                  <td class="content">
                      <input id="recordRemark" name="recordRemark" value="${figuration.recordRemark!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Record Status</td>
                  <td class="content">
                      <input id="recordStatus" name="recordStatus" value="${figuration.recordStatus!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Root Record Id</td>
                  <td class="content">
                      <input id="rootRecordId" name="rootRecordId" value="${figuration.rootRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Template Id</td>
                  <td class="content">
                      <input id="templateId" name="templateId" value="${figuration.templateId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Id</td>
                  <td class="content">
                      <input id="transactionId" name="transactionId" value="${figuration.transactionId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                                                       
            </tbody>
        </table>
        <div class="gaf-ui-window-toolbar" style="margin-top:5px;">
<#if permission.checkFunctionPermitted("/figuration/update","POST")>
            <button type="submit" class="gafsubmitBtn">OK</button>
</#if>
            <button type="button" class="gafcancelBtn" onclick="$.gafwindow('close');">Cancel</button>
        </div>
    </div>
</div>
</form>
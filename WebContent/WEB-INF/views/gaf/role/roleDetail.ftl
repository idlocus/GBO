<#import "/gaf//common.ftl" as common/>
<#include "roleValidate.ftl"/>
<form id="roleInputForm">
<div id="roleTab" style="height:100px; width:550px;">
    <div title="Role">
        <table style="width: 99%;" class="gaf-ui-normal">
            <tbody>
               <tr>              
                  <input type="hidden" name="entityId" value="<#if role.entityId?exists>${role.entityId?c}</#if>"/>
                  <input type="hidden" name="createdBy" value="${role.createdBy!''}"/>
                  <input type="hidden" name="insertTime" value="<#if role.insertTime?exists>${role.insertTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="updatedBy" value="${role.updatedBy!''}"/>
                  <input type="hidden" name="lastUpdateTime" value="<#if role.lastUpdateTime?exists>${role.lastUpdateTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="versionNumber" value="${role.versionNumber!''}"/>
                  
               </tr>   
               
                                                                                                   <tr>
                  <td class="criteria-label" style="width:100">Department Id</td>
                  <td><select name="departmentId" class="gaf-ui-normal" style="width: 170px;">
                      <#if role.departmentId?exists>
	                    <#list departmentIdMap?keys as key>
                               <#if role.departmentId?c=key><option value="${key}" selected="selected">${departmentIdMap[key]}</option>
                               <#else><option value="${key}">${departmentIdMap[key]}</#if>
                        </#list>
                      <#else>
                        <#list departmentIdMap?keys as key><option value="${key}">${departmentIdMap[key]}</#list></#if>
                      </select></td>
                 </tr>
                                                                                                                                                                                                        <tr>
                  <td class="criteria-label" style="width:100">Location Id</td>
                  <td><select name="locationId" class="gaf-ui-normal" style="width: 170px;">
                      <#if role.locationId?exists>
	                    <#list locationIdMap?keys as key>
                               <#if role.locationId?c=key><option value="${key}" selected="selected">${locationIdMap[key]}</option>
                               <#else><option value="${key}">${locationIdMap[key]}</#if>
                        </#list>
                      <#else>
                        <#list locationIdMap?keys as key><option value="${key}">${locationIdMap[key]}</#list></#if>
                      </select></td>
                 </tr>
                                                                                                   <tr>
                  <td class="criteria-label" style="width:100">Role Code</td>
                  <td class="content">
                      <input name="roleCode" value="${role.roleCode!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Role Name</td>
                  <td class="content">
                      <input name="roleName" value="${role.roleName!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                                                       
            </tbody>
        </table>
        <div class="gaf-ui-window-toolbar" style="margin-top:5px;">
            <button type="submit" class="gafsubmitBtn">OK</button>
            <button type="button" class="gafcancelBtn" onclick="$.gafwindow('close');">Cancel</button>
        </div>
    </div>
</div>
</form>
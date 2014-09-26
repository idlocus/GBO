<#import "/gaf/common.ftl" as common/>
<#include "userValidate.ftl"/>
<form id="userInputForm">
<div id="userTab" style="height:100px; width:550px;">
    <div title="User">
        <table style="width: 99%;" class="gaf-ui-normal">
            <tbody>
               <tr>              
                  <input type="hidden" name="entityId" value="<#if user.entityId?exists>${user.entityId?c}</#if>"/>
                  <input type="hidden" name="createdBy" value="${user.createdBy!''}"/>
                  <input type="hidden" name="insertTime" value="<#if user.insertTime?exists>${user.insertTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="updatedBy" value="${user.updatedBy!''}"/>
                  <input type="hidden" name="lastUpdateTime" value="<#if user.lastUpdateTime?exists>${user.lastUpdateTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="versionNumber" value="${user.versionNumber!''}"/>
                  
               </tr>   
               
                                                                  <tr>
                  <td class="criteria-label" style="width:100">Birthday</td>
                  <td class="content">
                      <input name="birthday" value="<#if user.birthday?exists>${user.birthday?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Country</td>
                  <td class="content">
                      <input name="country" value="${user.country!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                     <tr>
                  <td class="criteria-label" style="width:100">Department Id</td>
                  <td><select name="departmentId" class="gaf-ui-normal" style="width: 170px;">
                      <#if user.departmentId?exists>
	                    <#list departmentIdMap?keys as key>
					                               <#if user.departmentId?c=key><option value="${key}" selected="selected">${departmentIdMap[key]}</option>
                    							   <#else><option value="${key}">${departmentIdMap[key]}</#if>
                        </#list>
                      <#else>
                        <#list departmentIdMap?keys as key><option value="${key}">${departmentIdMap[key]}</#list></#if>
                      </select></td>
                 </tr>
                                                                                                   <tr>
                  <td class="criteria-label" style="width:100">Email</td>
                  <td class="content">
                      <input name="email" value="${user.email!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Employee Code</td>
                  <td class="content">
                      <input name="employeeCode" value="${user.employeeCode!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Fax</td>
                  <td class="content">
                      <input name="fax" value="${user.fax!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">First Name</td>
                  <td class="content">
                      <input name="firstName" value="${user.firstName!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Home Phone</td>
                  <td class="content">
                      <input name="homePhone" value="${user.homePhone!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Ip</td>
                  <td class="content">
                      <input name="ip" value="${user.ip!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Last Name</td>
                  <td class="content">
                      <input name="lastName" value="${user.lastName!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                     <tr>
                  <td class="criteria-label" style="width:100">Location Id</td>
                  <td><select name="locationId" class="gaf-ui-normal" style="width: 170px;">
                      <#if user.locationId?exists>
	                    <#list locationIdMap?keys as key>
					                               <#if user.locationId?c=key><option value="${key}" selected="selected">${locationIdMap[key]}</option>
                    							   <#else><option value="${key}">${locationIdMap[key]}</#if>
                        </#list>
                      <#else>
                        <#list locationIdMap?keys as key><option value="${key}">${locationIdMap[key]}</#list></#if>
                      </select></td>
                 </tr>
                                                                                                   <tr>
                  <td class="criteria-label" style="width:100">Locked Time</td>
                  <td class="content">
                      <input name="lockedTime" value="<#if user.lockedTime?exists>${user.lockedTime?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Login Id</td>
                  <td class="content">
                      <input name="loginId" value="${user.loginId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Mailling Addr</td>
                  <td class="content">
                      <input name="maillingAddr" value="${user.maillingAddr!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Office Addr</td>
                  <td class="content">
                      <input name="officeAddr" value="${user.officeAddr!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Office Phone</td>
                  <td class="content">
                      <input name="officePhone" value="${user.officePhone!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Password</td>
                  <td class="content">
                      <input name="password" value="${user.password!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Password Duration</td>
                  <td class="content">
                      <input name="passwordDuration" value="${user.passwordDuration!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Password Error Times</td>
                  <td class="content">
                      <input name="passwordErrorTimes" value="${user.passwordErrorTimes!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Password Last Update Time</td>
                  <td class="content">
                      <input name="passwordLastUpdateTime" value="<#if user.passwordLastUpdateTime?exists>${user.passwordLastUpdateTime?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">User Code</td>
                  <td class="content">
                      <input name="userCode" value="${user.userCode!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">User Name</td>
                  <td class="content">
                      <input name="userName" value="${user.userName!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                   <tr>
                  <td class="criteria-label" style="width:100">User Status</td>
                  <td><select name="userStatus" class="gaf-ui-normal" style="width: 170px;">
                      <#if user.userStatus?exists>
	                    <#list userStatusMap?keys as key>
											       <#if user.userStatus=key><option value="${key}" selected="selected">${userStatusMap[key]}</option>
												   <#else><option value="${key}">${userStatusMap[key]}</#if>
                        </#list>
                      <#else>
                        <#list userStatusMap?keys as key><option value="${key}">${userStatusMap[key]}</#list></#if>
                      </select></td>
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
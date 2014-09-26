<#import "/gaf/common.ftl" as common/>
<#import "/gaf/permission.ftl" as permission/>
<#include "incomingMessageValidate.ftl"/>
<form id="incomingMessageInputForm">
<div id="incomingMessageTab" style="height:100px; width:550px;">
    <div title="IncomingMessage">
        <table style="width: 99%;" class="gaf-ui-normal">
            <tbody>
               <tr>              
                  <input type="hidden" name="entityId" value="<#if incomingMessage.entityId?exists>${incomingMessage.entityId?c}</#if>"/>
                  <input type="hidden" name="createdBy" value="${incomingMessage.createdBy!''}"/>
                  <input type="hidden" name="insertTime" value="<#if incomingMessage.insertTime?exists>${incomingMessage.insertTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="updatedBy" value="${incomingMessage.updatedBy!''}"/>
                  <input type="hidden" name="lastUpdateTime" value="<#if incomingMessage.lastUpdateTime?exists>${incomingMessage.lastUpdateTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="versionNumber" value="${incomingMessage.versionNumber!''}"/>
                  
               </tr>   
               
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Incoming System Id</td>
                  <td class="content">
                      <input id="incomingSystemId" name="incomingSystemId" value="${incomingMessage.incomingSystemId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Incoming System Name</td>
                  <td class="content">
                      <input id="incomingSystemName" name="incomingSystemName" value="${incomingMessage.incomingSystemName!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                                                        <tr>
                  <td class="criteria-label" style="width:100">Message Content</td>
                  <td class="content">
                      <input id="messageContent" name="messageContent" value="${incomingMessage.messageContent!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Message Destination Name</td>
                  <td class="content">
                      <input id="messageDestinationName" name="messageDestinationName" value="${incomingMessage.messageDestinationName!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Message Destination Type</td>
                  <td class="content">
                      <input id="messageDestinationType" name="messageDestinationType" value="${incomingMessage.messageDestinationType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Message Id</td>
                  <td class="content">
                      <input id="messageId" name="messageId" value="${incomingMessage.messageId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Message Lob</td>
                  <td class="content">
                      <input id="messageLob" name="messageLob" value="${incomingMessage.messageLob!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Message Server Ip</td>
                  <td class="content">
                      <input id="messageServerIp" name="messageServerIp" value="${incomingMessage.messageServerIp!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Message Server Message Id</td>
                  <td class="content">
                      <input id="messageServerMessageId" name="messageServerMessageId" value="${incomingMessage.messageServerMessageId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Message Server Message Time</td>
                  <td class="content">
                      <input id="messageServerMessageTime" name="messageServerMessageTime" value="<#if incomingMessage.messageServerMessageTime?exists>${incomingMessage.messageServerMessageTime?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Message Server Port</td>
                  <td class="content">
                      <input id="messageServerPort" name="messageServerPort" value="${incomingMessage.messageServerPort!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Message Server Url</td>
                  <td class="content">
                      <input id="messageServerUrl" name="messageServerUrl" value="${incomingMessage.messageServerUrl!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Message Server User</td>
                  <td class="content">
                      <input id="messageServerUser" name="messageServerUser" value="${incomingMessage.messageServerUser!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">System Id</td>
                  <td class="content">
                      <input id="systemId" name="systemId" value="${incomingMessage.systemId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">System Name</td>
                  <td class="content">
                      <input id="systemName" name="systemName" value="${incomingMessage.systemName!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                                                       
            </tbody>
        </table>
        <div class="gaf-ui-window-toolbar" style="margin-top:5px;">
<#if permission.checkFunctionPermitted("/incomingMessage/update","POST")>
            <button type="submit" class="gafsubmitBtn">OK</button>
</#if>
            <button type="button" class="gafcancelBtn" onclick="$.gafwindow('close');">Cancel</button>
        </div>
    </div>
</div>
</form>
<#import "/gaf/common.ftl" as common/>
<#compress>
<response>
<@common.jqGridContext/>
  <rows>
   <#escape x as x?xml>
    <#list entityList as incomingMessage>
      <row>
                       <createdBy>${incomingMessage.createdBy!''}</createdBy>     
                                                  <incomingSystemId>${incomingMessage.incomingSystemId!''}</incomingSystemId>     
                                    <incomingSystemName>${incomingMessage.incomingSystemName!''}</incomingSystemName>     
                                    <insertTime><#if incomingMessage.insertTime?exists>${incomingMessage.insertTime?string("yyyy-MM-dd")}</#if></insertTime>
                                    <lastUpdateTime><#if incomingMessage.lastUpdateTime?exists>${incomingMessage.lastUpdateTime?string("yyyy-MM-dd")}</#if></lastUpdateTime>
                                    <messageContent>${incomingMessage.messageContent!''}</messageContent>     
                                    <messageDestinationName>${incomingMessage.messageDestinationName!''}</messageDestinationName>     
                                    <messageDestinationType>${incomingMessage.messageDestinationType!''}</messageDestinationType>     
                                    <messageId>${incomingMessage.messageId!''}</messageId>     
                                    <messageLob>${incomingMessage.messageLob!''}</messageLob>     
                                    <messageServerIp>${incomingMessage.messageServerIp!''}</messageServerIp>     
                                    <messageServerMessageId>${incomingMessage.messageServerMessageId!''}</messageServerMessageId>     
                                    <messageServerMessageTime><#if incomingMessage.messageServerMessageTime?exists>${incomingMessage.messageServerMessageTime?string("yyyy-MM-dd")}</#if></messageServerMessageTime>
                                    <messageServerPort>${incomingMessage.messageServerPort!''}</messageServerPort>     
                                    <messageServerUrl>${incomingMessage.messageServerUrl!''}</messageServerUrl>     
                                    <messageServerUser>${incomingMessage.messageServerUser!''}</messageServerUser>     
                                    <systemId>${incomingMessage.systemId!''}</systemId>     
                                    <systemName>${incomingMessage.systemName!''}</systemName>     
                                    <updatedBy>${incomingMessage.updatedBy!''}</updatedBy>     
                                    <versionNumber>${incomingMessage.versionNumber!''}</versionNumber>     
                          <entityId><#if incomingMessage.entityId?exists>${incomingMessage.entityId?c}</#if></entityId>
  </row>
    </#list>
   </#escape>
  </rows>
</response>
</#compress>  
<#import "/gaf/common.ftl" as common/>
<#compress>
<response>
<@common.jqGridContext/>
  <rows>
   <#escape x as x?xml>
    <#list entityList as user>
      <row>
                       <birthday><#if user.birthday?exists>${user.birthday?string("yyyy-MM-dd")}</#if></birthday>
                                    <country>${user.country!''}</country>     
                                    <createdBy>${user.createdBy!''}</createdBy>     
                                                      <departmentId>${common.getValueByKey("com.cicc.gaf.user.model.User","getDepartmentId",user.departmentId!'')}</departmentId>     
                                             <email>${user.email!''}</email>     
                                    <employeeCode>${user.employeeCode!''}</employeeCode>     
                                                  <fax>${user.fax!''}</fax>     
                                    <firstName>${user.firstName!''}</firstName>     
                                    <homePhone>${user.homePhone!''}</homePhone>     
                                    <insertTime><#if user.insertTime?exists>${user.insertTime?string("yyyy-MM-dd")}</#if></insertTime>
                                    <ip>${user.ip!''}</ip>     
                                    <lastName>${user.lastName!''}</lastName>     
                                    <lastUpdateTime><#if user.lastUpdateTime?exists>${user.lastUpdateTime?string("yyyy-MM-dd")}</#if></lastUpdateTime>
                                                      <locationId>${common.getValueByKey("com.cicc.gaf.user.model.User","getLocationId",user.locationId!'')}</locationId>     
                                             <lockedTime><#if user.lockedTime?exists>${user.lockedTime?string("yyyy-MM-dd")}</#if></lockedTime>
                                    <loginId>${user.loginId!''}</loginId>     
                                    <maillingAddr>${user.maillingAddr!''}</maillingAddr>     
                                    <officeAddr>${user.officeAddr!''}</officeAddr>     
                                    <officePhone>${user.officePhone!''}</officePhone>     
                                    <password>${user.password!''}</password>     
                                    <passwordDuration>${user.passwordDuration!''}</passwordDuration>     
                                    <passwordErrorTimes>${user.passwordErrorTimes!''}</passwordErrorTimes>     
                                    <passwordLastUpdateTime><#if user.passwordLastUpdateTime?exists>${user.passwordLastUpdateTime?string("yyyy-MM-dd")}</#if></passwordLastUpdateTime>
                                    <updatedBy>${user.updatedBy!''}</updatedBy>     
                                    <userCode>${user.userCode!''}</userCode>     
                                    <userName>${user.userName!''}</userName>     
                                                      <userStatus>${common.getValueByKey("com.cicc.gaf.user.model.User","getUserStatus",user.userStatus!'')}</userStatus>     
                                             <versionNumber>${user.versionNumber!''}</versionNumber>     
                          <entityId><#if user.entityId?exists>${user.entityId?c}</#if></entityId>
  </row>
    </#list>
   </#escape>
  </rows>
</response>
</#compress>  
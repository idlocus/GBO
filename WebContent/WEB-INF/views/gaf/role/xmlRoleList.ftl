<#import "/gaf/common.ftl" as common/>
<#compress>
<response>
<@common.jqGridContext/>
  <rows>
   <#escape x as x?xml>
    <#list entityList as role>
      <row>
                       <createdBy>${role.createdBy!''}</createdBy>     
                                                      <departmentId>${common.getValueByKey("com.cicc.gaf.user.model.Role","getDepartmentId",role.departmentId!'')}</departmentId>     
                                                           <insertTime><#if role.insertTime?exists>${role.insertTime?string("yyyy-MM-dd")}</#if></insertTime>
                                    <lastUpdateTime><#if role.lastUpdateTime?exists>${role.lastUpdateTime?string("yyyy-MM-dd")}</#if></lastUpdateTime>
                                                      <locationId>${common.getValueByKey("com.cicc.gaf.user.model.Role","getLocationId",role.locationId!'')}</locationId>     
                                             <roleCode>${role.roleCode!''}</roleCode>     
                                    <roleName>${role.roleName!''}</roleName>     
                                    <updatedBy>${role.updatedBy!''}</updatedBy>     
                                    <versionNumber>${role.versionNumber!''}</versionNumber>     
                          <entityId><#if role.entityId?exists>${role.entityId?c}</#if></entityId>
  </row>
    </#list>
   </#escape>
  </rows>
</response>
</#compress>  
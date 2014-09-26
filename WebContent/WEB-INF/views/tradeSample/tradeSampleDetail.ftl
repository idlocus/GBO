<#import "/gaf/common.ftl" as common/>
<#import "/gaf/permission.ftl" as permission/>
<#include "tradeSampleValidate.ftl"/>
<form id="tradeSampleInputForm">
<div id="tradeSampleTab" style="height:100px; width:550px;">
    <div title="TradeSample">
        <table style="width: 99%;" class="gaf-ui-normal">
            <tbody>
               <tr>              
                  <input type="hidden" name="entityId" value="<#if tradeSample.entityId?exists>${tradeSample.entityId?c}</#if>"/>
                  <input type="hidden" name="createdBy" value="${tradeSample.createdBy!''}"/>
                  <input type="hidden" name="insertTime" value="<#if tradeSample.insertTime?exists>${tradeSample.insertTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="updatedBy" value="${tradeSample.updatedBy!''}"/>
                  <input type="hidden" name="lastUpdateTime" value="<#if tradeSample.lastUpdateTime?exists>${tradeSample.lastUpdateTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="versionNumber" value="${tradeSample.versionNumber!''}"/>
                  
               </tr>   
               
                                                  			  <tr>
                  <td class="criteria-label" style="width:100">Amount</td>
                  <td class="content">
        <input id="amount" name="amount" value="<#if tradeSample.amount?exists>${tradeSample.amount?string("#,###.##")}</#if>" class="gaf-ui-normal" style="width: 170px;"/>                                           
                  </td>
                 </tr>
                                                                                   				<tr>
                  <td class="criteria-label" style="width:100">Client</td>
									  <td><input id="client" name="client" showLabel="${common.getValueByKey("com.cicc.gaf.tradesample.model.TradeSample","getClient",tradeSample.client!'')}" value="${tradeSample.client!''}" class="gaf-ui-normal gafcomboRemotebox" style="width: 170px;">
                      </input></td>
					                 </tr>
				                                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Currency</td>
                  <td><select id="currency" name="currency" class="gaf-ui-normal gafcombobox" style="width: 170px;">
                      <#if tradeSample.currency?exists>
	                    <#list currencyMap?keys as key>
					                               <#if tradeSample.currency=currencyMap[key]><option value="${currencyMap[key]}" selected="selected">${key}</option>
                    							   <#else><option value="${currencyMap[key]}">${key}</#if>
                        </#list>
                      <#else>
                        <#list currencyMap?keys as key><option value="${currencyMap[key]}">${key}</#list></#if>
                      </select></td>
                 </tr>
                                                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Industry Sector</td>
                  <td><select id="industrySector" name="industrySector" class="gaf-ui-normal gafcombobox" style="width: 170px;">
                      <#if tradeSample.industrySector?exists>
	                    <#list industrySectorMap?keys as key>
					                               <#if tradeSample.industrySector=industrySectorMap[key]><option value="${industrySectorMap[key]}" selected="selected">${key}</option>
                    							   <#else><option value="${industrySectorMap[key]}">${key}</#if>
                        </#list>
                      <#else>
                        <#list industrySectorMap?keys as key><option value="${industrySectorMap[key]}">${key}</#list></#if>
                      </select></td>
                 </tr>
                                                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Instrument Type</td>
                  <td><select id="instrumentType" name="instrumentType" class="gaf-ui-normal gafcombobox" style="width: 170px;">
                      <#if tradeSample.instrumentType?exists>
	                    <#list instrumentTypeMap?keys as key>
					                               <#if tradeSample.instrumentType=instrumentTypeMap[key]><option value="${instrumentTypeMap[key]}" selected="selected">${key}</option>
                    							   <#else><option value="${instrumentTypeMap[key]}">${key}</#if>
                        </#list>
                      <#else>
                        <#list instrumentTypeMap?keys as key><option value="${instrumentTypeMap[key]}">${key}</#list></#if>
                      </select></td>
                 </tr>
                                                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Market</td>
                  <td><select id="market" name="market" class="gaf-ui-normal gafcombobox" style="width: 170px;">
                      <#if tradeSample.market?exists>
	                    <#list marketMap?keys as key>
					                               <#if tradeSample.market=marketMap[key]><option value="${marketMap[key]}" selected="selected">${key}</option>
                    							   <#else><option value="${marketMap[key]}">${key}</#if>
                        </#list>
                      <#else>
                        <#list marketMap?keys as key><option value="${marketMap[key]}">${key}</#list></#if>
                      </select></td>
                 </tr>
                                                                                   			  <tr>
                  <td class="criteria-label" style="width:100">Price</td>
                  <td class="content">
        <input id="price" name="price" value="<#if tradeSample.price?exists>${tradeSample.price?string("#,###.######")}</#if>" class="gaf-ui-normal" style="width: 170px;"/>                                           
                  </td>
                 </tr>
                                                                                   			  <tr>
                  <td class="criteria-label" style="width:100">Qty</td>
                  <td class="content">
        <input id="qty" name="qty" value="<#if tradeSample.qty?exists>${tradeSample.qty?string("#,###")}</#if>" class="gaf-ui-normal" style="width: 170px;"/>                                           
                  </td>
                 </tr>
                                                                                                   <tr>
                  <td class="criteria-label" style="width:100">Remark</td>
                  <td class="content">
                      <input id="remark" name="remark" value="${tradeSample.remark!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settlement Date</td>
                  <td class="content">
                      <input id="settlementDate" name="settlementDate" value="<#if tradeSample.settlementDate?exists>${tradeSample.settlementDate?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                   <tr>
                  <td class="criteria-label" style="width:100">Side</td>
                  <td><select id="side" name="side" class="gaf-ui-normal gafcombobox" style="width: 170px;">
                      <#if tradeSample.side?exists>
	                    <#list sideMap?keys as key>
					                               <#if tradeSample.side=sideMap[key]><option value="${sideMap[key]}" selected="selected">${key}</option>
                    							   <#else><option value="${sideMap[key]}">${key}</#if>
                        </#list>
                      <#else>
                        <#list sideMap?keys as key><option value="${sideMap[key]}">${key}</#list></#if>
                      </select></td>
                 </tr>
                                                                                                   <tr>
                  <td class="criteria-label" style="width:100">Symbol</td>
                  <td class="content">
                      <input id="symbol" name="symbol" value="${tradeSample.symbol!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trade Date</td>
                  <td class="content">
                      <input id="tradeDate" name="tradeDate" value="<#if tradeSample.tradeDate?exists>${tradeSample.tradeDate?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                                                                                       
            </tbody>
        </table>
        <div class="gaf-ui-window-toolbar" style="margin-top:5px;">
<#if permission.checkFunctionPermitted("/tradeSample/update","POST")>
            <button type="submit" class="gafsubmitBtn">OK</button>
</#if>
            <button type="button" class="gafcancelBtn" onclick="$.gafwindow('close');">Cancel</button>
        </div>
    </div>
</div>
</form>
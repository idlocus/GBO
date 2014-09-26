<#import "/gaf/common.ftl" as common/>
<#import "/gaf/permission.ftl" as permission/>
<#include "figurationDefinitionValidate.ftl"/>
<form id="figurationDefinitionInputForm">
<div id="figurationDefinitionTab" style="height:100px; width:550px;">
    <div title="FigurationDefinition">
        <table style="width: 99%;" class="gaf-ui-normal">
            <tbody>
               <tr>              
                  <input type="hidden" name="entityId" value="<#if figurationDefinition.entityId?exists>${figurationDefinition.entityId?c}</#if>"/>
                  <input type="hidden" name="createdBy" value="${figurationDefinition.createdBy!''}"/>
                  <input type="hidden" name="insertTime" value="<#if figurationDefinition.insertTime?exists>${figurationDefinition.insertTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="updatedBy" value="${figurationDefinition.updatedBy!''}"/>
                  <input type="hidden" name="lastUpdateTime" value="<#if figurationDefinition.lastUpdateTime?exists>${figurationDefinition.lastUpdateTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="versionNumber" value="${figurationDefinition.versionNumber!''}"/>
                  
               </tr>   
               
                                                                  <tr>
                  <td class="criteria-label" style="width:100">Account Category</td>
                  <td class="content">
                      <input id="accountCategory" name="accountCategory" value="${figurationDefinition.accountCategory!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Account Id</td>
                  <td class="content">
                      <input id="accountId" name="accountId" value="${figurationDefinition.accountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Account Location</td>
                  <td class="content">
                      <input id="accountLocation" name="accountLocation" value="${figurationDefinition.accountLocation!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Account Owner Type</td>
                  <td class="content">
                      <input id="accountOwnerType" name="accountOwnerType" value="${figurationDefinition.accountOwnerType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Account Type</td>
                  <td class="content">
                      <input id="accountType" name="accountType" value="${figurationDefinition.accountType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Business Strategy</td>
                  <td class="content">
                      <input id="businessStrategy" name="businessStrategy" value="${figurationDefinition.businessStrategy!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Child Record Id</td>
                  <td class="content">
                      <input id="childRecordId" name="childRecordId" value="${figurationDefinition.childRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Discount Amount</td>
                  <td class="content">
                      <input id="discountAmount" name="discountAmount" value="${figurationDefinition.discountAmount!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">External Record Id</td>
                  <td class="content">
                      <input id="externalRecordId" name="externalRecordId" value="${figurationDefinition.externalRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Fee Code</td>
                  <td class="content">
                      <input id="feeCode" name="feeCode" value="${figurationDefinition.feeCode!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Fee Id</td>
                  <td class="content">
                      <input id="feeId" name="feeId" value="${figurationDefinition.feeId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Figuration Base</td>
                  <td class="content">
                      <input id="figurationBase" name="figurationBase" value="${figurationDefinition.figurationBase!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Figuration Base Unit</td>
                  <td class="content">
                      <input id="figurationBaseUnit" name="figurationBaseUnit" value="${figurationDefinition.figurationBaseUnit!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Figuration Base Value</td>
                  <td class="content">
                      <input id="figurationBaseValue" name="figurationBaseValue" value="${figurationDefinition.figurationBaseValue!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Figuration Definition Id</td>
                  <td class="content">
                      <input id="figurationDefinitionId" name="figurationDefinitionId" value="${figurationDefinition.figurationDefinitionId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Figuration Precision</td>
                  <td class="content">
                      <input id="figurationPrecision" name="figurationPrecision" value="${figurationDefinition.figurationPrecision!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Figuration Rate</td>
                  <td class="content">
                      <input id="figurationRate" name="figurationRate" value="${figurationDefinition.figurationRate!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Group Record Id</td>
                  <td class="content">
                      <input id="groupRecordId" name="groupRecordId" value="${figurationDefinition.groupRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Internal Record Id</td>
                  <td class="content">
                      <input id="internalRecordId" name="internalRecordId" value="${figurationDefinition.internalRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Enable</td>
                  <td class="content">
                      <input id="isEnable" name="isEnable" value="${figurationDefinition.isEnable!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">List Exchange Id</td>
                  <td class="content">
                      <input id="listExchangeId" name="listExchangeId" value="${figurationDefinition.listExchangeId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Lower Limit</td>
                  <td class="content">
                      <input id="lowerLimit" name="lowerLimit" value="${figurationDefinition.lowerLimit!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Max Amount</td>
                  <td class="content">
                      <input id="maxAmount" name="maxAmount" value="${figurationDefinition.maxAmount!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Measurement</td>
                  <td class="content">
                      <input id="measurement" name="measurement" value="${figurationDefinition.measurement!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Measurement Value</td>
                  <td class="content">
                      <input id="measurementValue" name="measurementValue" value="${figurationDefinition.measurementValue!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Min Amount</td>
                  <td class="content">
                      <input id="minAmount" name="minAmount" value="${figurationDefinition.minAmount!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Order Location</td>
                  <td class="content">
                      <input id="orderLocation" name="orderLocation" value="${figurationDefinition.orderLocation!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Parent Record Id</td>
                  <td class="content">
                      <input id="parentRecordId" name="parentRecordId" value="${figurationDefinition.parentRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Priority</td>
                  <td class="content">
                      <input id="priority" name="priority" value="${figurationDefinition.priority!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Product Id</td>
                  <td class="content">
                      <input id="productId" name="productId" value="${figurationDefinition.productId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Product Type</td>
                  <td class="content">
                      <input id="productType" name="productType" value="${figurationDefinition.productType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Record Remark</td>
                  <td class="content">
                      <input id="recordRemark" name="recordRemark" value="${figurationDefinition.recordRemark!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Record Status</td>
                  <td class="content">
                      <input id="recordStatus" name="recordStatus" value="${figurationDefinition.recordStatus!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Root Record Id</td>
                  <td class="content">
                      <input id="rootRecordId" name="rootRecordId" value="${figurationDefinition.rootRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Rounding Rule</td>
                  <td class="content">
                      <input id="roundingRule" name="roundingRule" value="${figurationDefinition.roundingRule!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Sales Id</td>
                  <td class="content">
                      <input id="salesId" name="salesId" value="${figurationDefinition.salesId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settlement Currency Id</td>
                  <td class="content">
                      <input id="settlementCurrencyId" name="settlementCurrencyId" value="${figurationDefinition.settlementCurrencyId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Side</td>
                  <td class="content">
                      <input id="side" name="side" value="${figurationDefinition.side!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trade Currency Id</td>
                  <td class="content">
                      <input id="tradeCurrencyId" name="tradeCurrencyId" value="${figurationDefinition.tradeCurrencyId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trade Exchange Id</td>
                  <td class="content">
                      <input id="tradeExchangeId" name="tradeExchangeId" value="${figurationDefinition.tradeExchangeId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trader Id</td>
                  <td class="content">
                      <input id="traderId" name="traderId" value="${figurationDefinition.traderId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Channel</td>
                  <td class="content">
                      <input id="transactionChannel" name="transactionChannel" value="${figurationDefinition.transactionChannel!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Management System</td>
                  <td class="content">
                      <input id="transactionManagementSystem" name="transactionManagementSystem" value="${figurationDefinition.transactionManagementSystem!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Upper Limit</td>
                  <td class="content">
                      <input id="upperLimit" name="upperLimit" value="${figurationDefinition.upperLimit!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                     
            </tbody>
        </table>
        <div class="gaf-ui-window-toolbar" style="margin-top:5px;">
<#if permission.checkFunctionPermitted("/figurationDefinition/update","POST")>
            <button type="submit" class="gafsubmitBtn">OK</button>
</#if>
            <button type="button" class="gafcancelBtn" onclick="$.gafwindow('close');">Cancel</button>
        </div>
    </div>
</div>
</form>
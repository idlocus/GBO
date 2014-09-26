<#import "/gaf/common.ftl" as common/>
<#import "/gaf/permission.ftl" as permission/>
<#include "tradeTemplateValidate.ftl"/>
<form id="tradeTemplateInputForm">
<div id="tradeTemplateTab" style="height:100px; width:550px;">
    <div title="TradeTemplate">
        <table style="width: 99%;" class="gaf-ui-normal">
            <tbody>
               <tr>              
                  <input type="hidden" name="entityId" value="<#if tradeTemplate.entityId?exists>${tradeTemplate.entityId?c}</#if>"/>
                  <input type="hidden" name="createdBy" value="${tradeTemplate.createdBy!''}"/>
                  <input type="hidden" name="insertTime" value="<#if tradeTemplate.insertTime?exists>${tradeTemplate.insertTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="updatedBy" value="${tradeTemplate.updatedBy!''}"/>
                  <input type="hidden" name="lastUpdateTime" value="<#if tradeTemplate.lastUpdateTime?exists>${tradeTemplate.lastUpdateTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="versionNumber" value="${tradeTemplate.versionNumber!''}"/>
                  
               </tr>   
               
                                                                  <tr>
                  <td class="criteria-label" style="width:100">Amount</td>
                  <td class="content">
                      <input id="amount" name="amount" value="${tradeTemplate.amount!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Book Account Id</td>
                  <td class="content">
                      <input id="bookAccountId" name="bookAccountId" value="${tradeTemplate.bookAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Child Record Id</td>
                  <td class="content">
                      <input id="childRecordId" name="childRecordId" value="${tradeTemplate.childRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Clearing Account Id</td>
                  <td class="content">
                      <input id="clearingAccountId" name="clearingAccountId" value="${tradeTemplate.clearingAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Clearing Broker Id</td>
                  <td class="content">
                      <input id="clearingBrokerId" name="clearingBrokerId" value="${tradeTemplate.clearingBrokerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Dealer Id</td>
                  <td class="content">
                      <input id="dealerId" name="dealerId" value="${tradeTemplate.dealerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">External Record Id</td>
                  <td class="content">
                      <input id="externalRecordId" name="externalRecordId" value="${tradeTemplate.externalRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Group Record Id</td>
                  <td class="content">
                      <input id="groupRecordId" name="groupRecordId" value="${tradeTemplate.groupRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Internal Record Id</td>
                  <td class="content">
                      <input id="internalRecordId" name="internalRecordId" value="${tradeTemplate.internalRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Introducer Account Id</td>
                  <td class="content">
                      <input id="introducerAccountId" name="introducerAccountId" value="${tradeTemplate.introducerAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Late Trade</td>
                  <td class="content">
                      <input id="isLateTrade" name="isLateTrade" value="${tradeTemplate.isLateTrade!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Manual Crossing</td>
                  <td class="content">
                      <input id="isManualCrossing" name="isManualCrossing" value="${tradeTemplate.isManualCrossing!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Manual Fill</td>
                  <td class="content">
                      <input id="isManualFill" name="isManualFill" value="${tradeTemplate.isManualFill!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Odd Lot</td>
                  <td class="content">
                      <input id="isOddLot" name="isOddLot" value="${tradeTemplate.isOddLot!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Unsolicited</td>
                  <td class="content">
                      <input id="isUnsolicited" name="isUnsolicited" value="${tradeTemplate.isUnsolicited!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">List Exchange Id</td>
                  <td class="content">
                      <input id="listExchangeId" name="listExchangeId" value="${tradeTemplate.listExchangeId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Parent Record Id</td>
                  <td class="content">
                      <input id="parentRecordId" name="parentRecordId" value="${tradeTemplate.parentRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Price</td>
                  <td class="content">
                      <input id="price" name="price" value="${tradeTemplate.price!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Primary Account Id</td>
                  <td class="content">
                      <input id="primaryAccountId" name="primaryAccountId" value="${tradeTemplate.primaryAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Primary Account Location</td>
                  <td class="content">
                      <input id="primaryAccountLocation" name="primaryAccountLocation" value="${tradeTemplate.primaryAccountLocation!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Primary Broker Id</td>
                  <td class="content">
                      <input id="primaryBrokerId" name="primaryBrokerId" value="${tradeTemplate.primaryBrokerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Product Id</td>
                  <td class="content">
                      <input id="productId" name="productId" value="${tradeTemplate.productId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Product Type</td>
                  <td class="content">
                      <input id="productType" name="productType" value="${tradeTemplate.productType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Quantity</td>
                  <td class="content">
                      <input id="quantity" name="quantity" value="${tradeTemplate.quantity!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Record Remark</td>
                  <td class="content">
                      <input id="recordRemark" name="recordRemark" value="${tradeTemplate.recordRemark!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Record Status</td>
                  <td class="content">
                      <input id="recordStatus" name="recordStatus" value="${tradeTemplate.recordStatus!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Root Record Id</td>
                  <td class="content">
                      <input id="rootRecordId" name="rootRecordId" value="${tradeTemplate.rootRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Sales Id</td>
                  <td class="content">
                      <input id="salesId" name="salesId" value="${tradeTemplate.salesId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settlement Currency</td>
                  <td class="content">
                      <input id="settlementCurrency" name="settlementCurrency" value="${tradeTemplate.settlementCurrency!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settlement Date</td>
                  <td class="content">
                      <input id="settlementDate" name="settlementDate" value="<#if tradeTemplate.settlementDate?exists>${tradeTemplate.settlementDate?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Side</td>
                  <td class="content">
                      <input id="side" name="side" value="${tradeTemplate.side!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Template Group Id</td>
                  <td class="content">
                      <input id="templateGroupId" name="templateGroupId" value="${tradeTemplate.templateGroupId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Template Id</td>
                  <td class="content">
                      <input id="templateId" name="templateId" value="${tradeTemplate.templateId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trade Exchange Id</td>
                  <td class="content">
                      <input id="tradeExchangeId" name="tradeExchangeId" value="${tradeTemplate.tradeExchangeId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trading Currency</td>
                  <td class="content">
                      <input id="tradingCurrency" name="tradingCurrency" value="${tradeTemplate.tradingCurrency!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trading Date</td>
                  <td class="content">
                      <input id="tradingDate" name="tradingDate" value="<#if tradeTemplate.tradingDate?exists>${tradeTemplate.tradingDate?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Batch Id</td>
                  <td class="content">
                      <input id="transactionBatchId" name="transactionBatchId" value="${tradeTemplate.transactionBatchId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Business Code</td>
                  <td class="content">
                      <input id="transactionBusinessCode" name="transactionBusinessCode" value="${tradeTemplate.transactionBusinessCode!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Business Line Id</td>
                  <td class="content">
                      <input id="transactionBusinessLineId" name="transactionBusinessLineId" value="${tradeTemplate.transactionBusinessLineId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Category</td>
                  <td class="content">
                      <input id="transactionCategory" name="transactionCategory" value="${tradeTemplate.transactionCategory!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Channel</td>
                  <td class="content">
                      <input id="transactionChannel" name="transactionChannel" value="${tradeTemplate.transactionChannel!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Feed Method</td>
                  <td class="content">
                      <input id="transactionFeedMethod" name="transactionFeedMethod" value="${tradeTemplate.transactionFeedMethod!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Id</td>
                  <td class="content">
                      <input id="transactionId" name="transactionId" value="${tradeTemplate.transactionId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Status</td>
                  <td class="content">
                      <input id="transactionStatus" name="transactionStatus" value="${tradeTemplate.transactionStatus!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction System</td>
                  <td class="content">
                      <input id="transactionSystem" name="transactionSystem" value="${tradeTemplate.transactionSystem!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Time</td>
                  <td class="content">
                      <input id="transactionTime" name="transactionTime" value="<#if tradeTemplate.transactionTime?exists>${tradeTemplate.transactionTime?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                                                                                        <tr>
                  <td class="criteria-label" style="width:100">Versus Account Id</td>
                  <td class="content">
                      <input id="versusAccountId" name="versusAccountId" value="${tradeTemplate.versusAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Versus Account Location</td>
                  <td class="content">
                      <input id="versusAccountLocation" name="versusAccountLocation" value="${tradeTemplate.versusAccountLocation!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Versus Broker Id</td>
                  <td class="content">
                      <input id="versusBrokerId" name="versusBrokerId" value="${tradeTemplate.versusBrokerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Wash Account Id</td>
                  <td class="content">
                      <input id="washAccountId" name="washAccountId" value="${tradeTemplate.washAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                   
            </tbody>
        </table>
        <div class="gaf-ui-window-toolbar" style="margin-top:5px;">
<#if permission.checkFunctionPermitted("/tradeTemplate/update","POST")>
            <button type="submit" class="gafsubmitBtn">OK</button>
</#if>
            <button type="button" class="gafcancelBtn" onclick="$.gafwindow('close');">Cancel</button>
        </div>
    </div>
</div>
</form>
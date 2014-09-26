<#import "/gaf/common.ftl" as common/>
<#import "/gaf/permission.ftl" as permission/>
<#include "tradeValidate.ftl"/>
<form id="tradeInputForm">
<div id="tradeTab" style="height:100px; width:550px;">
    <div title="Trade">
        <table style="width: 99%;" class="gaf-ui-normal">
            <tbody>
               <tr>              
                  <input type="hidden" name="entityId" value="<#if trade.entityId?exists>${trade.entityId?c}</#if>"/>
                  <input type="hidden" name="createdBy" value="${trade.createdBy!''}"/>
                  <input type="hidden" name="insertTime" value="<#if trade.insertTime?exists>${trade.insertTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="updatedBy" value="${trade.updatedBy!''}"/>
                  <input type="hidden" name="lastUpdateTime" value="<#if trade.lastUpdateTime?exists>${trade.lastUpdateTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="versionNumber" value="${trade.versionNumber!''}"/>
                  
               </tr>   
               
                                                                  <tr>
                  <td class="criteria-label" style="width:100">Amount</td>
                  <td class="content">
                      <input id="amount" name="amount" value="${trade.amount!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Book Account Id</td>
                  <td class="content">
                      <input id="bookAccountId" name="bookAccountId" value="${trade.bookAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Child Record Id</td>
                  <td class="content">
                      <input id="childRecordId" name="childRecordId" value="${trade.childRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Clearing Account Id</td>
                  <td class="content">
                      <input id="clearingAccountId" name="clearingAccountId" value="${trade.clearingAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Clearing Broker Id</td>
                  <td class="content">
                      <input id="clearingBrokerId" name="clearingBrokerId" value="${trade.clearingBrokerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Dealer Id</td>
                  <td class="content">
                      <input id="dealerId" name="dealerId" value="${trade.dealerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">External Record Id</td>
                  <td class="content">
                      <input id="externalRecordId" name="externalRecordId" value="${trade.externalRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Group Record Id</td>
                  <td class="content">
                      <input id="groupRecordId" name="groupRecordId" value="${trade.groupRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Internal Record Id</td>
                  <td class="content">
                      <input id="internalRecordId" name="internalRecordId" value="${trade.internalRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Introducer Account Id</td>
                  <td class="content">
                      <input id="introducerAccountId" name="introducerAccountId" value="${trade.introducerAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Late Trade</td>
                  <td class="content">
                      <input id="isLateTrade" name="isLateTrade" value="${trade.isLateTrade!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Manual Crossing</td>
                  <td class="content">
                      <input id="isManualCrossing" name="isManualCrossing" value="${trade.isManualCrossing!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Manual Fill</td>
                  <td class="content">
                      <input id="isManualFill" name="isManualFill" value="${trade.isManualFill!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Odd Lot</td>
                  <td class="content">
                      <input id="isOddLot" name="isOddLot" value="${trade.isOddLot!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Unsolicited</td>
                  <td class="content">
                      <input id="isUnsolicited" name="isUnsolicited" value="${trade.isUnsolicited!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">List Exchange Id</td>
                  <td class="content">
                      <input id="listExchangeId" name="listExchangeId" value="${trade.listExchangeId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Parent Record Id</td>
                  <td class="content">
                      <input id="parentRecordId" name="parentRecordId" value="${trade.parentRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Price</td>
                  <td class="content">
                      <input id="price" name="price" value="${trade.price!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Primary Account Id</td>
                  <td class="content">
                      <input id="primaryAccountId" name="primaryAccountId" value="${trade.primaryAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Primary Account Location</td>
                  <td class="content">
                      <input id="primaryAccountLocation" name="primaryAccountLocation" value="${trade.primaryAccountLocation!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Primary Broker Id</td>
                  <td class="content">
                      <input id="primaryBrokerId" name="primaryBrokerId" value="${trade.primaryBrokerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Product Id</td>
                  <td class="content">
                      <input id="productId" name="productId" value="${trade.productId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Product Type</td>
                  <td class="content">
                      <input id="productType" name="productType" value="${trade.productType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Quantity</td>
                  <td class="content">
                      <input id="quantity" name="quantity" value="${trade.quantity!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Record Remark</td>
                  <td class="content">
                      <input id="recordRemark" name="recordRemark" value="${trade.recordRemark!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Record Status</td>
                  <td class="content">
                      <input id="recordStatus" name="recordStatus" value="${trade.recordStatus!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Root Record Id</td>
                  <td class="content">
                      <input id="rootRecordId" name="rootRecordId" value="${trade.rootRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Sales Id</td>
                  <td class="content">
                      <input id="salesId" name="salesId" value="${trade.salesId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settlement Currency</td>
                  <td class="content">
                      <input id="settlementCurrency" name="settlementCurrency" value="${trade.settlementCurrency!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settlement Date</td>
                  <td class="content">
                      <input id="settlementDate" name="settlementDate" value="<#if trade.settlementDate?exists>${trade.settlementDate?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Side</td>
                  <td class="content">
                      <input id="side" name="side" value="${trade.side!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Template Group Id</td>
                  <td class="content">
                      <input id="templateGroupId" name="templateGroupId" value="${trade.templateGroupId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Template Id</td>
                  <td class="content">
                      <input id="templateId" name="templateId" value="${trade.templateId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trade Exchange Id</td>
                  <td class="content">
                      <input id="tradeExchangeId" name="tradeExchangeId" value="${trade.tradeExchangeId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trading Currency</td>
                  <td class="content">
                      <input id="tradingCurrency" name="tradingCurrency" value="${trade.tradingCurrency!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trading Date</td>
                  <td class="content">
                      <input id="tradingDate" name="tradingDate" value="<#if trade.tradingDate?exists>${trade.tradingDate?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Batch Id</td>
                  <td class="content">
                      <input id="transactionBatchId" name="transactionBatchId" value="${trade.transactionBatchId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Business Code</td>
                  <td class="content">
                      <input id="transactionBusinessCode" name="transactionBusinessCode" value="${trade.transactionBusinessCode!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Business Line Id</td>
                  <td class="content">
                      <input id="transactionBusinessLineId" name="transactionBusinessLineId" value="${trade.transactionBusinessLineId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Category</td>
                  <td class="content">
                      <input id="transactionCategory" name="transactionCategory" value="${trade.transactionCategory!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Channel</td>
                  <td class="content">
                      <input id="transactionChannel" name="transactionChannel" value="${trade.transactionChannel!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Feed Method</td>
                  <td class="content">
                      <input id="transactionFeedMethod" name="transactionFeedMethod" value="${trade.transactionFeedMethod!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Id</td>
                  <td class="content">
                      <input id="transactionId" name="transactionId" value="${trade.transactionId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Status</td>
                  <td class="content">
                      <input id="transactionStatus" name="transactionStatus" value="${trade.transactionStatus!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction System</td>
                  <td class="content">
                      <input id="transactionSystem" name="transactionSystem" value="${trade.transactionSystem!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Time</td>
                  <td class="content">
                      <input id="transactionTime" name="transactionTime" value="<#if trade.transactionTime?exists>${trade.transactionTime?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                                                                                        <tr>
                  <td class="criteria-label" style="width:100">Versus Account Id</td>
                  <td class="content">
                      <input id="versusAccountId" name="versusAccountId" value="${trade.versusAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Versus Account Location</td>
                  <td class="content">
                      <input id="versusAccountLocation" name="versusAccountLocation" value="${trade.versusAccountLocation!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Versus Broker Id</td>
                  <td class="content">
                      <input id="versusBrokerId" name="versusBrokerId" value="${trade.versusBrokerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Wash Account Id</td>
                  <td class="content">
                      <input id="washAccountId" name="washAccountId" value="${trade.washAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                   
            </tbody>
        </table>
        <div class="gaf-ui-window-toolbar" style="margin-top:5px;">
<#if permission.checkFunctionPermitted("/trade/update","POST")>
            <button type="submit" class="gafsubmitBtn">OK</button>
</#if>
            <button type="button" class="gafcancelBtn" onclick="$.gafwindow('close');">Cancel</button>
        </div>
    </div>
</div>
</form>
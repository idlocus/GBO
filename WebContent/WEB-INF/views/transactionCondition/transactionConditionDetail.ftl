<#import "/gaf/common.ftl" as common/>
<#import "/gaf/permission.ftl" as permission/>
<#include "transactionConditionValidate.ftl"/>
<form id="transactionConditionInputForm">
<div id="transactionConditionTab" style="height:100px; width:550px;">
    <div title="TransactionCondition">
        <table style="width: 99%;" class="gaf-ui-normal">
            <tbody>
               <tr>              
                  <input type="hidden" name="entityId" value="<#if transactionCondition.entityId?exists>${transactionCondition.entityId?c}</#if>"/>
                  <input type="hidden" name="createdBy" value="${transactionCondition.createdBy!''}"/>
                  <input type="hidden" name="insertTime" value="<#if transactionCondition.insertTime?exists>${transactionCondition.insertTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="updatedBy" value="${transactionCondition.updatedBy!''}"/>
                  <input type="hidden" name="lastUpdateTime" value="<#if transactionCondition.lastUpdateTime?exists>${transactionCondition.lastUpdateTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="versionNumber" value="${transactionCondition.versionNumber!''}"/>
                  
               </tr>   
               
                                                                  <tr>
                  <td class="criteria-label" style="width:100">Amount</td>
                  <td class="content">
                      <input id="amount" name="amount" value="${transactionCondition.amount!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Book Account Id</td>
                  <td class="content">
                      <input id="bookAccountId" name="bookAccountId" value="${transactionCondition.bookAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Child Record Id</td>
                  <td class="content">
                      <input id="childRecordId" name="childRecordId" value="${transactionCondition.childRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Clearing Account Id</td>
                  <td class="content">
                      <input id="clearingAccountId" name="clearingAccountId" value="${transactionCondition.clearingAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Clearing Broker Id</td>
                  <td class="content">
                      <input id="clearingBrokerId" name="clearingBrokerId" value="${transactionCondition.clearingBrokerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Condition Number</td>
                  <td class="content">
                      <input id="conditionNumber" name="conditionNumber" value="${transactionCondition.conditionNumber!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Condition Value</td>
                  <td class="content">
                      <input id="conditionValue" name="conditionValue" value="${transactionCondition.conditionValue!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Dealer Id</td>
                  <td class="content">
                      <input id="dealerId" name="dealerId" value="${transactionCondition.dealerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">External Record Id</td>
                  <td class="content">
                      <input id="externalRecordId" name="externalRecordId" value="${transactionCondition.externalRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Group Record Id</td>
                  <td class="content">
                      <input id="groupRecordId" name="groupRecordId" value="${transactionCondition.groupRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Internal Record Id</td>
                  <td class="content">
                      <input id="internalRecordId" name="internalRecordId" value="${transactionCondition.internalRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Introducer Account Id</td>
                  <td class="content">
                      <input id="introducerAccountId" name="introducerAccountId" value="${transactionCondition.introducerAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Late Trade</td>
                  <td class="content">
                      <input id="isLateTrade" name="isLateTrade" value="${transactionCondition.isLateTrade!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Manual Crossing</td>
                  <td class="content">
                      <input id="isManualCrossing" name="isManualCrossing" value="${transactionCondition.isManualCrossing!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Manual Fill</td>
                  <td class="content">
                      <input id="isManualFill" name="isManualFill" value="${transactionCondition.isManualFill!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Odd Lot</td>
                  <td class="content">
                      <input id="isOddLot" name="isOddLot" value="${transactionCondition.isOddLot!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Unsolicited</td>
                  <td class="content">
                      <input id="isUnsolicited" name="isUnsolicited" value="${transactionCondition.isUnsolicited!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">List Exchange Id</td>
                  <td class="content">
                      <input id="listExchangeId" name="listExchangeId" value="${transactionCondition.listExchangeId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Parent Record Id</td>
                  <td class="content">
                      <input id="parentRecordId" name="parentRecordId" value="${transactionCondition.parentRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Price</td>
                  <td class="content">
                      <input id="price" name="price" value="${transactionCondition.price!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Primary Account Id</td>
                  <td class="content">
                      <input id="primaryAccountId" name="primaryAccountId" value="${transactionCondition.primaryAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Primary Account Location</td>
                  <td class="content">
                      <input id="primaryAccountLocation" name="primaryAccountLocation" value="${transactionCondition.primaryAccountLocation!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Primary Broker Id</td>
                  <td class="content">
                      <input id="primaryBrokerId" name="primaryBrokerId" value="${transactionCondition.primaryBrokerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Product Id</td>
                  <td class="content">
                      <input id="productId" name="productId" value="${transactionCondition.productId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Product Type</td>
                  <td class="content">
                      <input id="productType" name="productType" value="${transactionCondition.productType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Quantity</td>
                  <td class="content">
                      <input id="quantity" name="quantity" value="${transactionCondition.quantity!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Record Remark</td>
                  <td class="content">
                      <input id="recordRemark" name="recordRemark" value="${transactionCondition.recordRemark!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Record Status</td>
                  <td class="content">
                      <input id="recordStatus" name="recordStatus" value="${transactionCondition.recordStatus!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Root Record Id</td>
                  <td class="content">
                      <input id="rootRecordId" name="rootRecordId" value="${transactionCondition.rootRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Sales Id</td>
                  <td class="content">
                      <input id="salesId" name="salesId" value="${transactionCondition.salesId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settlement Currency</td>
                  <td class="content">
                      <input id="settlementCurrency" name="settlementCurrency" value="${transactionCondition.settlementCurrency!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settlement Date</td>
                  <td class="content">
                      <input id="settlementDate" name="settlementDate" value="<#if transactionCondition.settlementDate?exists>${transactionCondition.settlementDate?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Side</td>
                  <td class="content">
                      <input id="side" name="side" value="${transactionCondition.side!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Template Group Id</td>
                  <td class="content">
                      <input id="templateGroupId" name="templateGroupId" value="${transactionCondition.templateGroupId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trade Exchange Id</td>
                  <td class="content">
                      <input id="tradeExchangeId" name="tradeExchangeId" value="${transactionCondition.tradeExchangeId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trading Currency</td>
                  <td class="content">
                      <input id="tradingCurrency" name="tradingCurrency" value="${transactionCondition.tradingCurrency!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trading Date</td>
                  <td class="content">
                      <input id="tradingDate" name="tradingDate" value="<#if transactionCondition.tradingDate?exists>${transactionCondition.tradingDate?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Batch Id</td>
                  <td class="content">
                      <input id="transactionBatchId" name="transactionBatchId" value="${transactionCondition.transactionBatchId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Business Code</td>
                  <td class="content">
                      <input id="transactionBusinessCode" name="transactionBusinessCode" value="${transactionCondition.transactionBusinessCode!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Business Line Id</td>
                  <td class="content">
                      <input id="transactionBusinessLineId" name="transactionBusinessLineId" value="${transactionCondition.transactionBusinessLineId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Category</td>
                  <td class="content">
                      <input id="transactionCategory" name="transactionCategory" value="${transactionCondition.transactionCategory!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Channel</td>
                  <td class="content">
                      <input id="transactionChannel" name="transactionChannel" value="${transactionCondition.transactionChannel!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Feed Method</td>
                  <td class="content">
                      <input id="transactionFeedMethod" name="transactionFeedMethod" value="${transactionCondition.transactionFeedMethod!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Id</td>
                  <td class="content">
                      <input id="transactionId" name="transactionId" value="${transactionCondition.transactionId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Status</td>
                  <td class="content">
                      <input id="transactionStatus" name="transactionStatus" value="${transactionCondition.transactionStatus!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction System</td>
                  <td class="content">
                      <input id="transactionSystem" name="transactionSystem" value="${transactionCondition.transactionSystem!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Time</td>
                  <td class="content">
                      <input id="transactionTime" name="transactionTime" value="<#if transactionCondition.transactionTime?exists>${transactionCondition.transactionTime?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                                                                                        <tr>
                  <td class="criteria-label" style="width:100">Versus Account Id</td>
                  <td class="content">
                      <input id="versusAccountId" name="versusAccountId" value="${transactionCondition.versusAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Versus Account Location</td>
                  <td class="content">
                      <input id="versusAccountLocation" name="versusAccountLocation" value="${transactionCondition.versusAccountLocation!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Versus Broker Id</td>
                  <td class="content">
                      <input id="versusBrokerId" name="versusBrokerId" value="${transactionCondition.versusBrokerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Wash Account Id</td>
                  <td class="content">
                      <input id="washAccountId" name="washAccountId" value="${transactionCondition.washAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                   
            </tbody>
        </table>
        <div class="gaf-ui-window-toolbar" style="margin-top:5px;">
<#if permission.checkFunctionPermitted("/transactionCondition/update","POST")>
            <button type="submit" class="gafsubmitBtn">OK</button>
</#if>
            <button type="button" class="gafcancelBtn" onclick="$.gafwindow('close');">Cancel</button>
        </div>
    </div>
</div>
</form>
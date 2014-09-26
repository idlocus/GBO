<#import "/gaf/common.ftl" as common/>
<#import "/gaf/permission.ftl" as permission/>
<#include "executionValidate.ftl"/>
<form id="executionInputForm">
<div id="executionTab" style="height:100px; width:550px;">
    <div title="Execution">
        <table style="width: 99%;" class="gaf-ui-normal">
            <tbody>
               <tr>              
                  <input type="hidden" name="entityId" value="<#if execution.entityId?exists>${execution.entityId?c}</#if>"/>
                  <input type="hidden" name="createdBy" value="${execution.createdBy!''}"/>
                  <input type="hidden" name="insertTime" value="<#if execution.insertTime?exists>${execution.insertTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="updatedBy" value="${execution.updatedBy!''}"/>
                  <input type="hidden" name="lastUpdateTime" value="<#if execution.lastUpdateTime?exists>${execution.lastUpdateTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="versionNumber" value="${execution.versionNumber!''}"/>
                  
               </tr>   
               
                                                                  <tr>
                  <td class="criteria-label" style="width:100">Amount</td>
                  <td class="content">
                      <input id="amount" name="amount" value="${execution.amount!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Book Account Id</td>
                  <td class="content">
                      <input id="bookAccountId" name="bookAccountId" value="${execution.bookAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Child Record Id</td>
                  <td class="content">
                      <input id="childRecordId" name="childRecordId" value="${execution.childRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Cicc Client Ord Id</td>
                  <td class="content">
                      <input id="ciccClientOrdId" name="ciccClientOrdId" value="${execution.ciccClientOrdId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Cicc Client Req Id</td>
                  <td class="content">
                      <input id="ciccClientReqId" name="ciccClientReqId" value="${execution.ciccClientReqId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Cicc Parent Ord Id</td>
                  <td class="content">
                      <input id="ciccParentOrdId" name="ciccParentOrdId" value="${execution.ciccParentOrdId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Clearing Account Id</td>
                  <td class="content">
                      <input id="clearingAccountId" name="clearingAccountId" value="${execution.clearingAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Clearing Broker Id</td>
                  <td class="content">
                      <input id="clearingBrokerId" name="clearingBrokerId" value="${execution.clearingBrokerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Client Order Id</td>
                  <td class="content">
                      <input id="clientOrderId" name="clientOrderId" value="${execution.clientOrderId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Commission</td>
                  <td class="content">
                      <input id="commission" name="commission" value="${execution.commission!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Commission Type</td>
                  <td class="content">
                      <input id="commissionType" name="commissionType" value="${execution.commissionType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Cusip</td>
                  <td class="content">
                      <input id="cusip" name="cusip" value="${execution.cusip!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Dealer Id</td>
                  <td class="content">
                      <input id="dealerId" name="dealerId" value="${execution.dealerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Exec Trans Type</td>
                  <td class="content">
                      <input id="execTransType" name="execTransType" value="${execution.execTransType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Exec Type</td>
                  <td class="content">
                      <input id="execType" name="execType" value="${execution.execType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Execute Instruction</td>
                  <td class="content">
                      <input id="executeInstruction" name="executeInstruction" value="${execution.executeInstruction!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Execution Id</td>
                  <td class="content">
                      <input id="executionId" name="executionId" value="${execution.executionId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Execution Reference Id</td>
                  <td class="content">
                      <input id="executionReferenceId" name="executionReferenceId" value="${execution.executionReferenceId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Expire Time</td>
                  <td class="content">
                      <input id="expireTime" name="expireTime" value="<#if execution.expireTime?exists>${execution.expireTime?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">External Execution Id</td>
                  <td class="content">
                      <input id="externalExecutionId" name="externalExecutionId" value="${execution.externalExecutionId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">External Record Id</td>
                  <td class="content">
                      <input id="externalRecordId" name="externalRecordId" value="${execution.externalRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Filled Average Price</td>
                  <td class="content">
                      <input id="filledAveragePrice" name="filledAveragePrice" value="${execution.filledAveragePrice!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Filled Quantity</td>
                  <td class="content">
                      <input id="filledQuantity" name="filledQuantity" value="${execution.filledQuantity!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Group Record Id</td>
                  <td class="content">
                      <input id="groupRecordId" name="groupRecordId" value="${execution.groupRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Internal Record Id</td>
                  <td class="content">
                      <input id="internalRecordId" name="internalRecordId" value="${execution.internalRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Introducer Account Id</td>
                  <td class="content">
                      <input id="introducerAccountId" name="introducerAccountId" value="${execution.introducerAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Late Trade</td>
                  <td class="content">
                      <input id="isLateTrade" name="isLateTrade" value="${execution.isLateTrade!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Manual Crossing</td>
                  <td class="content">
                      <input id="isManualCrossing" name="isManualCrossing" value="${execution.isManualCrossing!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Manual Fill</td>
                  <td class="content">
                      <input id="isManualFill" name="isManualFill" value="${execution.isManualFill!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Odd Lot</td>
                  <td class="content">
                      <input id="isOddLot" name="isOddLot" value="${execution.isOddLot!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Unsolicited</td>
                  <td class="content">
                      <input id="isUnsolicited" name="isUnsolicited" value="${execution.isUnsolicited!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Isin</td>
                  <td class="content">
                      <input id="isin" name="isin" value="${execution.isin!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Issuer</td>
                  <td class="content">
                      <input id="issuer" name="issuer" value="${execution.issuer!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Last Filled Price</td>
                  <td class="content">
                      <input id="lastFilledPrice" name="lastFilledPrice" value="${execution.lastFilledPrice!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Last Filled Quantity</td>
                  <td class="content">
                      <input id="lastFilledQuantity" name="lastFilledQuantity" value="${execution.lastFilledQuantity!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Leaves Quantity</td>
                  <td class="content">
                      <input id="leavesQuantity" name="leavesQuantity" value="${execution.leavesQuantity!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">List Exchange Id</td>
                  <td class="content">
                      <input id="listExchangeId" name="listExchangeId" value="${execution.listExchangeId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Order Capacity</td>
                  <td class="content">
                      <input id="orderCapacity" name="orderCapacity" value="${execution.orderCapacity!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Order Id</td>
                  <td class="content">
                      <input id="orderId" name="orderId" value="${execution.orderId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Order Price</td>
                  <td class="content">
                      <input id="orderPrice" name="orderPrice" value="${execution.orderPrice!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Order Quantity</td>
                  <td class="content">
                      <input id="orderQuantity" name="orderQuantity" value="${execution.orderQuantity!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Order Status</td>
                  <td class="content">
                      <input id="orderStatus" name="orderStatus" value="${execution.orderStatus!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Order Stop Price</td>
                  <td class="content">
                      <input id="orderStopPrice" name="orderStopPrice" value="${execution.orderStopPrice!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Order Type</td>
                  <td class="content">
                      <input id="orderType" name="orderType" value="${execution.orderType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Parent Order Id</td>
                  <td class="content">
                      <input id="parentOrderId" name="parentOrderId" value="${execution.parentOrderId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Parent Record Id</td>
                  <td class="content">
                      <input id="parentRecordId" name="parentRecordId" value="${execution.parentRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Price</td>
                  <td class="content">
                      <input id="price" name="price" value="${execution.price!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Primary Account Id</td>
                  <td class="content">
                      <input id="primaryAccountId" name="primaryAccountId" value="${execution.primaryAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Primary Account Location</td>
                  <td class="content">
                      <input id="primaryAccountLocation" name="primaryAccountLocation" value="${execution.primaryAccountLocation!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Primary Broker Id</td>
                  <td class="content">
                      <input id="primaryBrokerId" name="primaryBrokerId" value="${execution.primaryBrokerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Product Id</td>
                  <td class="content">
                      <input id="productId" name="productId" value="${execution.productId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Product Id Source</td>
                  <td class="content">
                      <input id="productIdSource" name="productIdSource" value="${execution.productIdSource!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Product Type</td>
                  <td class="content">
                      <input id="productType" name="productType" value="${execution.productType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Quantity</td>
                  <td class="content">
                      <input id="quantity" name="quantity" value="${execution.quantity!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Record Remark</td>
                  <td class="content">
                      <input id="recordRemark" name="recordRemark" value="${execution.recordRemark!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Record Status</td>
                  <td class="content">
                      <input id="recordStatus" name="recordStatus" value="${execution.recordStatus!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Root Order Id</td>
                  <td class="content">
                      <input id="rootOrderId" name="rootOrderId" value="${execution.rootOrderId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Root Record Id</td>
                  <td class="content">
                      <input id="rootRecordId" name="rootRecordId" value="${execution.rootRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Sales Id</td>
                  <td class="content">
                      <input id="salesId" name="salesId" value="${execution.salesId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Sedol</td>
                  <td class="content">
                      <input id="sedol" name="sedol" value="${execution.sedol!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settle Cur Fx Rate Method</td>
                  <td class="content">
                      <input id="settleCurFxRateMethod" name="settleCurFxRateMethod" value="${execution.settleCurFxRateMethod!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settlement Amount</td>
                  <td class="content">
                      <input id="settlementAmount" name="settlementAmount" value="${execution.settlementAmount!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settlement Currency</td>
                  <td class="content">
                      <input id="settlementCurrency" name="settlementCurrency" value="${execution.settlementCurrency!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settlement Currency Id</td>
                  <td class="content">
                      <input id="settlementCurrencyId" name="settlementCurrencyId" value="${execution.settlementCurrencyId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settlement Date</td>
                  <td class="content">
                      <input id="settlementDate" name="settlementDate" value="<#if execution.settlementDate?exists>${execution.settlementDate?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settlement Type</td>
                  <td class="content">
                      <input id="settlementType" name="settlementType" value="${execution.settlementType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Side</td>
                  <td class="content">
                      <input id="side" name="side" value="${execution.side!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Template Group Id</td>
                  <td class="content">
                      <input id="templateGroupId" name="templateGroupId" value="${execution.templateGroupId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Time In Force</td>
                  <td class="content">
                      <input id="timeInForce" name="timeInForce" value="${execution.timeInForce!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trade Exchange Id</td>
                  <td class="content">
                      <input id="tradeExchangeId" name="tradeExchangeId" value="${execution.tradeExchangeId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trading Currency</td>
                  <td class="content">
                      <input id="tradingCurrency" name="tradingCurrency" value="${execution.tradingCurrency!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trading Date</td>
                  <td class="content">
                      <input id="tradingDate" name="tradingDate" value="<#if execution.tradingDate?exists>${execution.tradingDate?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Batch Id</td>
                  <td class="content">
                      <input id="transactionBatchId" name="transactionBatchId" value="${execution.transactionBatchId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Business Code</td>
                  <td class="content">
                      <input id="transactionBusinessCode" name="transactionBusinessCode" value="${execution.transactionBusinessCode!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Business Line Id</td>
                  <td class="content">
                      <input id="transactionBusinessLineId" name="transactionBusinessLineId" value="${execution.transactionBusinessLineId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Category</td>
                  <td class="content">
                      <input id="transactionCategory" name="transactionCategory" value="${execution.transactionCategory!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Channel</td>
                  <td class="content">
                      <input id="transactionChannel" name="transactionChannel" value="${execution.transactionChannel!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Feed Method</td>
                  <td class="content">
                      <input id="transactionFeedMethod" name="transactionFeedMethod" value="${execution.transactionFeedMethod!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Id</td>
                  <td class="content">
                      <input id="transactionId" name="transactionId" value="${execution.transactionId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Status</td>
                  <td class="content">
                      <input id="transactionStatus" name="transactionStatus" value="${execution.transactionStatus!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction System</td>
                  <td class="content">
                      <input id="transactionSystem" name="transactionSystem" value="${execution.transactionSystem!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Time</td>
                  <td class="content">
                      <input id="transactionTime" name="transactionTime" value="<#if execution.transactionTime?exists>${execution.transactionTime?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                                                                                        <tr>
                  <td class="criteria-label" style="width:100">Versus Account Id</td>
                  <td class="content">
                      <input id="versusAccountId" name="versusAccountId" value="${execution.versusAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Versus Account Location</td>
                  <td class="content">
                      <input id="versusAccountLocation" name="versusAccountLocation" value="${execution.versusAccountLocation!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Versus Broker Id</td>
                  <td class="content">
                      <input id="versusBrokerId" name="versusBrokerId" value="${execution.versusBrokerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Wash Account Id</td>
                  <td class="content">
                      <input id="washAccountId" name="washAccountId" value="${execution.washAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                   
            </tbody>
        </table>
        <div class="gaf-ui-window-toolbar" style="margin-top:5px;">
<#if permission.checkFunctionPermitted("/execution/update","POST")>
            <button type="submit" class="gafsubmitBtn">OK</button>
</#if>
            <button type="button" class="gafcancelBtn" onclick="$.gafwindow('close');">Cancel</button>
        </div>
    </div>
</div>
</form>
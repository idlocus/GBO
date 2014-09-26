<#import "/gaf/common.ftl" as common/>
<#import "/gaf/permission.ftl" as permission/>
<#include "orderValidate.ftl"/>
<form id="orderInputForm">
<div id="orderTab" style="height:100px; width:550px;">
    <div title="Order">
        <table style="width: 99%;" class="gaf-ui-normal">
            <tbody>
               <tr>              
                  <input type="hidden" name="entityId" value="<#if order.entityId?exists>${order.entityId?c}</#if>"/>
                  <input type="hidden" name="createdBy" value="${order.createdBy!''}"/>
                  <input type="hidden" name="insertTime" value="<#if order.insertTime?exists>${order.insertTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="updatedBy" value="${order.updatedBy!''}"/>
                  <input type="hidden" name="lastUpdateTime" value="<#if order.lastUpdateTime?exists>${order.lastUpdateTime?string("yyyy-MM-dd HH:mm:ss")}</#if>"/>
                  <input type="hidden" name="versionNumber" value="${order.versionNumber!''}"/>
                  
               </tr>   
               
                                                                  <tr>
                  <td class="criteria-label" style="width:100">Amount</td>
                  <td class="content">
                      <input id="amount" name="amount" value="${order.amount!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Book Account Id</td>
                  <td class="content">
                      <input id="bookAccountId" name="bookAccountId" value="${order.bookAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Child Record Id</td>
                  <td class="content">
                      <input id="childRecordId" name="childRecordId" value="${order.childRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Cicc Client Ord Id</td>
                  <td class="content">
                      <input id="ciccClientOrdId" name="ciccClientOrdId" value="${order.ciccClientOrdId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Cicc Client Req Id</td>
                  <td class="content">
                      <input id="ciccClientReqId" name="ciccClientReqId" value="${order.ciccClientReqId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Cicc Parent Ord Id</td>
                  <td class="content">
                      <input id="ciccParentOrdId" name="ciccParentOrdId" value="${order.ciccParentOrdId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Clearing Account Id</td>
                  <td class="content">
                      <input id="clearingAccountId" name="clearingAccountId" value="${order.clearingAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Clearing Broker Id</td>
                  <td class="content">
                      <input id="clearingBrokerId" name="clearingBrokerId" value="${order.clearingBrokerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Client Order Id</td>
                  <td class="content">
                      <input id="clientOrderId" name="clientOrderId" value="${order.clientOrderId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Commission</td>
                  <td class="content">
                      <input id="commission" name="commission" value="${order.commission!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Commission Type</td>
                  <td class="content">
                      <input id="commissionType" name="commissionType" value="${order.commissionType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Cusip</td>
                  <td class="content">
                      <input id="cusip" name="cusip" value="${order.cusip!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Dealer Id</td>
                  <td class="content">
                      <input id="dealerId" name="dealerId" value="${order.dealerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Exec Type</td>
                  <td class="content">
                      <input id="execType" name="execType" value="${order.execType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Execute Instruction</td>
                  <td class="content">
                      <input id="executeInstruction" name="executeInstruction" value="${order.executeInstruction!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Expire Time</td>
                  <td class="content">
                      <input id="expireTime" name="expireTime" value="<#if order.expireTime?exists>${order.expireTime?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">External Record Id</td>
                  <td class="content">
                      <input id="externalRecordId" name="externalRecordId" value="${order.externalRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Filled Average Price</td>
                  <td class="content">
                      <input id="filledAveragePrice" name="filledAveragePrice" value="${order.filledAveragePrice!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Filled Quantity</td>
                  <td class="content">
                      <input id="filledQuantity" name="filledQuantity" value="${order.filledQuantity!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Group Record Id</td>
                  <td class="content">
                      <input id="groupRecordId" name="groupRecordId" value="${order.groupRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Internal Record Id</td>
                  <td class="content">
                      <input id="internalRecordId" name="internalRecordId" value="${order.internalRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Introducer Account Id</td>
                  <td class="content">
                      <input id="introducerAccountId" name="introducerAccountId" value="${order.introducerAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Late Trade</td>
                  <td class="content">
                      <input id="isLateTrade" name="isLateTrade" value="${order.isLateTrade!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Manual Crossing</td>
                  <td class="content">
                      <input id="isManualCrossing" name="isManualCrossing" value="${order.isManualCrossing!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Manual Fill</td>
                  <td class="content">
                      <input id="isManualFill" name="isManualFill" value="${order.isManualFill!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Odd Lot</td>
                  <td class="content">
                      <input id="isOddLot" name="isOddLot" value="${order.isOddLot!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Is Unsolicited</td>
                  <td class="content">
                      <input id="isUnsolicited" name="isUnsolicited" value="${order.isUnsolicited!''}" class="gaf-ui-normal" style="width: 170px;"/> Y or N  
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Isin</td>
                  <td class="content">
                      <input id="isin" name="isin" value="${order.isin!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Issuer</td>
                  <td class="content">
                      <input id="issuer" name="issuer" value="${order.issuer!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Last Filled Price</td>
                  <td class="content">
                      <input id="lastFilledPrice" name="lastFilledPrice" value="${order.lastFilledPrice!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Last Filled Quantity</td>
                  <td class="content">
                      <input id="lastFilledQuantity" name="lastFilledQuantity" value="${order.lastFilledQuantity!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                                                      <tr>
                  <td class="criteria-label" style="width:100">Leaves Quantity</td>
                  <td class="content">
                      <input id="leavesQuantity" name="leavesQuantity" value="${order.leavesQuantity!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">List Exchange Id</td>
                  <td class="content">
                      <input id="listExchangeId" name="listExchangeId" value="${order.listExchangeId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Order Capacity</td>
                  <td class="content">
                      <input id="orderCapacity" name="orderCapacity" value="${order.orderCapacity!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Order Id</td>
                  <td class="content">
                      <input id="orderId" name="orderId" value="${order.orderId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Order Price</td>
                  <td class="content">
                      <input id="orderPrice" name="orderPrice" value="${order.orderPrice!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Order Quantity</td>
                  <td class="content">
                      <input id="orderQuantity" name="orderQuantity" value="${order.orderQuantity!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Order Status</td>
                  <td class="content">
                      <input id="orderStatus" name="orderStatus" value="${order.orderStatus!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Order Stop Price</td>
                  <td class="content">
                      <input id="orderStopPrice" name="orderStopPrice" value="${order.orderStopPrice!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Order Type</td>
                  <td class="content">
                      <input id="orderType" name="orderType" value="${order.orderType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Parent Order Id</td>
                  <td class="content">
                      <input id="parentOrderId" name="parentOrderId" value="${order.parentOrderId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Parent Record Id</td>
                  <td class="content">
                      <input id="parentRecordId" name="parentRecordId" value="${order.parentRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Price</td>
                  <td class="content">
                      <input id="price" name="price" value="${order.price!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Primary Account Id</td>
                  <td class="content">
                      <input id="primaryAccountId" name="primaryAccountId" value="${order.primaryAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Primary Account Location</td>
                  <td class="content">
                      <input id="primaryAccountLocation" name="primaryAccountLocation" value="${order.primaryAccountLocation!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Primary Broker Id</td>
                  <td class="content">
                      <input id="primaryBrokerId" name="primaryBrokerId" value="${order.primaryBrokerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Product Id</td>
                  <td class="content">
                      <input id="productId" name="productId" value="${order.productId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Product Id Source</td>
                  <td class="content">
                      <input id="productIdSource" name="productIdSource" value="${order.productIdSource!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Product Type</td>
                  <td class="content">
                      <input id="productType" name="productType" value="${order.productType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Quantity</td>
                  <td class="content">
                      <input id="quantity" name="quantity" value="${order.quantity!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Record Remark</td>
                  <td class="content">
                      <input id="recordRemark" name="recordRemark" value="${order.recordRemark!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Record Status</td>
                  <td class="content">
                      <input id="recordStatus" name="recordStatus" value="${order.recordStatus!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Root Order Id</td>
                  <td class="content">
                      <input id="rootOrderId" name="rootOrderId" value="${order.rootOrderId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Root Record Id</td>
                  <td class="content">
                      <input id="rootRecordId" name="rootRecordId" value="${order.rootRecordId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Sales Id</td>
                  <td class="content">
                      <input id="salesId" name="salesId" value="${order.salesId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Sedol</td>
                  <td class="content">
                      <input id="sedol" name="sedol" value="${order.sedol!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settle Cur Fx Rate Method</td>
                  <td class="content">
                      <input id="settleCurFxRateMethod" name="settleCurFxRateMethod" value="${order.settleCurFxRateMethod!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settlement Amount</td>
                  <td class="content">
                      <input id="settlementAmount" name="settlementAmount" value="${order.settlementAmount!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settlement Currency</td>
                  <td class="content">
                      <input id="settlementCurrency" name="settlementCurrency" value="${order.settlementCurrency!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settlement Currency Id</td>
                  <td class="content">
                      <input id="settlementCurrencyId" name="settlementCurrencyId" value="${order.settlementCurrencyId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settlement Date</td>
                  <td class="content">
                      <input id="settlementDate" name="settlementDate" value="<#if order.settlementDate?exists>${order.settlementDate?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Settlement Type</td>
                  <td class="content">
                      <input id="settlementType" name="settlementType" value="${order.settlementType!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Side</td>
                  <td class="content">
                      <input id="side" name="side" value="${order.side!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Template Group Id</td>
                  <td class="content">
                      <input id="templateGroupId" name="templateGroupId" value="${order.templateGroupId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Time In Force</td>
                  <td class="content">
                      <input id="timeInForce" name="timeInForce" value="${order.timeInForce!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trade Exchange Id</td>
                  <td class="content">
                      <input id="tradeExchangeId" name="tradeExchangeId" value="${order.tradeExchangeId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trading Currency</td>
                  <td class="content">
                      <input id="tradingCurrency" name="tradingCurrency" value="${order.tradingCurrency!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Trading Date</td>
                  <td class="content">
                      <input id="tradingDate" name="tradingDate" value="<#if order.tradingDate?exists>${order.tradingDate?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Batch Id</td>
                  <td class="content">
                      <input id="transactionBatchId" name="transactionBatchId" value="${order.transactionBatchId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Business Code</td>
                  <td class="content">
                      <input id="transactionBusinessCode" name="transactionBusinessCode" value="${order.transactionBusinessCode!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Business Line Id</td>
                  <td class="content">
                      <input id="transactionBusinessLineId" name="transactionBusinessLineId" value="${order.transactionBusinessLineId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Category</td>
                  <td class="content">
                      <input id="transactionCategory" name="transactionCategory" value="${order.transactionCategory!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Channel</td>
                  <td class="content">
                      <input id="transactionChannel" name="transactionChannel" value="${order.transactionChannel!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Feed Method</td>
                  <td class="content">
                      <input id="transactionFeedMethod" name="transactionFeedMethod" value="${order.transactionFeedMethod!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Id</td>
                  <td class="content">
                      <input id="transactionId" name="transactionId" value="${order.transactionId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Status</td>
                  <td class="content">
                      <input id="transactionStatus" name="transactionStatus" value="${order.transactionStatus!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction System</td>
                  <td class="content">
                      <input id="transactionSystem" name="transactionSystem" value="${order.transactionSystem!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Transaction Time</td>
                  <td class="content">
                      <input id="transactionTime" name="transactionTime" value="<#if order.transactionTime?exists>${order.transactionTime?string("yyyy-MM-dd")}</#if>" class="gaf-ui-normal gafdatebox" cssStyle="width: 170px;"/>                 
                                    </td>
                 </tr>
                                                                                                                                                                        <tr>
                  <td class="criteria-label" style="width:100">Versus Account Id</td>
                  <td class="content">
                      <input id="versusAccountId" name="versusAccountId" value="${order.versusAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Versus Account Location</td>
                  <td class="content">
                      <input id="versusAccountLocation" name="versusAccountLocation" value="${order.versusAccountLocation!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Versus Broker Id</td>
                  <td class="content">
                      <input id="versusBrokerId" name="versusBrokerId" value="${order.versusBrokerId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                    <tr>
                  <td class="criteria-label" style="width:100">Wash Account Id</td>
                  <td class="content">
                      <input id="washAccountId" name="washAccountId" value="${order.washAccountId!''}" class="gaf-ui-normal" style="width: 170px;"/>                                           
                                     </td>
                 </tr>
                                                                                                   
            </tbody>
        </table>
        <div class="gaf-ui-window-toolbar" style="margin-top:5px;">
<#if permission.checkFunctionPermitted("/order/update","POST")>
            <button type="submit" class="gafsubmitBtn">OK</button>
</#if>
            <button type="button" class="gafcancelBtn" onclick="$.gafwindow('close');">Cancel</button>
        </div>
    </div>
</div>
</form>
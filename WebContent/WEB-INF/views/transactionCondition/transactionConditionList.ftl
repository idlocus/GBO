<#import "/gaf/common.ftl" as common/>
<#import "/gaf/permission.ftl" as permission/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="decorator" content="decorator" />
  <@common.css_links/>
  <@common.js_links/>
  <script>
    var pageGrid;
    jQuery(function($){
      var lastSelRow;

      jqCreate=function(){
        var requestURL="${contextPath}/app/transactionCondition/create";
        $.gafwindow({'remoteURL':requestURL,'loadComplete':function(responseText,status,XMLHttpRequest){
            $(".gafdatebox").gafdatebox();
            $(".gafcombobox").gafcombobox({panelFloat:'float', panelFloatValue:'left'});
            $(".gafcancelBtn,.gafsubmitBtn").gafbuttons();
          
        },width:580,height:460,title:'Create TransactionCondition'});
      }
      
      jqDelete=function(id){
          if(!confirm("Are you sure to delete the selected records?"))
              return false;            
          var requestURL="${contextPath}/app/transactionCondition/delete/" + id;
          
          $.post(requestURL, function(data){
              if(data){
                alert(data);
              }
              pageGrid.trigger("reloadGrid");
          },'text');
          return false; 
      }
         
      jqEdit=jqDetail=function(id){
          var rowId = $("#pageGrid").jqGrid('getGridParam','selarrrow');
		  if(rowId.length > 1){
              alert("Please select just one record!");
              return;
          }
          var rowData = $("#pageGrid").getRowData(rowId);
          var id = rowData.entityId;           
          var requestURL="${contextPath}/app/transactionCondition/read/" + id;
         
         $.gafwindow({'remoteURL':requestURL,'loadComplete':function(responseText,status,XMLHttpRequest){
            $(".gafdatebox").gafdatebox();
            $(".gafcombobox").gafcombobox({panelFloat:'float', panelFloatValue:'left'});
            $(".gafcancelBtn,.gafsubmitBtn").gafbuttons();     
         },width:580,height:460,title:'Edit TransactionCondition'});
         return false;
      }
      
                                                                                                                                                                                                                                                                   
      settlementDateDataInit=function(el){
        var parent=$(el).parent();
        var comboxWidth = 100 - 30;
        $("<input name='settlementDate' class='gaf-ui-normal'></input>").appendTo(parent).gafdatebox({width:comboxWidth,onSelect:function(){
          pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
        }});
        $(el).remove();
      }
                                         
      tradingDateDataInit=function(el){
        var parent=$(el).parent();
        var comboxWidth = 100 - 30;
        $("<input name='tradingDate' class='gaf-ui-normal'></input>").appendTo(parent).gafdatebox({width:comboxWidth,onSelect:function(){
          pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
        }});
        $(el).remove();
      }
                                                                            
      transactionTimeDataInit=function(el){
        var parent=$(el).parent();
        var comboxWidth = 100 - 30;
        $("<input name='transactionTime' class='gaf-ui-normal'></input>").appendTo(parent).gafdatebox({width:comboxWidth,onSelect:function(){
          pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
        }});
        $(el).remove();
      }
                                                                
      pageGrid=$("#pageGrid").gafjqGrid({
          url:'${contextPath}/app/transactionCondition/load',
                    colNames:[ 'ID','Amount','Book Account Id','Child Record Id','Clearing Account Id','Clearing Broker Id','Condition Number','Condition Value','Dealer Id','External Record Id','Group Record Id','Internal Record Id','Introducer Account Id','Is Late Trade','Is Manual Crossing','Is Manual Fill','Is Odd Lot','Is Unsolicited','List Exchange Id','Parent Record Id','Price','Primary Account Id','Primary Account Location','Primary Broker Id','Product Id','Product Type','Quantity','Record Remark','Record Status','Root Record Id','Sales Id','Settlement Currency','Settlement Date','Side','Template Group Id','Trade Exchange Id','Trading Currency','Trading Date','Transaction Batch Id','Transaction Business Code','Transaction Business Line Id','Transaction Category','Transaction Channel','Transaction Feed Method','Transaction Id','Transaction Status','Transaction System','Transaction Time','Versus Account Id','Versus Account Location','Versus Broker Id','Wash Account Id','Version','InsertTime','CreatedBy','UpdatedBy','LastUpdateTime'],
          colModel :[
         {name:'entityId', index:'entityId', width:${widthMap.entityId!'50'},xmlmap:"entityId",fixed:true, hidden:${hiddenMap.entityId!'false'},editable: false,align:"center"},    
         
                {name:'amount', index:'amount', width:${widthMap.amount!'100'},xmlmap:"amount",fixed:true, hidden:${hiddenMap.amount!'false'}, editable: true,  align:"center"}, 
                      {name:'bookAccountId', index:'bookAccountId', width:${widthMap.bookAccountId!'100'},xmlmap:"bookAccountId",fixed:true, hidden:${hiddenMap.bookAccountId!'false'}, editable: true,  align:"left"}, 
                      {name:'childRecordId', index:'childRecordId', width:${widthMap.childRecordId!'100'},xmlmap:"childRecordId",fixed:true, hidden:${hiddenMap.childRecordId!'false'}, editable: true,  align:"left"}, 
                      {name:'clearingAccountId', index:'clearingAccountId', width:${widthMap.clearingAccountId!'100'},xmlmap:"clearingAccountId",fixed:true, hidden:${hiddenMap.clearingAccountId!'false'}, editable: true,  align:"left"}, 
                      {name:'clearingBrokerId', index:'clearingBrokerId', width:${widthMap.clearingBrokerId!'100'},xmlmap:"clearingBrokerId",fixed:true, hidden:${hiddenMap.clearingBrokerId!'false'}, editable: true,  align:"left"}, 
                      {name:'conditionNumber', index:'conditionNumber', width:${widthMap.conditionNumber!'100'},xmlmap:"conditionNumber",fixed:true, hidden:${hiddenMap.conditionNumber!'false'}, editable: true,  align:"left"}, 
                      {name:'conditionValue', index:'conditionValue', width:${widthMap.conditionValue!'100'},xmlmap:"conditionValue",fixed:true, hidden:${hiddenMap.conditionValue!'false'}, editable: true,  align:"left"}, 
                                  {name:'dealerId', index:'dealerId', width:${widthMap.dealerId!'100'},xmlmap:"dealerId",fixed:true, hidden:${hiddenMap.dealerId!'false'}, editable: true,  align:"left"}, 
                                  {name:'externalRecordId', index:'externalRecordId', width:${widthMap.externalRecordId!'100'},xmlmap:"externalRecordId",fixed:true, hidden:${hiddenMap.externalRecordId!'false'}, editable: true,  align:"left"}, 
                      {name:'groupRecordId', index:'groupRecordId', width:${widthMap.groupRecordId!'100'},xmlmap:"groupRecordId",fixed:true, hidden:${hiddenMap.groupRecordId!'false'}, editable: true,  align:"left"}, 
                                  {name:'internalRecordId', index:'internalRecordId', width:${widthMap.internalRecordId!'100'},xmlmap:"internalRecordId",fixed:true, hidden:${hiddenMap.internalRecordId!'false'}, editable: true,  align:"left"}, 
                      {name:'introducerAccountId', index:'introducerAccountId', width:${widthMap.introducerAccountId!'100'},xmlmap:"introducerAccountId",fixed:true, hidden:${hiddenMap.introducerAccountId!'false'}, editable: true,  align:"left"}, 
                      {name:'isLateTrade', index:'isLateTrade', width:${widthMap.isLateTrade!'100'},xmlmap:"isLateTrade",fixed:true, hidden:${hiddenMap.isLateTrade!'false'}, editable: true,  align:"center"}, 
                      {name:'isManualCrossing', index:'isManualCrossing', width:${widthMap.isManualCrossing!'100'},xmlmap:"isManualCrossing",fixed:true, hidden:${hiddenMap.isManualCrossing!'false'}, editable: true,  align:"center"}, 
                      {name:'isManualFill', index:'isManualFill', width:${widthMap.isManualFill!'100'},xmlmap:"isManualFill",fixed:true, hidden:${hiddenMap.isManualFill!'false'}, editable: true,  align:"center"}, 
                      {name:'isOddLot', index:'isOddLot', width:${widthMap.isOddLot!'100'},xmlmap:"isOddLot",fixed:true, hidden:${hiddenMap.isOddLot!'false'}, editable: true,  align:"center"}, 
                      {name:'isUnsolicited', index:'isUnsolicited', width:${widthMap.isUnsolicited!'100'},xmlmap:"isUnsolicited",fixed:true, hidden:${hiddenMap.isUnsolicited!'false'}, editable: true,  align:"center"}, 
                                  {name:'listExchangeId', index:'listExchangeId', width:${widthMap.listExchangeId!'100'},xmlmap:"listExchangeId",fixed:true, hidden:${hiddenMap.listExchangeId!'false'}, editable: true,  align:"left"}, 
                      {name:'parentRecordId', index:'parentRecordId', width:${widthMap.parentRecordId!'100'},xmlmap:"parentRecordId",fixed:true, hidden:${hiddenMap.parentRecordId!'false'}, editable: true,  align:"left"}, 
                      {name:'price', index:'price', width:${widthMap.price!'100'},xmlmap:"price",fixed:true, hidden:${hiddenMap.price!'false'}, editable: true,  align:"center"}, 
                      {name:'primaryAccountId', index:'primaryAccountId', width:${widthMap.primaryAccountId!'100'},xmlmap:"primaryAccountId",fixed:true, hidden:${hiddenMap.primaryAccountId!'false'}, editable: true,  align:"left"}, 
                      {name:'primaryAccountLocation', index:'primaryAccountLocation', width:${widthMap.primaryAccountLocation!'100'},xmlmap:"primaryAccountLocation",fixed:true, hidden:${hiddenMap.primaryAccountLocation!'false'}, editable: true,  align:"left"}, 
                      {name:'primaryBrokerId', index:'primaryBrokerId', width:${widthMap.primaryBrokerId!'100'},xmlmap:"primaryBrokerId",fixed:true, hidden:${hiddenMap.primaryBrokerId!'false'}, editable: true,  align:"left"}, 
                      {name:'productId', index:'productId', width:${widthMap.productId!'100'},xmlmap:"productId",fixed:true, hidden:${hiddenMap.productId!'false'}, editable: true,  align:"left"}, 
                      {name:'productType', index:'productType', width:${widthMap.productType!'100'},xmlmap:"productType",fixed:true, hidden:${hiddenMap.productType!'false'}, editable: true,  align:"left"}, 
                      {name:'quantity', index:'quantity', width:${widthMap.quantity!'100'},xmlmap:"quantity",fixed:true, hidden:${hiddenMap.quantity!'false'}, editable: true,  align:"center"}, 
                      {name:'recordRemark', index:'recordRemark', width:${widthMap.recordRemark!'100'},xmlmap:"recordRemark",fixed:true, hidden:${hiddenMap.recordRemark!'false'}, editable: true,  align:"left"}, 
                      {name:'recordStatus', index:'recordStatus', width:${widthMap.recordStatus!'100'},xmlmap:"recordStatus",fixed:true, hidden:${hiddenMap.recordStatus!'false'}, editable: true,  align:"left"}, 
                      {name:'rootRecordId', index:'rootRecordId', width:${widthMap.rootRecordId!'100'},xmlmap:"rootRecordId",fixed:true, hidden:${hiddenMap.rootRecordId!'false'}, editable: true,  align:"left"}, 
                      {name:'salesId', index:'salesId', width:${widthMap.salesId!'100'},xmlmap:"salesId",fixed:true, hidden:${hiddenMap.salesId!'false'}, editable: true,  align:"left"}, 
                      {name:'settlementCurrency', index:'settlementCurrency', width:${widthMap.settlementCurrency!'100'},xmlmap:"settlementCurrency",fixed:true, hidden:${hiddenMap.settlementCurrency!'false'}, editable: true,  align:"left"}, 
                      {name:'settlementDate', index:'settlementDate', width:${widthMap.settlementDate!'100'},xmlmap:"settlementDate",fixed:true, hidden:${hiddenMap.settlementDate!'false'}, editable: true, searchoptions:{dataInit:settlementDateDataInit}, align:"center"}, 
                      {name:'side', index:'side', width:${widthMap.side!'100'},xmlmap:"side",fixed:true, hidden:${hiddenMap.side!'false'}, editable: true,  align:"left"}, 
                      {name:'templateGroupId', index:'templateGroupId', width:${widthMap.templateGroupId!'100'},xmlmap:"templateGroupId",fixed:true, hidden:${hiddenMap.templateGroupId!'false'}, editable: true,  align:"left"}, 
                      {name:'tradeExchangeId', index:'tradeExchangeId', width:${widthMap.tradeExchangeId!'100'},xmlmap:"tradeExchangeId",fixed:true, hidden:${hiddenMap.tradeExchangeId!'false'}, editable: true,  align:"left"}, 
                      {name:'tradingCurrency', index:'tradingCurrency', width:${widthMap.tradingCurrency!'100'},xmlmap:"tradingCurrency",fixed:true, hidden:${hiddenMap.tradingCurrency!'false'}, editable: true,  align:"left"}, 
                      {name:'tradingDate', index:'tradingDate', width:${widthMap.tradingDate!'100'},xmlmap:"tradingDate",fixed:true, hidden:${hiddenMap.tradingDate!'false'}, editable: true, searchoptions:{dataInit:tradingDateDataInit}, align:"center"}, 
                      {name:'transactionBatchId', index:'transactionBatchId', width:${widthMap.transactionBatchId!'100'},xmlmap:"transactionBatchId",fixed:true, hidden:${hiddenMap.transactionBatchId!'false'}, editable: true,  align:"left"}, 
                      {name:'transactionBusinessCode', index:'transactionBusinessCode', width:${widthMap.transactionBusinessCode!'100'},xmlmap:"transactionBusinessCode",fixed:true, hidden:${hiddenMap.transactionBusinessCode!'false'}, editable: true,  align:"left"}, 
                      {name:'transactionBusinessLineId', index:'transactionBusinessLineId', width:${widthMap.transactionBusinessLineId!'100'},xmlmap:"transactionBusinessLineId",fixed:true, hidden:${hiddenMap.transactionBusinessLineId!'false'}, editable: true,  align:"left"}, 
                      {name:'transactionCategory', index:'transactionCategory', width:${widthMap.transactionCategory!'100'},xmlmap:"transactionCategory",fixed:true, hidden:${hiddenMap.transactionCategory!'false'}, editable: true,  align:"left"}, 
                      {name:'transactionChannel', index:'transactionChannel', width:${widthMap.transactionChannel!'100'},xmlmap:"transactionChannel",fixed:true, hidden:${hiddenMap.transactionChannel!'false'}, editable: true,  align:"left"}, 
                      {name:'transactionFeedMethod', index:'transactionFeedMethod', width:${widthMap.transactionFeedMethod!'100'},xmlmap:"transactionFeedMethod",fixed:true, hidden:${hiddenMap.transactionFeedMethod!'false'}, editable: true,  align:"left"}, 
                      {name:'transactionId', index:'transactionId', width:${widthMap.transactionId!'100'},xmlmap:"transactionId",fixed:true, hidden:${hiddenMap.transactionId!'false'}, editable: true,  align:"left"}, 
                      {name:'transactionStatus', index:'transactionStatus', width:${widthMap.transactionStatus!'100'},xmlmap:"transactionStatus",fixed:true, hidden:${hiddenMap.transactionStatus!'false'}, editable: true,  align:"left"}, 
                      {name:'transactionSystem', index:'transactionSystem', width:${widthMap.transactionSystem!'100'},xmlmap:"transactionSystem",fixed:true, hidden:${hiddenMap.transactionSystem!'false'}, editable: true,  align:"left"}, 
                      {name:'transactionTime', index:'transactionTime', width:${widthMap.transactionTime!'100'},xmlmap:"transactionTime",fixed:true, hidden:${hiddenMap.transactionTime!'false'}, editable: true, searchoptions:{dataInit:transactionTimeDataInit}, align:"center"}, 
                                              {name:'versusAccountId', index:'versusAccountId', width:${widthMap.versusAccountId!'100'},xmlmap:"versusAccountId",fixed:true, hidden:${hiddenMap.versusAccountId!'false'}, editable: true,  align:"left"}, 
                      {name:'versusAccountLocation', index:'versusAccountLocation', width:${widthMap.versusAccountLocation!'100'},xmlmap:"versusAccountLocation",fixed:true, hidden:${hiddenMap.versusAccountLocation!'false'}, editable: true,  align:"left"}, 
                      {name:'versusBrokerId', index:'versusBrokerId', width:${widthMap.versusBrokerId!'100'},xmlmap:"versusBrokerId",fixed:true, hidden:${hiddenMap.versusBrokerId!'false'}, editable: true,  align:"left"}, 
                      {name:'washAccountId', index:'washAccountId', width:${widthMap.washAccountId!'100'},xmlmap:"washAccountId",fixed:true, hidden:${hiddenMap.washAccountId!'false'}, editable: true,  align:"left"}, 
                  
         {name:'versionNumber', index:'versionNumber', width:100,xmlmap:"versionNumber",fixed:true,hidden:true, editable: true},            
         {name:'insertTime', index:'insertTime', width:100,xmlmap:"insertTime",fixed:true,hidden:true, editable: true}, 
         {name:'createdBy', index:'createdBy', width:100,xmlmap:"createdBy",fixed:true, hidden:true,editable: true}, 
         {name:'updatedBy', index:'updatedBy', width:100,xmlmap:"updatedBy",fixed:true, hidden:true,editable: true}, 
         {name:'lastUpdateTime', index:'lastUpdateTime', width:100,xmlmap:"lastUpdateTime",fixed:true, hidden:true,editable: true}
 
          ],
          
		  <#if !permission.checkFunctionPermitted("/transactionCondition/read/{?}","POST")>
          ondblClickRow: function() {},
          </#if>
		  
         navGrid : {
           <#if !permission.checkFunctionPermitted("/transactionCondition/create","POST")>add: false,</#if>
           <#if !permission.checkFunctionPermitted("/transactionCondition/read/{?}","POST")>edit: false,</#if>
           <#if !permission.checkFunctionPermitted("/transactionCondition/delete/{?}","POST")>del: false,</#if>
           refresh : false
		  } 

        }).gafjqGrid('filterToolbar');
		
		jQuery("#pageGrid").navButtonAdd('#jqPager',{
             caption:"Refresh", 
             buttonicon:"ui-icon-refresh", 
             onClickButton: function(){ 
                pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
             }, 
             position:"last"
         });
        
        $("#t_pageGrid").css("height","auto").append($("#customToolbar"));
        $("#resetBtn").button().click(function()
          {  
		     var currentMenuId = ${CURRENT_MENU_ID};
             if(currentMenuId){
                 var url="${contextPath}/app/transactionCondition/list" + "?menuId="+currentMenuId;  
                 location.href=url;
             } 
        });
        
        commitTransactionCondition=function(){
            var url="${contextPath}/app/transactionCondition/update";
            $.post(url,$("#transactionConditionInputForm").gafserialize(),function(data){
            if(data){
              alert(data);
              }else{
                $.gafwindow("close");
                pageGrid.trigger("reloadGrid");
                alert("Request sent successfully.");
                }
            },'text');
          return false;
        }
        
        
        $("#printBtn").button().click(function(){
            printJqTable('pageGrid','GAF Main Page');
        });    
        
        function printJqTable(gid,pgTitle){
            $('head').append('<style type="text/css">.prt-hide {display:none;}</style>');
            $('body').append('<div id="prt-container" class="prt-hide"></div>');
            
            $('#gview_'+gid).clone().appendTo('#prt-container').css({'page-break-after':'auto'});

            $('#prt-container div').remove('.ui-jqgrid-toppager,.ui-jqgrid-titlebar,.ui-jqgrid-pager');
            $('#prt-container div').remove('#t_'+gid);
            $('#prt-container thead tr').remove('.ui-search-toolbar');
            $('#prt-container tbody tr').remove('.jqgfirstrow');
            
            var t1=$('#prt-container thead'); 
            $('#prt-container tbody').before(t1.clone());
            t1.remove(); 
 
            $('#prt-container').printElement({leaveOpen:true,
                                printMode:'popup',  
                                pageTitle:pgTitle, overrideElementCSS:[{href:'${contextPath}/static/css/print-container.css', media:'print'}]});
            
            $('head style').remove();
            $('body #prt-container').remove();
        }
        
       $("#exportBtn").button()
         .click(function(){
            var columnNamesAll=new Array();
            columnNamesAll=jQuery("#pageGrid").jqGrid('getGridParam','colNames');
            var columnArray=jQuery("#pageGrid").jqGrid('getGridParam','colModel');
            var columnNames=new Array();
            var colNames=new Array();
            var jj=0;
            var ii=0;
            for(var j=2; j<=(columnArray.length-1); j++){
              if(!columnArray[j].hidden){
                columnNames[jj++]=columnNamesAll[j];
                colNames[ii++]=columnArray[j].name;
              }               
            }
                             
            var exportArray=new Array();
            exportArray=jQuery("#pageGrid").getDataIDs();
                   
            var exportData="";
            for(var k=0;k<columnNames.length-1;k++)
              {
                exportData=exportData+columnNames[k]+",";
              }
            exportData=exportData+columnNames[columnNames.length-1];
            exportData=exportData+"\r\n";
              
            for(var i=0;i<exportArray.length;i++)
              {
                var exportRowData=jQuery("#pageGrid").getRowData(exportArray[i]);
                for(var j=0;j<colNames.length-1;j++)
                  {
                    var colDataTmp=exportRowData[colNames[j]];
                    var colData="\""+colDataTmp+"\"";
                    exportData=exportData+colData+",";
                  }
                var colDataTmpLast=exportRowData[colNames[colNames.length-1]];
                var colDataLast="\""+colDataTmpLast+"\"";
                exportData=exportData+colDataLast;
                exportData=exportData+"\r\n";
              }
            exportData=exportData+"\r\n";        

            document.exportForm.dataName.value="TransactionCondition";
            document.exportForm.exportData.value=exportData;
            document.exportForm.method='POST';
            document.exportForm.action='${contextPath}/app/transactionCondition/export2Csv';
            document.exportForm.target='_blank';
            document.exportForm.submit();      
       });
      $("#importBtn").button().click(function(){
        var currentMenuId = ${CURRENT_MENU_ID};
  		$.gafwindow({'remoteURL':"${contextPath}/app/transactionCondition/upload?menuId="+currentMenuId,'loadComplete':function(responseText,status,XMLHttpRequest){
         },width:560,height:300,title:'Import Excel'});
       });            
    
       
    
     $("#saveColWidthBtn").button()
         .click(function(){
             var colModel = $("#pageGrid").jqGrid('getGridParam','colModel');
             var colArray = new Array();
             for (var i = 0; i < colModel.length; i++) {
                if(colModel[i].name != 'rn' && colModel[i].name != 'cb')
                   colArray.push({ name:colModel[i].name, width:colModel[i].width, hidden:colModel[i].hidden });
             }

             var username = '${principalName!''}';
             if(username == '') {
                alert('Only login user can save the settings, please login first!');
                return;
             }
             var columnWidth = JSON.stringify(colArray);
             var url="${contextPath}/app/transactionCondition/saveGridSetting";
             $.post(url,{user : username, colWidth : columnWidth},function(data){
                if(data){
                   alert(data);
                }else{
                   alert("Save Column Width Successfully!");
                }
             }, 'text');
     });
     
      $("#colOrderBtn").button()
         .click(function(){
             pageGrid.jqGrid('columnChooser', {
               done : function(perm) {
                 if (perm) {
                    pageGrid.jqGrid("remapColumns", perm, true);
                    
                    var colModel = $("#pageGrid").jqGrid('getGridParam','colModel');
                    var colArray = new Array();
                    for (var i = 0; i < colModel.length; i++) {
                        if(colModel[i].name != 'rn' && colModel[i].name != 'cb')
                        colArray.push({ name:colModel[i].name, width:colModel[i].width, hidden:colModel[i].hidden });
                    }
                    var columnWidth = JSON.stringify(colArray);
                    
                    var username = '${principalName!''}';
                    var columnSeq = JSON.stringify(perm);
                    if(username == '') {
                       alert('Only login user can save the settings, please login first!');
                       return;
                    }
                    
                    var url="${contextPath}/app/transactionCondition/saveGridSetting";
                    $.post(url,{ user : username, colSeq : columnSeq, colWidth : columnWidth });
                    
                 } else { 
                    // we can do some action in case of "Cancel" button clicked
                 }
               }
             });
       });
       
      $("#colResetBtn").button()
         .click(function(){        
             var username = '${principalName!''}';
             if(username == '') {
                alert('Only login user can reset the settings, please login first!');
                return;
             }

			 var currentMenuId = ${CURRENT_MENU_ID};
             if(currentMenuId){
                var url="${contextPath}/app/transactionCondition/deleteGridSetting" + "?menuId="+currentMenuId;  
                location.href=url;
             }
       });
        
        var cloumnSeq = eval(${colSeq!''});
        if(cloumnSeq != undefined && cloumnSeq != '')
          pageGrid.jqGrid("remapColumns", cloumnSeq, true); 
          
     });
  </script>
</head>
<body>
<form class="main">
<table id="pageGrid"></table>
<div id="jqPager"></div>

<div id="customToolbar">
<div id="toolbarLeft" style="float:left;text-align:right;">
</div>
<div id="toolbarRight" style="float:right;text-align:right;">
  <button type="button" id="resetBtn" title="To reset the query condition in the filterbar">Reset</button>
  |
  <button type="button" id="printBtn">Print</button>
  |
  <#if permission.checkFunctionPermitted("/transactionCondition/export2Csv","POST")>
  <button type="button" id="exportBtn" title="To export the data in current table to CVS file">Export</button>
  |
  </#if>
  <button type="button" id="importBtn" title="To import the data in CVS to current table">Import</button>
  <button type="button" id="saveColWidthBtn" title="To save the width of the column in this table">Col Width</button>
  <button type="button" id="colOrderBtn" title="To set the column presentation (order and visibility) of this table">Column</button>
  <button type="button" id="colResetBtn"title="To clear the column properties, including column width,order and visibility">Col Reset</button>
</div>
</div>

</form>

<form name="exportForm">
  <input type="hidden" name="dataName">
  <input type="hidden" name="exportData">
</form>
</body>
</html>
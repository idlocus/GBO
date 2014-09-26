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
        var requestURL="${contextPath}/app/figurationDefinition/create";
        $.gafwindow({'remoteURL':requestURL,'loadComplete':function(responseText,status,XMLHttpRequest){
            $(".gafdatebox").gafdatebox();
            $(".gafcombobox").gafcombobox({panelFloat:'float', panelFloatValue:'left'});
            $(".gafcancelBtn,.gafsubmitBtn").gafbuttons();
          
        },width:580,height:460,title:'Create FigurationDefinition'});
      }
      
      jqDelete=function(id){
          if(!confirm("Are you sure to delete the selected records?"))
              return false;            
          var requestURL="${contextPath}/app/figurationDefinition/delete/" + id;
          
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
          var requestURL="${contextPath}/app/figurationDefinition/read/" + id;
         
         $.gafwindow({'remoteURL':requestURL,'loadComplete':function(responseText,status,XMLHttpRequest){
            $(".gafdatebox").gafdatebox();
            $(".gafcombobox").gafcombobox({panelFloat:'float', panelFloatValue:'left'});
            $(".gafcancelBtn,.gafsubmitBtn").gafbuttons();     
         },width:580,height:460,title:'Edit FigurationDefinition'});
         return false;
      }
      
                                                                                                                                                                                                                                                                                                                                                                                     
      pageGrid=$("#pageGrid").gafjqGrid({
          url:'${contextPath}/app/figurationDefinition/load',
                    colNames:[ 'ID','Account Category','Account Id','Account Location','Account Owner Type','Account Type','Business Strategy','Child Record Id','Discount Amount','External Record Id','Fee Code','Fee Id','Figuration Base','Figuration Base Unit','Figuration Base Value','Figuration Definition Id','Figuration Precision','Figuration Rate','Group Record Id','Internal Record Id','Is Enable','List Exchange Id','Lower Limit','Max Amount','Measurement','Measurement Value','Min Amount','Order Location','Parent Record Id','Priority','Product Id','Product Type','Record Remark','Record Status','Root Record Id','Rounding Rule','Sales Id','Settlement Currency Id','Side','Trade Currency Id','Trade Exchange Id','Trader Id','Transaction Channel','Transaction Management System','Upper Limit','Version','InsertTime','CreatedBy','UpdatedBy','LastUpdateTime'],
          colModel :[
         {name:'entityId', index:'entityId', width:${widthMap.entityId!'50'},xmlmap:"entityId",fixed:true, hidden:${hiddenMap.entityId!'false'},editable: false,align:"center"},    
         
                {name:'accountCategory', index:'accountCategory', width:${widthMap.accountCategory!'100'},xmlmap:"accountCategory",fixed:true, hidden:${hiddenMap.accountCategory!'false'}, editable: true,  align:"left"}, 
                      {name:'accountId', index:'accountId', width:${widthMap.accountId!'100'},xmlmap:"accountId",fixed:true, hidden:${hiddenMap.accountId!'false'}, editable: true,  align:"left"}, 
                      {name:'accountLocation', index:'accountLocation', width:${widthMap.accountLocation!'100'},xmlmap:"accountLocation",fixed:true, hidden:${hiddenMap.accountLocation!'false'}, editable: true,  align:"left"}, 
                      {name:'accountOwnerType', index:'accountOwnerType', width:${widthMap.accountOwnerType!'100'},xmlmap:"accountOwnerType",fixed:true, hidden:${hiddenMap.accountOwnerType!'false'}, editable: true,  align:"left"}, 
                      {name:'accountType', index:'accountType', width:${widthMap.accountType!'100'},xmlmap:"accountType",fixed:true, hidden:${hiddenMap.accountType!'false'}, editable: true,  align:"left"}, 
                      {name:'businessStrategy', index:'businessStrategy', width:${widthMap.businessStrategy!'100'},xmlmap:"businessStrategy",fixed:true, hidden:${hiddenMap.businessStrategy!'false'}, editable: true,  align:"left"}, 
                      {name:'childRecordId', index:'childRecordId', width:${widthMap.childRecordId!'100'},xmlmap:"childRecordId",fixed:true, hidden:${hiddenMap.childRecordId!'false'}, editable: true,  align:"left"}, 
                                  {name:'discountAmount', index:'discountAmount', width:${widthMap.discountAmount!'100'},xmlmap:"discountAmount",fixed:true, hidden:${hiddenMap.discountAmount!'false'}, editable: true,  align:"center"}, 
                                  {name:'externalRecordId', index:'externalRecordId', width:${widthMap.externalRecordId!'100'},xmlmap:"externalRecordId",fixed:true, hidden:${hiddenMap.externalRecordId!'false'}, editable: true,  align:"left"}, 
                      {name:'feeCode', index:'feeCode', width:${widthMap.feeCode!'100'},xmlmap:"feeCode",fixed:true, hidden:${hiddenMap.feeCode!'false'}, editable: true,  align:"left"}, 
                      {name:'feeId', index:'feeId', width:${widthMap.feeId!'100'},xmlmap:"feeId",fixed:true, hidden:${hiddenMap.feeId!'false'}, editable: true,  align:"left"}, 
                      {name:'figurationBase', index:'figurationBase', width:${widthMap.figurationBase!'100'},xmlmap:"figurationBase",fixed:true, hidden:${hiddenMap.figurationBase!'false'}, editable: true,  align:"left"}, 
                      {name:'figurationBaseUnit', index:'figurationBaseUnit', width:${widthMap.figurationBaseUnit!'100'},xmlmap:"figurationBaseUnit",fixed:true, hidden:${hiddenMap.figurationBaseUnit!'false'}, editable: true,  align:"center"}, 
                      {name:'figurationBaseValue', index:'figurationBaseValue', width:${widthMap.figurationBaseValue!'100'},xmlmap:"figurationBaseValue",fixed:true, hidden:${hiddenMap.figurationBaseValue!'false'}, editable: true,  align:"center"}, 
                      {name:'figurationDefinitionId', index:'figurationDefinitionId', width:${widthMap.figurationDefinitionId!'100'},xmlmap:"figurationDefinitionId",fixed:true, hidden:${hiddenMap.figurationDefinitionId!'false'}, editable: true,  align:"left"}, 
                      {name:'figurationPrecision', index:'figurationPrecision', width:${widthMap.figurationPrecision!'100'},xmlmap:"figurationPrecision",fixed:true, hidden:${hiddenMap.figurationPrecision!'false'}, editable: true,  align:"center"}, 
                      {name:'figurationRate', index:'figurationRate', width:${widthMap.figurationRate!'100'},xmlmap:"figurationRate",fixed:true, hidden:${hiddenMap.figurationRate!'false'}, editable: true,  align:"center"}, 
                      {name:'groupRecordId', index:'groupRecordId', width:${widthMap.groupRecordId!'100'},xmlmap:"groupRecordId",fixed:true, hidden:${hiddenMap.groupRecordId!'false'}, editable: true,  align:"left"}, 
                                  {name:'internalRecordId', index:'internalRecordId', width:${widthMap.internalRecordId!'100'},xmlmap:"internalRecordId",fixed:true, hidden:${hiddenMap.internalRecordId!'false'}, editable: true,  align:"left"}, 
                      {name:'isEnable', index:'isEnable', width:${widthMap.isEnable!'100'},xmlmap:"isEnable",fixed:true, hidden:${hiddenMap.isEnable!'false'}, editable: true,  align:"center"}, 
                                  {name:'listExchangeId', index:'listExchangeId', width:${widthMap.listExchangeId!'100'},xmlmap:"listExchangeId",fixed:true, hidden:${hiddenMap.listExchangeId!'false'}, editable: true,  align:"left"}, 
                      {name:'lowerLimit', index:'lowerLimit', width:${widthMap.lowerLimit!'100'},xmlmap:"lowerLimit",fixed:true, hidden:${hiddenMap.lowerLimit!'false'}, editable: true,  align:"center"}, 
                      {name:'maxAmount', index:'maxAmount', width:${widthMap.maxAmount!'100'},xmlmap:"maxAmount",fixed:true, hidden:${hiddenMap.maxAmount!'false'}, editable: true,  align:"center"}, 
                      {name:'measurement', index:'measurement', width:${widthMap.measurement!'100'},xmlmap:"measurement",fixed:true, hidden:${hiddenMap.measurement!'false'}, editable: true,  align:"left"}, 
                      {name:'measurementValue', index:'measurementValue', width:${widthMap.measurementValue!'100'},xmlmap:"measurementValue",fixed:true, hidden:${hiddenMap.measurementValue!'false'}, editable: true,  align:"center"}, 
                      {name:'minAmount', index:'minAmount', width:${widthMap.minAmount!'100'},xmlmap:"minAmount",fixed:true, hidden:${hiddenMap.minAmount!'false'}, editable: true,  align:"center"}, 
                      {name:'orderLocation', index:'orderLocation', width:${widthMap.orderLocation!'100'},xmlmap:"orderLocation",fixed:true, hidden:${hiddenMap.orderLocation!'false'}, editable: true,  align:"left"}, 
                      {name:'parentRecordId', index:'parentRecordId', width:${widthMap.parentRecordId!'100'},xmlmap:"parentRecordId",fixed:true, hidden:${hiddenMap.parentRecordId!'false'}, editable: true,  align:"left"}, 
                      {name:'priority', index:'priority', width:${widthMap.priority!'100'},xmlmap:"priority",fixed:true, hidden:${hiddenMap.priority!'false'}, editable: true,  align:"center"}, 
                      {name:'productId', index:'productId', width:${widthMap.productId!'100'},xmlmap:"productId",fixed:true, hidden:${hiddenMap.productId!'false'}, editable: true,  align:"left"}, 
                      {name:'productType', index:'productType', width:${widthMap.productType!'100'},xmlmap:"productType",fixed:true, hidden:${hiddenMap.productType!'false'}, editable: true,  align:"left"}, 
                      {name:'recordRemark', index:'recordRemark', width:${widthMap.recordRemark!'100'},xmlmap:"recordRemark",fixed:true, hidden:${hiddenMap.recordRemark!'false'}, editable: true,  align:"left"}, 
                      {name:'recordStatus', index:'recordStatus', width:${widthMap.recordStatus!'100'},xmlmap:"recordStatus",fixed:true, hidden:${hiddenMap.recordStatus!'false'}, editable: true,  align:"left"}, 
                      {name:'rootRecordId', index:'rootRecordId', width:${widthMap.rootRecordId!'100'},xmlmap:"rootRecordId",fixed:true, hidden:${hiddenMap.rootRecordId!'false'}, editable: true,  align:"left"}, 
                      {name:'roundingRule', index:'roundingRule', width:${widthMap.roundingRule!'100'},xmlmap:"roundingRule",fixed:true, hidden:${hiddenMap.roundingRule!'false'}, editable: true,  align:"left"}, 
                      {name:'salesId', index:'salesId', width:${widthMap.salesId!'100'},xmlmap:"salesId",fixed:true, hidden:${hiddenMap.salesId!'false'}, editable: true,  align:"left"}, 
                      {name:'settlementCurrencyId', index:'settlementCurrencyId', width:${widthMap.settlementCurrencyId!'100'},xmlmap:"settlementCurrencyId",fixed:true, hidden:${hiddenMap.settlementCurrencyId!'false'}, editable: true,  align:"left"}, 
                      {name:'side', index:'side', width:${widthMap.side!'100'},xmlmap:"side",fixed:true, hidden:${hiddenMap.side!'false'}, editable: true,  align:"left"}, 
                      {name:'tradeCurrencyId', index:'tradeCurrencyId', width:${widthMap.tradeCurrencyId!'100'},xmlmap:"tradeCurrencyId",fixed:true, hidden:${hiddenMap.tradeCurrencyId!'false'}, editable: true,  align:"left"}, 
                      {name:'tradeExchangeId', index:'tradeExchangeId', width:${widthMap.tradeExchangeId!'100'},xmlmap:"tradeExchangeId",fixed:true, hidden:${hiddenMap.tradeExchangeId!'false'}, editable: true,  align:"left"}, 
                      {name:'traderId', index:'traderId', width:${widthMap.traderId!'100'},xmlmap:"traderId",fixed:true, hidden:${hiddenMap.traderId!'false'}, editable: true,  align:"left"}, 
                      {name:'transactionChannel', index:'transactionChannel', width:${widthMap.transactionChannel!'100'},xmlmap:"transactionChannel",fixed:true, hidden:${hiddenMap.transactionChannel!'false'}, editable: true,  align:"left"}, 
                      {name:'transactionManagementSystem', index:'transactionManagementSystem', width:${widthMap.transactionManagementSystem!'100'},xmlmap:"transactionManagementSystem",fixed:true, hidden:${hiddenMap.transactionManagementSystem!'false'}, editable: true,  align:"left"}, 
                                  {name:'upperLimit', index:'upperLimit', width:${widthMap.upperLimit!'100'},xmlmap:"upperLimit",fixed:true, hidden:${hiddenMap.upperLimit!'false'}, editable: true,  align:"center"}, 
                              
         {name:'versionNumber', index:'versionNumber', width:100,xmlmap:"versionNumber",fixed:true,hidden:true, editable: true},            
         {name:'insertTime', index:'insertTime', width:100,xmlmap:"insertTime",fixed:true,hidden:true, editable: true}, 
         {name:'createdBy', index:'createdBy', width:100,xmlmap:"createdBy",fixed:true, hidden:true,editable: true}, 
         {name:'updatedBy', index:'updatedBy', width:100,xmlmap:"updatedBy",fixed:true, hidden:true,editable: true}, 
         {name:'lastUpdateTime', index:'lastUpdateTime', width:100,xmlmap:"lastUpdateTime",fixed:true, hidden:true,editable: true}
 
          ],
          
		  <#if !permission.checkFunctionPermitted("/figurationDefinition/read/{?}","POST")>
          ondblClickRow: function() {},
          </#if>
		  
         navGrid : {
           <#if !permission.checkFunctionPermitted("/figurationDefinition/create","POST")>add: false,</#if>
           <#if !permission.checkFunctionPermitted("/figurationDefinition/read/{?}","POST")>edit: false,</#if>
           <#if !permission.checkFunctionPermitted("/figurationDefinition/delete/{?}","POST")>del: false,</#if>
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
                 var url="${contextPath}/app/figurationDefinition/list" + "?menuId="+currentMenuId;  
                 location.href=url;
             } 
        });
        
        commitFigurationDefinition=function(){
            var url="${contextPath}/app/figurationDefinition/update";
            $.post(url,$("#figurationDefinitionInputForm").gafserialize(),function(data){
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

            document.exportForm.dataName.value="FigurationDefinition";
            document.exportForm.exportData.value=exportData;
            document.exportForm.method='POST';
            document.exportForm.action='${contextPath}/app/figurationDefinition/export2Csv';
            document.exportForm.target='_blank';
            document.exportForm.submit();      
       });
      $("#importBtn").button().click(function(){
        var currentMenuId = ${CURRENT_MENU_ID};
  		$.gafwindow({'remoteURL':"${contextPath}/app/figurationDefinition/upload?menuId="+currentMenuId,'loadComplete':function(responseText,status,XMLHttpRequest){
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
             var url="${contextPath}/app/figurationDefinition/saveGridSetting";
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
                    
                    var url="${contextPath}/app/figurationDefinition/saveGridSetting";
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
                var url="${contextPath}/app/figurationDefinition/deleteGridSetting" + "?menuId="+currentMenuId;  
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
  <#if permission.checkFunctionPermitted("/figurationDefinition/export2Csv","POST")>
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
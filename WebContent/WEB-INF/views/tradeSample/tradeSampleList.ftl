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
        var requestURL="${contextPath}/app/tradeSample/create";
        $.gafwindow({'remoteURL':requestURL,'loadComplete':function(responseText,status,XMLHttpRequest){
            $(".gafdatebox").gafdatebox();
            $(".gafcombobox").gafcombobox({panelFloat:'float', panelFloatValue:'left'});
            $("#client").gafcomboRemotebox({dataUrl:'${contextPath}/app/datadictionary?tableName=t_account_sample&keyColumnName=account_id&valueColumnName=account_code&maxRows=20', minLength:'1', maxRows:'20', panelFloat:'float', panelFloatValue:'left'});
            $(".gafcancelBtn,.gafsubmitBtn").gafbuttons();
          
        },width:580,height:460,title:'Create TradeSample'});
      }
      
      jqDelete=function(id){
          if(!confirm("Are you sure to delete the selected records?"))
              return false;            
          var requestURL="${contextPath}/app/tradeSample/delete/" + id;
          
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
          var requestURL="${contextPath}/app/tradeSample/read/" + id;
         
         $.gafwindow({'remoteURL':requestURL,'loadComplete':function(responseText,status,XMLHttpRequest){
            $(".gafdatebox").gafdatebox();
            $(".gafcombobox").gafcombobox({panelFloat:'float', panelFloatValue:'left'});
            $("#client").gafcomboRemotebox({dataUrl:'${contextPath}/app/datadictionary?tableName=t_account_sample&keyColumnName=account_id&valueColumnName=account_code&maxRows=20', minLength:'1', maxRows:'20', panelFloat:'float', panelFloatValue:'left'});
            $(".gafcancelBtn,.gafsubmitBtn").gafbuttons();     
         },width:580,height:460,title:'Edit TradeSample'});
         return false;
      }
      
               
	  clientDataInit=function(el){
        var temp=$("#gs_client");
        $(el).parent().empty().append(temp);
        var comboxWidth = 100 - 30;
        temp.gafcomboRemotebox({width:comboxWidth,dataUrl:'${contextPath}/app/datadictionary?tableName=t_account_sample&keyColumnName=account_id&valueColumnName=account_code&maxRows=20', minLength:'1', maxRows:'20',
        selected:function(){
          pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
        }});
      }
                          
       currencyDataInit=function(el){
        var temp=$("#gs_currency");
        $(el).parent().empty().append(temp);
        var comboxWidth = 100 - 30;
        temp.gafcombobox({width:comboxWidth,selected:function(){
          pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
        }});
      }
                          
       industrySectorDataInit=function(el){
        var temp=$("#gs_industrySector");
        $(el).parent().empty().append(temp);
        var comboxWidth = 100 - 30;
        temp.gafcombobox({width:comboxWidth,selected:function(){
          pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
        }});
      }
                          
       instrumentTypeDataInit=function(el){
        var temp=$("#gs_instrumentType");
        $(el).parent().empty().append(temp);
        var comboxWidth = 100 - 30;
        temp.gafcombobox({width:comboxWidth,selected:function(){
          pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
        }});
      }
                          
       marketDataInit=function(el){
        var temp=$("#gs_market");
        $(el).parent().empty().append(temp);
        var comboxWidth = 100 - 30;
        temp.gafcombobox({width:comboxWidth,selected:function(){
          pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
        }});
      }
                                        
      settlementDateDataInit=function(el){
        var parent=$(el).parent();
        var comboxWidth = 100 - 30;
        $("<input name='settlementDate' class='gaf-ui-normal'></input>").appendTo(parent).gafdatebox({width:comboxWidth,onSelect:function(){
          pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
        }});
        $(el).remove();
      }
             
       sideDataInit=function(el){
        var temp=$("#gs_side");
        $(el).parent().empty().append(temp);
        var comboxWidth = 100 - 30;
        temp.gafcombobox({width:comboxWidth,selected:function(){
          pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
        }});
      }
                          
      tradeDateDataInit=function(el){
        var parent=$(el).parent();
        var comboxWidth = 100 - 30;
        $("<input name='tradeDate' class='gaf-ui-normal'></input>").appendTo(parent).gafdatebox({width:comboxWidth,onSelect:function(){
          pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
        }});
        $(el).remove();
      }
                                    
      pageGrid=$("#pageGrid").gafjqGrid({
          url:'${contextPath}/app/tradeSample/load',
                    colNames:[ 'ID','Amount','Client','Currency','Industry Sector','Instrument Type','Market','Price','Qty','Remark','Settlement Date','Side','Symbol','Trade Date','Version','InsertTime','CreatedBy','UpdatedBy','LastUpdateTime'],
          colModel :[
         {name:'entityId', index:'entityId', width:${widthMap.entityId!'50'},xmlmap:"entityId",fixed:true, hidden:${hiddenMap.entityId!'false'},editable: false,align:"center"},    
         
                {name:'amount', index:'amount', width:${widthMap.amount!'100'},xmlmap:"amount",fixed:true, hidden:${hiddenMap.amount!'false'}, editable: true,  align:"right"}, 
                      {name:'client', index:'client', width:${widthMap.client!'100'},xmlmap:"client",fixed:true, hidden:${hiddenMap.client!'false'}, editable: true, searchoptions:{dataInit:clientDataInit}, align:"left"}, 
                                  {name:'currency', index:'currency', width:${widthMap.currency!'100'},xmlmap:"currency",fixed:true, hidden:${hiddenMap.currency!'false'}, editable: true, searchoptions:{dataInit:currencyDataInit}, align:"left"}, 
                                  {name:'industrySector', index:'industrySector', width:${widthMap.industrySector!'100'},xmlmap:"industrySector",fixed:true, hidden:${hiddenMap.industrySector!'false'}, editable: true, searchoptions:{dataInit:industrySectorDataInit}, align:"left"}, 
                                  {name:'instrumentType', index:'instrumentType', width:${widthMap.instrumentType!'100'},xmlmap:"instrumentType",fixed:true, hidden:${hiddenMap.instrumentType!'false'}, editable: true, searchoptions:{dataInit:instrumentTypeDataInit}, align:"left"}, 
                                  {name:'market', index:'market', width:${widthMap.market!'100'},xmlmap:"market",fixed:true, hidden:${hiddenMap.market!'false'}, editable: true, searchoptions:{dataInit:marketDataInit}, align:"left"}, 
                      {name:'price', index:'price', width:${widthMap.price!'100'},xmlmap:"price",fixed:true, hidden:${hiddenMap.price!'false'}, editable: true,  align:"right"}, 
                      {name:'qty', index:'qty', width:${widthMap.qty!'100'},xmlmap:"qty",fixed:true, hidden:${hiddenMap.qty!'false'}, editable: true,  align:"center"}, 
                      {name:'remark', index:'remark', width:${widthMap.remark!'100'},xmlmap:"remark",fixed:true, hidden:${hiddenMap.remark!'false'}, editable: true,  align:"left"}, 
                      {name:'settlementDate', index:'settlementDate', width:${widthMap.settlementDate!'100'},xmlmap:"settlementDate",fixed:true, hidden:${hiddenMap.settlementDate!'false'}, editable: true, searchoptions:{dataInit:settlementDateDataInit}, align:"center"}, 
                      {name:'side', index:'side', width:${widthMap.side!'100'},xmlmap:"side",fixed:true, hidden:${hiddenMap.side!'false'}, editable: true, searchoptions:{dataInit:sideDataInit}, align:"left"}, 
                      {name:'symbol', index:'symbol', width:${widthMap.symbol!'100'},xmlmap:"symbol",fixed:true, hidden:${hiddenMap.symbol!'false'}, editable: true,  align:"left"}, 
                      {name:'tradeDate', index:'tradeDate', width:${widthMap.tradeDate!'100'},xmlmap:"tradeDate",fixed:true, hidden:${hiddenMap.tradeDate!'false'}, editable: true, searchoptions:{dataInit:tradeDateDataInit}, align:"center"}, 
                                          
         {name:'versionNumber', index:'versionNumber', width:100,xmlmap:"versionNumber",fixed:true,hidden:true, editable: true},            
         {name:'insertTime', index:'insertTime', width:100,xmlmap:"insertTime",fixed:true,hidden:true, editable: true}, 
         {name:'createdBy', index:'createdBy', width:100,xmlmap:"createdBy",fixed:true, hidden:true,editable: true}, 
         {name:'updatedBy', index:'updatedBy', width:100,xmlmap:"updatedBy",fixed:true, hidden:true,editable: true}, 
         {name:'lastUpdateTime', index:'lastUpdateTime', width:100,xmlmap:"lastUpdateTime",fixed:true, hidden:true,editable: true}
 
          ],
          
		  <#if !permission.checkFunctionPermitted("/tradeSample/read/{?}","POST")>
          ondblClickRow: function() {},
          </#if>
		  
         navGrid : {
           <#if !permission.checkFunctionPermitted("/tradeSample/create","POST")>add: false,</#if>
           <#if !permission.checkFunctionPermitted("/tradeSample/read/{?}","POST")>edit: false,</#if>
           <#if !permission.checkFunctionPermitted("/tradeSample/delete/{?}","POST")>del: false,</#if>
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
                 var url="${contextPath}/app/tradeSample/list" + "?menuId="+currentMenuId;  
                 location.href=url;
             } 
        });
        
        commitTradeSample=function(){
            var url="${contextPath}/app/tradeSample/update";
            $.post(url,$("#tradeSampleInputForm").gafserialize(),function(data){
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

            document.exportForm.dataName.value="TradeSample";
            document.exportForm.exportData.value=exportData;
            document.exportForm.method='POST';
            document.exportForm.action='${contextPath}/app/tradeSample/export2Csv';
            document.exportForm.target='_blank';
            document.exportForm.submit();      
       });
      $("#importBtn").button().click(function(){
        var currentMenuId = ${CURRENT_MENU_ID};
  		$.gafwindow({'remoteURL':"${contextPath}/app/tradeSample/upload?menuId="+currentMenuId,'loadComplete':function(responseText,status,XMLHttpRequest){
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
             var url="${contextPath}/app/tradeSample/saveGridSetting";
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
                    
                    var url="${contextPath}/app/tradeSample/saveGridSetting";
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
                var url="${contextPath}/app/tradeSample/deleteGridSetting" + "?menuId="+currentMenuId;  
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
  <#if permission.checkFunctionPermitted("/tradeSample/export2Csv","POST")>
  <button type="button" id="exportBtn" title="To export the data in current table to CVS file">Export</button>
  |
  </#if>
  <button type="button" id="importBtn" title="To import the data in CVS to current table">Import</button>
  <button type="button" id="saveColWidthBtn" title="To save the width of the column in this table">Col Width</button>
  <button type="button" id="colOrderBtn" title="To set the column presentation (order and visibility) of this table">Column</button>
  <button type="button" id="colResetBtn"title="To clear the column properties, including column width,order and visibility">Col Reset</button>
</div>
</div>
    <input id="gs_client" name="client"></input>
	  <select id="gs_currency" name="currency">
	   <#list currencyMap?keys as key>
          <option value ="${currencyMap[key]}">${key}</option>
       </#list>
      </select>
	  <select id="gs_industrySector" name="industrySector">
	   <#list industrySectorMap?keys as key>
          <option value ="${industrySectorMap[key]}">${key}</option>
       </#list>
      </select>
	  <select id="gs_instrumentType" name="instrumentType">
	   <#list instrumentTypeMap?keys as key>
          <option value ="${instrumentTypeMap[key]}">${key}</option>
       </#list>
      </select>
	  <select id="gs_market" name="market">
	   <#list marketMap?keys as key>
          <option value ="${marketMap[key]}">${key}</option>
       </#list>
      </select>
	  <select id="gs_side" name="side">
	   <#list sideMap?keys as key>
          <option value ="${sideMap[key]}">${key}</option>
       </#list>
      </select>

</form>

<form name="exportForm">
  <input type="hidden" name="dataName">
  <input type="hidden" name="exportData">
</form>
</body>
</html>
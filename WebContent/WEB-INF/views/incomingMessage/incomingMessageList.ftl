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
        var requestURL="${contextPath}/app/incomingMessage/create";
        $.gafwindow({'remoteURL':requestURL,'loadComplete':function(responseText,status,XMLHttpRequest){
            $(".gafdatebox").gafdatebox();
            $(".gafcombobox").gafcombobox({panelFloat:'float', panelFloatValue:'left'});
            $(".gafcancelBtn,.gafsubmitBtn").gafbuttons();
          
        },width:580,height:460,title:'Create IncomingMessage'});
      }
      
      jqDelete=function(id){
          if(!confirm("Are you sure to delete the selected records?"))
              return false;            
          var requestURL="${contextPath}/app/incomingMessage/delete/" + id;
          
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
          var requestURL="${contextPath}/app/incomingMessage/read/" + id;
         
         $.gafwindow({'remoteURL':requestURL,'loadComplete':function(responseText,status,XMLHttpRequest){
            $(".gafdatebox").gafdatebox();
            $(".gafcombobox").gafcombobox({panelFloat:'float', panelFloatValue:'left'});
            $(".gafcancelBtn,.gafsubmitBtn").gafbuttons();     
         },width:580,height:460,title:'Edit IncomingMessage'});
         return false;
      }
      
                                                                                                         
      messageServerMessageTimeDataInit=function(el){
        var parent=$(el).parent();
        var comboxWidth = 100 - 30;
        $("<input name='messageServerMessageTime' class='gaf-ui-normal'></input>").appendTo(parent).gafdatebox({width:comboxWidth,onSelect:function(){
          pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
        }});
        $(el).remove();
      }
                                                                       
      pageGrid=$("#pageGrid").gafjqGrid({
          url:'${contextPath}/app/incomingMessage/load',
                    colNames:[ 'ID','Incoming System Id','Incoming System Name','Message Content','Message Destination Name','Message Destination Type','Message Id','Message Lob','Message Server Ip','Message Server Message Id','Message Server Message Time','Message Server Port','Message Server Url','Message Server User','System Id','System Name','Version','InsertTime','CreatedBy','UpdatedBy','LastUpdateTime'],
          colModel :[
         {name:'entityId', index:'entityId', width:${widthMap.entityId!'50'},xmlmap:"entityId",fixed:true, hidden:${hiddenMap.entityId!'false'},editable: false,align:"center"},    
         
                                        {name:'incomingSystemId', index:'incomingSystemId', width:${widthMap.incomingSystemId!'100'},xmlmap:"incomingSystemId",fixed:true, hidden:${hiddenMap.incomingSystemId!'false'}, editable: true,  align:"left"}, 
                      {name:'incomingSystemName', index:'incomingSystemName', width:${widthMap.incomingSystemName!'100'},xmlmap:"incomingSystemName",fixed:true, hidden:${hiddenMap.incomingSystemName!'false'}, editable: true,  align:"left"}, 
                                              {name:'messageContent', index:'messageContent', width:${widthMap.messageContent!'100'},xmlmap:"messageContent",fixed:true, hidden:${hiddenMap.messageContent!'false'}, editable: true,  align:"left"}, 
                      {name:'messageDestinationName', index:'messageDestinationName', width:${widthMap.messageDestinationName!'100'},xmlmap:"messageDestinationName",fixed:true, hidden:${hiddenMap.messageDestinationName!'false'}, editable: true,  align:"left"}, 
                      {name:'messageDestinationType', index:'messageDestinationType', width:${widthMap.messageDestinationType!'100'},xmlmap:"messageDestinationType",fixed:true, hidden:${hiddenMap.messageDestinationType!'false'}, editable: true,  align:"left"}, 
                      {name:'messageId', index:'messageId', width:${widthMap.messageId!'100'},xmlmap:"messageId",fixed:true, hidden:${hiddenMap.messageId!'false'}, editable: true,  align:"left"}, 
                      {name:'messageLob', index:'messageLob', width:${widthMap.messageLob!'100'},xmlmap:"messageLob",fixed:true, hidden:${hiddenMap.messageLob!'false'}, editable: true,  align:"left"}, 
                      {name:'messageServerIp', index:'messageServerIp', width:${widthMap.messageServerIp!'100'},xmlmap:"messageServerIp",fixed:true, hidden:${hiddenMap.messageServerIp!'false'}, editable: true,  align:"left"}, 
                      {name:'messageServerMessageId', index:'messageServerMessageId', width:${widthMap.messageServerMessageId!'100'},xmlmap:"messageServerMessageId",fixed:true, hidden:${hiddenMap.messageServerMessageId!'false'}, editable: true,  align:"left"}, 
                      {name:'messageServerMessageTime', index:'messageServerMessageTime', width:${widthMap.messageServerMessageTime!'100'},xmlmap:"messageServerMessageTime",fixed:true, hidden:${hiddenMap.messageServerMessageTime!'false'}, editable: true, searchoptions:{dataInit:messageServerMessageTimeDataInit}, align:"center"}, 
                      {name:'messageServerPort', index:'messageServerPort', width:${widthMap.messageServerPort!'100'},xmlmap:"messageServerPort",fixed:true, hidden:${hiddenMap.messageServerPort!'false'}, editable: true,  align:"left"}, 
                      {name:'messageServerUrl', index:'messageServerUrl', width:${widthMap.messageServerUrl!'100'},xmlmap:"messageServerUrl",fixed:true, hidden:${hiddenMap.messageServerUrl!'false'}, editable: true,  align:"left"}, 
                      {name:'messageServerUser', index:'messageServerUser', width:${widthMap.messageServerUser!'100'},xmlmap:"messageServerUser",fixed:true, hidden:${hiddenMap.messageServerUser!'false'}, editable: true,  align:"left"}, 
                      {name:'systemId', index:'systemId', width:${widthMap.systemId!'100'},xmlmap:"systemId",fixed:true, hidden:${hiddenMap.systemId!'false'}, editable: true,  align:"left"}, 
                      {name:'systemName', index:'systemName', width:${widthMap.systemName!'100'},xmlmap:"systemName",fixed:true, hidden:${hiddenMap.systemName!'false'}, editable: true,  align:"left"}, 
                                          
         {name:'versionNumber', index:'versionNumber', width:100,xmlmap:"versionNumber",fixed:true,hidden:true, editable: true},            
         {name:'insertTime', index:'insertTime', width:100,xmlmap:"insertTime",fixed:true,hidden:true, editable: true}, 
         {name:'createdBy', index:'createdBy', width:100,xmlmap:"createdBy",fixed:true, hidden:true,editable: true}, 
         {name:'updatedBy', index:'updatedBy', width:100,xmlmap:"updatedBy",fixed:true, hidden:true,editable: true}, 
         {name:'lastUpdateTime', index:'lastUpdateTime', width:100,xmlmap:"lastUpdateTime",fixed:true, hidden:true,editable: true}
 
          ],
          
		  <#if !permission.checkFunctionPermitted("/incomingMessage/read/{?}","POST")>
          ondblClickRow: function() {},
          </#if>
		  
         navGrid : {
           <#if !permission.checkFunctionPermitted("/incomingMessage/create","POST")>add: false,</#if>
           <#if !permission.checkFunctionPermitted("/incomingMessage/read/{?}","POST")>edit: false,</#if>
           <#if !permission.checkFunctionPermitted("/incomingMessage/delete/{?}","POST")>del: false,</#if>
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
                 var url="${contextPath}/app/incomingMessage/list" + "?menuId="+currentMenuId;  
                 location.href=url;
             } 
        });
        
        commitIncomingMessage=function(){
            var url="${contextPath}/app/incomingMessage/update";
            $.post(url,$("#incomingMessageInputForm").gafserialize(),function(data){
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

            document.exportForm.dataName.value="IncomingMessage";
            document.exportForm.exportData.value=exportData;
            document.exportForm.method='POST';
            document.exportForm.action='${contextPath}/app/incomingMessage/export2Csv';
            document.exportForm.target='_blank';
            document.exportForm.submit();      
       });
      $("#importBtn").button().click(function(){
        var currentMenuId = ${CURRENT_MENU_ID};
  		$.gafwindow({'remoteURL':"${contextPath}/app/incomingMessage/upload?menuId="+currentMenuId,'loadComplete':function(responseText,status,XMLHttpRequest){
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
             var url="${contextPath}/app/incomingMessage/saveGridSetting";
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
                    
                    var url="${contextPath}/app/incomingMessage/saveGridSetting";
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
                var url="${contextPath}/app/incomingMessage/deleteGridSetting" + "?menuId="+currentMenuId;  
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
  <#if permission.checkFunctionPermitted("/incomingMessage/export2Csv","POST")>
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
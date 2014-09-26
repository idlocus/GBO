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
        var requestURL="${contextPath}/app/user/create";
        $.gafwindow({'remoteURL':requestURL,'loadComplete':function(responseText,status,XMLHttpRequest){
            $(".gafdatebox").gafdatebox();
            $(".gafcombobox").gafcombobox();
            $(".gafcancelBtn,.gafsubmitBtn").gafbuttons();
          
        },width:580,height:460,title:'Create User'});
      }
      
      jqDelete=function(id){
	      if(!confirm("Are you sure to delete the selected record?"))
              return false;
          var rowId = $("#pageGrid").jqGrid('getGridParam','selrow');
          var rowData = $("#pageGrid").getRowData(rowId);
          var id = rowData.entityId;              
          var requestURL="${contextPath}/app/user/delete/" + id;
          
          $.post(requestURL, function(){
             pageGrid.trigger("reloadGrid");
          });
          return false; 
      }
         
      jqEdit=jqDetail=function(id){
          var rowId = $("#pageGrid").jqGrid('getGridParam','selrow');
          var rowData = $("#pageGrid").getRowData(rowId);
          var id = rowData.entityId;           
          var requestURL="${contextPath}/app/user/read/" + id;
         
         $.gafwindow({'remoteURL':requestURL,'loadComplete':function(responseText,status,XMLHttpRequest){
            $(".gafdatebox").gafdatebox();
            $(".gafcombobox").gafcombobox();
            $(".gafcancelBtn,.gafsubmitBtn").gafbuttons();     
         },width:580,height:460,title:'Edit User'});
         return false;
      }
      
              
      birthdayDataInit=function(el){
        var parent=$(el).parent();
        var comboxWidth = 100 - 30;
        $("<input name='birthday' class='gaf-ui-normal'></input>").appendTo(parent).gafdatebox({width:comboxWidth,onSelect:function(){
          pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
        }});
        $(el).remove();
      }
                                 
       departmentIdDataInit=function(el){
        var temp=$("#departmentIdList");
        $(el).parent().empty().append(temp);
        var comboxWidth = 100 - 30;
        temp.gafcombobox({width:comboxWidth,selected:function(){
          pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
        }});
      }
                                                                                         
       locationIdDataInit=function(el){
        var temp=$("#locationIdList");
        $(el).parent().empty().append(temp);
        var comboxWidth = 100 - 30;
        temp.gafcombobox({width:comboxWidth,selected:function(){
          pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
        }});
      }
                   
      lockedTimeDataInit=function(el){
        var parent=$(el).parent();
        var comboxWidth = 100 - 30;
        $("<input name='lockedTime' class='gaf-ui-normal'></input>").appendTo(parent).gafdatebox({width:comboxWidth,onSelect:function(){
          pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
        }});
        $(el).remove();
      }
                                                                    
      passwordLastUpdateTimeDataInit=function(el){
        var parent=$(el).parent();
        var comboxWidth = 100 - 30;
        $("<input name='passwordLastUpdateTime' class='gaf-ui-normal'></input>").appendTo(parent).gafdatebox({width:comboxWidth,onSelect:function(){
          pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
        }});
        $(el).remove();
      }
                                        
       userStatusDataInit=function(el){
        var temp=$("#userStatusList");
        $(el).parent().empty().append(temp);
        var comboxWidth = 100 - 30;
        temp.gafcombobox({width:comboxWidth,selected:function(){
          pageGrid.gafjqGrid('reload',$("form.main").gafserialize());
        }});
      }
                                   
      pageGrid=$("#pageGrid").gafjqGrid({
          url:'${contextPath}/app/user/load',
                    colNames:[ 'ID','Birthday','Country','Department Id','Email','Employee Code','Fax','First Name','Home Phone','Ip','Last Name','Location Id','Locked Time','Login Id','Mailling Addr','Office Addr','Office Phone','Password','Password Duration','Password Error Times','Password Last Update Time','User Code','User Name','User Status','Version','InsertTime','CreatedBy','UpdatedBy','LastUpdateTime'],
          colModel :[
         {name:'entityId', index:'entityId', width:${widthMap.entityId!'50'},xmlmap:"entityId",fixed:true, hidden:${hiddenMap.entityId!'false'},editable: false,align:"center"},    
         
                {name:'birthday', index:'birthday', width:${widthMap.birthday!'100'},xmlmap:"birthday",fixed:true, hidden:${hiddenMap.birthday!'false'}, editable: true, searchoptions:{dataInit:birthdayDataInit}, align:"center"}, 
                      {name:'country', index:'country', width:${widthMap.country!'100'},xmlmap:"country",fixed:true, hidden:${hiddenMap.country!'false'}, editable: true,  align:"left"}, 
                                  {name:'departmentId', index:'departmentId', width:${widthMap.departmentId!'100'},xmlmap:"departmentId",fixed:true, hidden:${hiddenMap.departmentId!'false'}, editable: true, searchoptions:{dataInit:departmentIdDataInit}, align:"center"}, 
                      {name:'email', index:'email', width:${widthMap.email!'100'},xmlmap:"email",fixed:true, hidden:${hiddenMap.email!'false'}, editable: true,  align:"left"}, 
                      {name:'employeeCode', index:'employeeCode', width:${widthMap.employeeCode!'100'},xmlmap:"employeeCode",fixed:true, hidden:${hiddenMap.employeeCode!'false'}, editable: true,  align:"left"}, 
                                  {name:'fax', index:'fax', width:${widthMap.fax!'100'},xmlmap:"fax",fixed:true, hidden:${hiddenMap.fax!'false'}, editable: true,  align:"left"}, 
                      {name:'firstName', index:'firstName', width:${widthMap.firstName!'100'},xmlmap:"firstName",fixed:true, hidden:${hiddenMap.firstName!'false'}, editable: true,  align:"left"}, 
                      {name:'homePhone', index:'homePhone', width:${widthMap.homePhone!'100'},xmlmap:"homePhone",fixed:true, hidden:${hiddenMap.homePhone!'false'}, editable: true,  align:"left"}, 
                                  {name:'ip', index:'ip', width:${widthMap.ip!'100'},xmlmap:"ip",fixed:true, hidden:${hiddenMap.ip!'false'}, editable: true,  align:"left"}, 
                      {name:'lastName', index:'lastName', width:${widthMap.lastName!'100'},xmlmap:"lastName",fixed:true, hidden:${hiddenMap.lastName!'false'}, editable: true,  align:"left"}, 
                                  {name:'locationId', index:'locationId', width:${widthMap.locationId!'100'},xmlmap:"locationId",fixed:true, hidden:${hiddenMap.locationId!'false'}, editable: true, searchoptions:{dataInit:locationIdDataInit}, align:"center"}, 
                      {name:'lockedTime', index:'lockedTime', width:${widthMap.lockedTime!'100'},xmlmap:"lockedTime",fixed:true, hidden:${hiddenMap.lockedTime!'false'}, editable: true, searchoptions:{dataInit:lockedTimeDataInit}, align:"center"}, 
                      {name:'loginId', index:'loginId', width:${widthMap.loginId!'100'},xmlmap:"loginId",fixed:true, hidden:${hiddenMap.loginId!'false'}, editable: true,  align:"left"}, 
                      {name:'maillingAddr', index:'maillingAddr', width:${widthMap.maillingAddr!'100'},xmlmap:"maillingAddr",fixed:true, hidden:${hiddenMap.maillingAddr!'false'}, editable: true,  align:"left"}, 
                      {name:'officeAddr', index:'officeAddr', width:${widthMap.officeAddr!'100'},xmlmap:"officeAddr",fixed:true, hidden:${hiddenMap.officeAddr!'false'}, editable: true,  align:"left"}, 
                      {name:'officePhone', index:'officePhone', width:${widthMap.officePhone!'100'},xmlmap:"officePhone",fixed:true, hidden:${hiddenMap.officePhone!'false'}, editable: true,  align:"left"}, 
                      {name:'password', index:'password', width:${widthMap.password!'100'},xmlmap:"password",fixed:true, hidden:${hiddenMap.password!'false'}, editable: true,  align:"left"}, 
                      {name:'passwordDuration', index:'passwordDuration', width:${widthMap.passwordDuration!'100'},xmlmap:"passwordDuration",fixed:true, hidden:${hiddenMap.passwordDuration!'false'}, editable: true,  align:"center"}, 
                      {name:'passwordErrorTimes', index:'passwordErrorTimes', width:${widthMap.passwordErrorTimes!'100'},xmlmap:"passwordErrorTimes",fixed:true, hidden:${hiddenMap.passwordErrorTimes!'false'}, editable: true,  align:"center"}, 
                      {name:'passwordLastUpdateTime', index:'passwordLastUpdateTime', width:${widthMap.passwordLastUpdateTime!'100'},xmlmap:"passwordLastUpdateTime",fixed:true, hidden:${hiddenMap.passwordLastUpdateTime!'false'}, editable: true, searchoptions:{dataInit:passwordLastUpdateTimeDataInit}, align:"center"}, 
                                  {name:'userCode', index:'userCode', width:${widthMap.userCode!'100'},xmlmap:"userCode",fixed:true, hidden:${hiddenMap.userCode!'false'}, editable: true,  align:"left"}, 
                      {name:'userName', index:'userName', width:${widthMap.userName!'100'},xmlmap:"userName",fixed:true, hidden:${hiddenMap.userName!'false'}, editable: true,  align:"left"}, 
                      {name:'userStatus', index:'userStatus', width:${widthMap.userStatus!'100'},xmlmap:"userStatus",fixed:true, hidden:${hiddenMap.userStatus!'false'}, editable: true, searchoptions:{dataInit:userStatusDataInit}, align:"left"}, 
                              
         {name:'versionNumber', index:'versionNumber', width:100,xmlmap:"versionNumber",fixed:true,hidden:true, editable: true},            
         {name:'insertTime', index:'insertTime', width:100,xmlmap:"insertTime",fixed:true,hidden:true, editable: true}, 
         {name:'createdBy', index:'createdBy', width:100,xmlmap:"createdBy",fixed:true, hidden:true,editable: true}, 
         {name:'updatedBy', index:'updatedBy', width:100,xmlmap:"updatedBy",fixed:true, hidden:true,editable: true}, 
         {name:'lastUpdateTime', index:'lastUpdateTime', width:100,xmlmap:"lastUpdateTime",fixed:true, hidden:true,editable: true}
 
          ],
          
         navGrid : {
           <#if !permission.checkFunctionPermitted("/user/create","POST")>add: false,</#if>
           <#if !permission.checkFunctionPermitted("/user/read/{?}","POST")>edit: false,</#if>
           <#if !permission.checkFunctionPermitted("/user/delete/{?}","POST")>del: false,</#if>
          } 

        }).gafjqGrid('filterToolbar');
        
        $("#t_pageGrid").css("height","auto").append($("#customToolbar"));
        $("#resetBtn").button().click(function()
          {  
		     var currentMenuId = ${CURRENT_MENU_ID};
             if(currentMenuId){
                 var url="${contextPath}/app/user/list" + "?menuId="+currentMenuId;  
                 location.href=url;
             } 
        });
        
        commitUser=function(){
            var url="${contextPath}/app/user/update";
            $.post(url,$("#userInputForm").gafserialize(),function(data){
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

            document.exportForm.dataName.value="User";
            document.exportForm.exportData.value=exportData;
            document.exportForm.method='POST';
            document.exportForm.action='${contextPath}/app/user/export2Csv';
            document.exportForm.target='_blank';
            document.exportForm.submit();      
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
             var url="${contextPath}/app/user/saveGridSetting";
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
                    
                    var url="${contextPath}/app/user/saveGridSetting";
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
                var url="${contextPath}/app/user/deleteGridSetting" + "?menuId="+currentMenuId;  
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
  <button type="button" id="printBtn">Print</button>
</div>
<div id="toolbarRight" style="float:right;text-align:right;">
  <button type="button" id="resetBtn" title="To reset the query condition in the filterbar">Reset</button>
  |
  <#if permission.checkFunctionPermitted("/user/export2Csv","POST")>
  <button type="button" id="exportBtn" title="To export the data in current table to CVS file">Export</button>
  |
  </#if>
  <button type="button" id="saveColWidthBtn" title="To save the width of the column in this table">Col Width</button>
  <button type="button" id="colOrderBtn" title="To set the column presentation (order and visibility) of this table">Column</button>
  <button type="button" id="colResetBtn"title="To clear the column properties, including column width,order and visibility">Col Reset</button>
</div>
</div>
	  <select id="departmentIdList" name="departmentId">
	   <#list departmentIdMap?keys as key>
          <option value ="${key}">${departmentIdMap[key]}</option>
       </#list>
      </select>
	  <select id="locationIdList" name="locationId">
	   <#list locationIdMap?keys as key>
          <option value ="${key}">${locationIdMap[key]}</option>
       </#list>
      </select>
	  <select id="userStatusList" name="userStatus">
	   <#list userStatusMap?keys as key>
          <option value ="${key}">${userStatusMap[key]}</option>
       </#list>
      </select>

</form>

<form name="exportForm">
  <input type="hidden" name="dataName">
  <input type="hidden" name="exportData">
</form>
</body>
</html>
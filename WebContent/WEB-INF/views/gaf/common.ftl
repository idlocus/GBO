<#macro css_links>
    <link href="${contextPath}/gaf/static/css/ui.jqgrid-4.2.0.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath}/gaf/static/css/ui.multiselect.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath}/gaf/static/css/gaf-table.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath}/gaf/static/css/print-container.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath}/gaf/static/css/extend.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath}/gaf/jquery-validation-1.13.0/css/validation.css" rel="stylesheet" type="text/css" />
</#macro>

<#macro js_links>
  <script src="${contextPath}/gaf/static/js/ui.multiselect.js" type="text/javascript"></script>
  <script src="${contextPath}/gaf/static/js/i18n/grid.locale-en.js" type="text/javascript"></script>
  <script src="${contextPath}/gaf/static/js/jquery.jqGrid-4.2.0.min.js" type="text/javascript"></script>
  <script src="${contextPath}/gaf/static/js/validate.min.js" type="text/javascript"></script>
  <script src="${contextPath}/gaf/static/js/jquery.printElement.js" type="text/javascript"></script>
  <script src="${contextPath}/gaf/static/js/jquery.form.js" type="text/javascript"></script>
  
  <script src="${contextPath}/gaf/jquery-validation-1.13.0/js/jquery.validate.js" type="text/javascript"></script>
  <script>
  var contextPath = '${contextPath}';
  var themePath = '${themePath}';
  </script>
  <script src="${contextPath}/gaf/static/js/jquery.gaf.min.js" type="text/javascript"></script>
</#macro>

<#macro jqGridContext pageInfo=actionPagination>
	<currentPage><#if pageInfo.currentPage?exists>${pageInfo.currentPage?c}</#if></currentPage>
	<pageCount><#if pageInfo.pageCount?exists>${pageInfo.pageCount?c}</#if></pageCount>
	<recordTotal><#if pageInfo.recordTotal?exists>${pageInfo.recordTotal?c}</#if></recordTotal>
</#macro>

<#assign getValueByKey="com.cicc.gaf.ftl.GetDropdownListValueByKey"?new()>
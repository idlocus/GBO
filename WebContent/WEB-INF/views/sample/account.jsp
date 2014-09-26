<%@page import="com.cicc.gaf.shared.Constants"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="/WEB-INF/views/gaf/common/common_head.jsp"%>
<%
	String breadcrumb = (String)request.getAttribute(Constants.BREADCRUMB);
%>
</head>
<body>
	<%@include file="/WEB-INF/views/gaf/common/common_banner_root_menu.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<%@include file="/WEB-INF/views/gaf/common/common_link.jsp"%>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<ol class="breadcrumb">
					<%=breadcrumb%>
				</ol>
				<%@include file="/WEB-INF/views/sample/account-criteria.jsp"%>
				<table id="list1"></table>
				<div id="pager1"></div>
			</div>

		</div>
	</div>
	<%@include file="/WEB-INF/views/gaf/common/common_footer.jsp" %>

	<script type="text/javascript">
		/* jqGrid data */
		var mydata = [ {
			id : "HKSC",
			invdate : "00042",
			name : "HKD",
			note : "note",
			tax : "10.00",
			total : "2111.00"
		} ];

		$(function() {
			$("#list1").jqGrid(
					{
						url : 'server.php?q=1',
						width : 900,
						height : 470,
						data : mydata,
						datatype : "local",
						colNames : [ 'Company name', 'Symbol', 'Currency',
								'Amount', 'Tax', 'Total', 'Notes' ],
						colModel : [ {
							name : 'id',
							index : 'id',
							width : 75
						}, {
							name : 'invdate',
							index : 'invdate',
							width : 90
						}, {
							name : 'name',
							index : 'name',
							width : 100
						}, {
							name : 'amount',
							index : 'amount',
							width : 80
						}, {
							name : 'tax',
							index : 'tax',
							width : 80
						}, {
							name : 'total',
							index : 'total',
							width : 80,
							align : "right",
							hidden : true
						}, {
							name : 'note',
							index : 'note',
							width : 150,
							sortable : false,
							hidden : true
						} ],
						rowNum : 10,
						autowidth : true,
						rowList : [ 10, 20, 30 ],
						pager : jQuery('#pager1'),
						sortname : 'id',
						viewrecords : true,
						sortorder : "desc"
					}).navGrid('#pager1', {
				edit : false,
				add : false,
				del : false
			});
		});
	</script>
</body>
</html>

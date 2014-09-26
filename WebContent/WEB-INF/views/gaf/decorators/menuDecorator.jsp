<%@page import="com.cicc.gaf.shared.Constants"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>

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
<decorator:head />
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
				<decorator:body />
			</div>

		</div>
	</div>
	<%@include file="/WEB-INF/views/gaf/common/common_footer.jsp" %>
	
</body>
</html>

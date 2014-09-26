<%@page import="com.cicc.gaf.shared.Constants"%>
<%
	String menuHashMap = (String) session
			.getAttribute(Constants.USER_MENU_UI);
 	
	String breadcrumb = (String)request.getAttribute(Constants.BREADCRUMB);
%>
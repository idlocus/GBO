<%@page import="com.cicc.gaf.shared.Constants"%>
<%
	String menuHashMap = (String) session
			.getAttribute(Constants.USER_MENU_UI);
 	
%>
<script type="text/javascript">
	var menu =<%=menuHashMap%>;
</script>
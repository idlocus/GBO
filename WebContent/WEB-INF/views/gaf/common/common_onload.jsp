<%@page import="com.cicc.gaf.shared.Constants"%>
<%
	Long rootMenuId = (Long) request
			.getAttribute(Constants.ROOT_MENU_ID);
%>


<script type="text/javascript">
	$(function() {
		var rootMenuId =
<%=rootMenuId%>
	;
		framework.enrichMenu(rootMenuId);
		$(".nav-sidebar-main a").click(framework.menuClick);
		$(".normal-shortcut a").click(framework.menuClick);
		$(".root-menu a").click(framework.rootMenuClick);
	})
</script>
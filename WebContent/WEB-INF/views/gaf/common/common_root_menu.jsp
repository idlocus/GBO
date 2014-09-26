<%@page import="com.cicc.gaf.shared.Constants"%>
	<div class="container-fluid">
		<div class="root-menu row">
			<ul class="nav navbar-nav navbar-left">
				<%=session.getAttribute(Constants.ROOT_USER_MENU_UI)%>
			</ul>
		</div>
	</div>
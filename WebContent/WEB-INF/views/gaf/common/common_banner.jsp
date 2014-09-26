	<%@page import="com.cicc.gaf.shared.Constants"%>
	<%@page import="com.cicc.gaf.logon.UserLogonInfo"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	<%
	String loginId = null;
	UserLogonInfo userLogonInfo = (UserLogonInfo)session.getAttribute(Constants.USER_LOGON_INFO);
	if (userLogonInfo != null)
	{
		loginId = userLogonInfo.getUser().getLoginId();
	}
	
	
	%>
	


	<div class="navbar  navbar-fixed-top navbar-customized"
		role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="#"><img
					src="<%=request.getContextPath()%>/gaf/images/logo_only.png" width="50" 
					height="50"></img> </a> <a class="navbar-brand-customized"><spring:eval expression="@propertyConfigurer.getProperty('gaf.app.projectname')" /></a>
			</div>
			<%if (loginId != null) {%>
			
			<div class="navbar-collapse collapse">
				<div class="setting-menu">
					<a href="#" class="loginId"><%=loginId%></a> <a
						class="btn btn-primary btn-sm btn-sign-out"
						href="<%=request.getContextPath()%>/app/logout">Sign out</a>
				</div>
			</div>
			<%} %>
		</div>
	</div>
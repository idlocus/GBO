<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*"%>
<%@page import="com.cicc.gaf.shared.Constants"%>
<%@page import="com.cicc.gaf.logon.UserLogonInfo"%>

<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="/WEB-INF/views/gaf/common/common_head.jsp"%>
<%
	String breadcrumb = (String) request
			.getAttribute(Constants.BREADCRUMB);
	String lastUrl = (String) request.getSession().getAttribute(
			Constants.LAST_ACCRSS_URL);
	UserLogonInfo info = (UserLogonInfo) request.getSession()
			.getAttribute(Constants.USER_LOGON_INFO);
	String userID = info.getUser().getLoginId();
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
				<div class="bs-example col-md-offset-4 col-md-4"
					style="border: 1px solid #C3C3C3; border-radius: 5px; margin-top: 50px;">

					<form class="form-horizontal" style="padding: 20px;"
						action="change-pwd-by-user" method="POST">
						<div class="form-group">
							<h3
								style="border-bottom: 1px solid #DDDDDD; padding-bottom: 5px; color: #822022;">Change
								Password</h3>
						</div>
						<div class="form-group">
							<div class="">
								<input type="password" class="form-control"
									id="inputOldPassword" name="oldPassword"
									placeholder="Old Password">
							</div>
						</div>
						<div class="form-group">
							<div class="">
								<input type="password" class="form-control" id="inputPassword"
									name="newPassword" placeholder="New Password 6-10 Cap letter ">
							</div>

						</div>
						<div class="form-group">
							<div class="">
								<input type="password" class="form-control" id="confirmPassword"
									name="confirmPassword" placeholder="Confirm New Password">
							</div>
						</div>
						<div class="form-group">
							<div class="">
								<input type="button" id="submitButton" class="btn btn-primary"
									value="Submit"> <input type="reset"
									class="btn btn-default" value="Reset">
							</div>
						</div>
					</form>

					<div id="messageBox" style="color: red;"></div>

				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/gaf/common/common_footer.jsp"%>
	<!-- <script src="../../js/jquery.js"></script>
	<script src="../../js/common/app.js"></script> -->
	<script type="text/javascript">
	$(function()
	{
		submitAfterEnter();
		$("#submitButton").click(changepwd);
	
	});
	function submitAfterEnter()
	{
		$("html").keypress(function(event) {
			if (event.which == 13) {
				changepwd();
			}
		});
	}
	function checkValid(loginId,oldpwd, password, confirmpwd)
	{
		var checkValidStatus = new Object();
		//loginId = false;
		if (!loginId || !oldpwd || !password ||!confirmpwd)
		{
			checkValidStatus.status = 0;
			checkValidStatus.message = 'All fildes are required';
		}
		else if (password != confirmpwd)
		{
			checkValidStatus.status = 0;
			checkValidStatus.message = 'The confirm password is not consistant with the new password.';
		}
		else
		{
			checkValidStatus.status = 1;
		}
		return checkValidStatus;
	}
	function changepwd()
	{
		var contextPathEnriched = App.getAppContextPathEnriched();

		var oldpwd = $("#inputOldPassword").val();
		var password = $("#inputPassword").val();
		var confirmpwd = $("#confirmPassword").val();
		var loginId = "<%=userID%>";

			var checkValidStatus = checkValid(loginId, oldpwd, password,
					confirmpwd);
			if (checkValidStatus.status == 0) {
				$("#messageBox").html(checkValidStatus.message);
				$("#messageBox").addClass("customized-panel-message");
				return;
			}

			$.post(contextPathEnriched + "/app/user/password", {
				"loginId" : loginId,
				"oldPassword" : oldpwd,
				"newPassword" : password
			},

			function(data, textStatus) {
				var message;
				if (data.status == 'SUCCESS') {

					window.location.href = contextPathEnriched;

				} else {
					$("#messageBox").html(data.message);
					$("#messageBox").addClass("customized-panel-message");
				}
			}, "JSON");
		}
	</script>

</body>
</html>
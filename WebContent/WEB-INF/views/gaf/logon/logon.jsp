<%@page import="com.cicc.gaf.shared.Constants"%>
<%@page import="java.util.HashMap"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="/WEB-INF/views/gaf/common/common_title.jsp" %>
<%@include file="/WEB-INF/views/gaf/common/common_css.jsp" %>


<link href="<%=request.getContextPath()%>/sb-admin-v2/font-awesome.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/sb-admin-v2/sb-admin.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/login.css"
	rel="stylesheet">

</head>

<body>
	<%@include file="/WEB-INF/views/gaf/common/common_banner.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<!-- <div class="panel-title title"></div> -->
						<div class="panel-title" id="panelMessage"></div>
					</div>
					<div class="panel-body">
						<form role="form">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="Login ID"
										name="loginId" id="loginId" type="email" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Password"
										name="password" id="password" type="password" value="">
								</div>
								<!--  <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div> -->
								<!-- Change this to a button or input when using this as a form -->
								<button type="button" class="btn btn-primary btn-lg btn-block btn-login"
									id="login">Login</button>
								<!-- <a class="btn btn-lg btn-success btn-block" id="login">Login</a> -->
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</form>

	<%@include file="/WEB-INF/views/gaf/common/common_footer.jsp" %>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<%@include file="/WEB-INF/views/gaf/common/common_js.jsp" %>

	<script
		src="<%=request.getContextPath()%>/sb-admin-v2/jquery.metisMenu.js"></script>
	<script src="<%=request.getContextPath()%>/sb-admin-v2/sb-admin.js"></script>
	<script type="text/javascript">
		$(function() {
			submitAfterEnter();
			$("#login").click(login);

		});
		function submitAfterEnter() {
			$("html").keypress(function(event) {
				if (event.which == 13) {
					login();
				}
			});
		}
		function checkValid(loginId, password) {
			var checkValidStatus = new Object();
			//loginId = false;
			if (!loginId) {
				checkValidStatus.status = 0;
				checkValidStatus.message = 'Enter your login id.';
			} else if (!password) {
				checkValidStatus.status = 0;
				checkValidStatus.message = 'Enter your password.';
			} else {
				checkValidStatus.status = 1;
			}
			return checkValidStatus;
		}

		function loginSuccess(data) {
			var message;
			if (data.status == 0) {
				message = data.message;
			} else {
				if (data.status == "SUCCESS") {
					if (data.lastAccessUrl != null) {
						window.location.href = data.lastAccessUrl;
					} else {
						var contextPathEnriched = App
								.getAppContextPathEnriched();
						window.location.href = contextPathEnriched
								+ "/app/index";
					}
				} else if (data.status == "USERNAMENOTEXIST") {
					message = "Login id that you entered is incorrect.";
					//message = "Login Id is ";
				} else {
					message = "Password that you entered is incorrect.";
				}
			}
			if (message != null) {
				$("#panelMessage").html(message);
				$("#panelMessage").addClass("customized-panel-message");
			}
		}

		function loginError(textStatus, errorThrown) {
			alert(textStatus + errorThrown);
		}
		function login() {
			var contextPathEnriched = App.getAppContextPathEnriched();

			var loginId = $("#loginId").val();
			var password = $("#password").val();

			var checkValidStatus = checkValid(loginId, password);
			if (checkValidStatus.status == 0) {
				$("#panelMessage").html(checkValidStatus.message);
				$("#panelMessage").addClass("customized-panel-message");
				return;
			}

			GafAjax.post(contextPathEnriched + "/app/logon", {
				"loginId" : loginId,
				"password" : password
			}, loginSuccess, 'JSON', loginError);

		}
	</script>
</body>
</html>


<%@page import="com.cicc.gaf.shared.Constants"%>
<%@page import="java.util.*"%>
<%@page import="com.cicc.gaf.privilegesgranting.LocationView"%>
<%@page import="com.cicc.gaf.privilegesgranting.DepartmentView"%>
<%@page import="com.cicc.gaf.privilegesgranting.UserView"%>
<%@page import="com.cicc.gaf.menu.MenuNode"%>
<%@page import="com.cicc.gaf.logon.service.LogonService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="/WEB-INF/views/gaf/common/common_head.jsp"%>
<%
	String breadcrumb = (String) request
			.getAttribute(Constants.BREADCRUMB);
%>

<%
	HashMap<String, Object> results = (HashMap<String, Object>) request
			.getAttribute("results");
	List<LocationView> userTree = (List<LocationView>) results
			.get("userTree");
	Long uid = (Long) results.get("uid");
	List<Long> menuIds = (List<Long>) results.get("menuIds");
	
	String grantingMenu = (String) results.get("grantingMenu");
	
	Long currentMenuId =(Long)request.getAttribute(Constants.CURRENT_MENU_ID);
%>

	<%@include file="/WEB-INF/views/gaf/privileges/common_privileges.jsp" %>

<style>
#main h1 
{
font-size:17px;
font-weight:bold;
}

#menu span.menuresource
{
 color:#b94327;
 font-weight:bold;
}

#menu span.defaultresource
{
 color:#b94327;
 font-weight:bold;
}
</style>
<script type="text/javascript">
	
	function submitForm(){
		/* var requestType = document.getElementById("requestType");
		requestType.value = "userMenuAdd";
		document.getElementById("mainForm").submit(); */
		var contextPathEnriched = App.getAppContextPathEnriched();
		var parameters = $("#mainForm").serialize();
		GafAjax.post(contextPathEnriched + "/app/privilege/user", parameters, addSuccess, 'JSON', addError);
	}
	
	function addSuccess(data) {
		if (data.status == 'SUCCESS')
			{
				alert("success");
			}
		else
			{
			alert(data.message);
			}
	}

	function addError(textStatus, errorThrown) {
		alert(textStatus + errorThrown);
	}
	
	function refreshMenuTreeForUser(userNode){
		var userId = userNode.value;
		var contextPathEnriched = App.getAppContextPathEnriched();
		window.location.href = contextPathEnriched + "/app/privilege/user/" + userId + "?menuId=" + <%=currentMenuId%>;
		
	}

	function isResourceCheckbox(parentLiNode)
	{
		var isResourceCheckbox = false;
		var childUlNode =  $(parentLiNode).children("ul");	
		if(childUlNode.length == 0)
		{
			isResourceCheckbox = true;
		}
		return isResourceCheckbox;
	}
	
	function checkAll(node) {
		var parentLiNode = node.parentNode.parentNode;
		changeAllChilds(parentLiNode, node.checked);

		var results = isResourceCheckbox(parentLiNode);
		if (results) {
			var parentUlNode = parentLiNode.parentNode;
			changeBrothers(parentUlNode, node.checked, node);
		}
		changeAllParents(parentLiNode, node.checked);
	}

	function changeBrothers(node, checked, currentNode) {
		var childs = $(node).find("input");
		var isHasBrotherChecked = isHasBrothersChecked(node);
		for ( var index = 0; index < childs.length; index++) {
			if (childs[index] == currentNode) {
				continue;
			}
			var child = $(childs[index]);
			var isDefault = child.attr("defaultresource");
			if (isDefault == '') {
				if (checked) {
					child.attr("checked", checked);
				}
			} else {
				var isMenuResource = child.attr("menuresource");
				if (isMenuResource == '') {
					if (checked) {
						child.attr("checked", checked);
					} 
				}
			}
		}
	}

	function isHasBrothersChecked(node) {

		var isHasBrotherChecked = false;
		var spanNodes = $(node).children("li").children("span");
		var checkedNormalChilds = spanNodes
				.children("input[normalresource]:checked");
		if (checkedNormalChilds.length >= 1) {
			isHasBrotherChecked = true;
		}
		return isHasBrotherChecked;
	}

	function isHasBrothersChecked2(node) {

		var isHasBrotherChecked = false;
		var spanNodes = $(node).children("li").children("span");
		var checkedNormalChilds = spanNodes.children("input:checked");
		if (checkedNormalChilds.length >= 1) {
			isHasBrotherChecked = true;
		}
		return isHasBrotherChecked;
	}

	function changeAllChilds(node, checked) {
		if (node.nodeName == "INPUT") {
			node.checked = checked;
		}
		var childs = node.childNodes;
		for ( var i = 0; i < childs.length; i++) {
			changeAllChilds(childs[i], checked);
		}
	}

	function changeAllParents(node, checked) {

		//parent li node
		var parent = node.parentNode;
		if (parent.nodeName == "DIV") {
			//END HERE
		} else if (parent.nodeName != "LI") {
			//Iterate to find checkbox parent node
			changeAllParents(parent, checked);
		} else {
			var subChilds = parent.children;
			for ( var subIndex = 0; subIndex < subChilds.length; subIndex++) {
				if (subChilds[subIndex].nodeName == "SPAN") {
					var parentCheckbox = subChilds[subIndex].children;
					for ( var j = 0; j < parentCheckbox.length; j++) {
						if (parentCheckbox[j].nodeName == "INPUT") {
							if (checked) {
								parentCheckbox[j].checked = true;
							} else {
								var liNode = $(parentCheckbox[j]).parent()
										.parent().children("ul");
								var isHasBrothersChecked = isHasBrothersChecked2(liNode);
								if (!isHasBrothersChecked) {
									parentCheckbox[j].checked = false;
								} 
							}
						}
					}
				}
			}
			changeAllParents(parent, checked);
		}
	}

	function checkChilds(node) {
		if (node.nodeName == "INPUT" && node.checked == true) {
			return true;
		}
		var childs = node.childNodes;
		for ( var j = 0; j < childs.length; j++) {
			checkChilds(childs[j]);
		}
	}

	function onCheckBoxHander() {
		var cb = $("#menuTree").find("input[type='checkbox']").each(
				function(i) {
					var ppUl = $(this).parent().parent().parent();

					if (ppUl.find(":checkbox:checked").length <= 0) {
						ppUl.prev().find(":checkbox").attr("checked", false);
					} else if (ppUl.find(":checkbox:checked").length == ppUl
							.find(":checkbox").length) {
						ppUl.prev().find(":checkbox").attr("checked", true);
					}
				});
	}

	$(document).ready(function() {
		$(":checked").parents("li").each(function() {
			$(this).removeClass("closed");
		});
		$("#menuTree").treeview();
		$("#userTree").treeview();
	});
</script>
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
				<form action="#" method="post" id="mainForm">
					<div id="main" style="padding:10px; width:780px; border:0px grey solid;height:580px; margin-top:10px;">
						<div id="line" style="width:780px; height:580px; margin-top:10px;">
						<div id="user" style="height:580px; width:375px; border:2px grey solid; float:left; margin-left:20px; overflow:auto" >
							<H1>Users</H1>
							<ul id="userTree" class="filetree treeview-famfamfam">
						<%
							for(LocationView userDataMap : userTree){
								//System.out.println("map user"+userDataMap.getLocationName());
								%>
								<li class="closed"><span class="folder">&nbsp;<%=userDataMap.getLocationName() %></span>
									<%if(userDataMap.getDepartments()!=null && userDataMap.getDepartments().size()>0){ 
										List<DepartmentView> deptList = userDataMap.getDepartments(); 
										%>
										<ul>
										<% 
										for(DepartmentView dept : deptList){
											%>
											<li><span class="folder">&nbsp;<%=dept.getDepartmentName() %></span>
											<%
											if(dept.getOperators()!=null && dept.getOperators().size()>0){
												%>
												<ul>
												<% 
												List<UserView> userList = dept.getOperators();
												for(UserView user : userList){
													if(user.getUserID().equals(uid)){
													%>
													<li><span class="file" name="userLi">&nbsp;<input type="radio"
															checked name="user" value="<%=user.getUserID() %>"
															onClick="refreshMenuTreeForUser(this)"/> <%=user.getUserName() %></span></li>
												<%
													}
													else
													{
														%>
														<li><span class="file">&nbsp;<input type="radio" name="user" value="<%=user.getUserID() %>" onClick="refreshMenuTreeForUser(this)" /> <%=user.getUserName() %></span></li>
													<%
													}
												}
												%>
												</ul>
												<%
											}
											%>
											</li>
											<%
										}
										
										%>
										</ul>
										<%
									}
									%>
									</li>
									<%
								}
							%>
							</ul>
						</div>

		<div id="menu" style="height:580px; width:375px; border:2px grey solid; float:left; margin-left:10px; overflow:auto">
		<H1>Menus</H1>
			<%=grantingMenu%>
		</div>
		</div>
		<%
		LogonService logonService =(LogonService)WebApplicationContextUtils.getWebApplicationContext( request.getServletContext()).getBean(LogonService.class);
		boolean isHasPriv = logonService.isUserHasPrivilegesWrapper("/privilege/user", "POST");
		if (isHasPriv)
		{
		%>
		<div id="saveBtn" style="width:760px; height:20px; margin-top:20px; margin-left:20px">
			<span><input type="button"  value="Save" onclick="submitForm()" /></span>
		</div>
		<%
		}
		%>
		</div>
	
 	</form>
			</div>

		</div>
	</div>
	<%@include file="/WEB-INF/views/gaf/common/common_footer.jsp" %>
</body>
</html>

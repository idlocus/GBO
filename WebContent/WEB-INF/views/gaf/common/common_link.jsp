<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-shortcut">
					<li class="shortcut"><a href="#"><span
							class="icon-attachment"></span> Shortcut</a></li>
					<li class="normal-shortcut"><a href="#"><span
							class="icon-cc-nd"></span> Preference</a>
					<li class="normal-shortcut"><a href="<spring:eval expression="@propertyConfigurer.getProperty('gaf.shortcut.resetpassword')" />"><span
							class="icon-cc-nd"></span> Change Password</a></li>
				</ul>
</div>
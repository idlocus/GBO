<%-- <title>${propertyConfigurer['gaf.app.prdojectname']}</title> --%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<title><spring:eval expression="@propertyConfigurer.getProperty('gaf.app.projectname')" /></title>
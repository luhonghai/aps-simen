<%@tag description="Main screen" pageEncoding="UTF-8" %>
<%@taglib prefix="include" tagdir="/WEB-INF/tags/admin/includes" %>
<%@attribute name="pageTitle" required="true" %>
<%@attribute name="index"%>
<!DOCTYPE html>
<html lang="en">
    <include:head pageTitle="<%=pageTitle%>">
    </include:head>
<body>
	<div id="wrapper">
		<include:header index="<%=index %>"></include:header>
		<div id="page-wrapper" >
    		<jsp:doBody/>
    	</div>
    </div>
    <include:footer></include:footer>
</body>
</html>


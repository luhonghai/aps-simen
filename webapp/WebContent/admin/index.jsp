<%@page import="uk.ac.gre.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/admin" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/admin/layouts" %>
<%
User user = (User) session.getAttribute("admin");
if (user == null) {
	response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
}
%>
<t:main pageTitle="Dashboard" index="0">
</t:main>

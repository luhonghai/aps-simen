<%
	session.setAttribute("admin", null);
	response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>
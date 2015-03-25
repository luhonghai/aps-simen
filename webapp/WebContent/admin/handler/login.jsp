<%@page import="uk.ac.gre.entities.User"%>
<%@page import="uk.ac.gre.restful.UserService"%>
<%
	UserService userService = new UserService();
	User user = userService.login(request.getParameter("txtEmail"), request.getParameter("txtPassword"));
	if (user != null) {
		session.setAttribute("admin", user);
		response.sendRedirect(request.getContextPath() + "/admin/index.jsp");
	} else {
		response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
	}
%>
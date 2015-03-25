<%@page import="uk.ac.gre.restful.BookingService"%>
<%@page import="uk.ac.gre.entities.Booking"%>
<%@page import="uk.ac.gre.entities.User"%>
<%@page import="uk.ac.gre.restful.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserService userService = new UserService();
	User user = userService.login(request.getParameter("txtEmail"), request.getParameter("txtPassword"));
	if (user != null) {
		session.setAttribute("user", user);
		Booking booking = (Booking) session.getAttribute("booking");
		if (booking != null) {
			BookingService bookingService = new BookingService();
			bookingService.save(booking);
			session.setAttribute("message", "Booking is added");
			session.setAttribute("booking", null);
		}
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	} else {
		response.sendRedirect(request.getContextPath() + "/login.jsp");
	}
%>
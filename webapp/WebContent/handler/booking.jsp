<%@page import="uk.ac.gre.restful.BookingService"%>
<%@page import="uk.ac.gre.entities.User"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uk.ac.gre.entities.Booking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Booking booking = new Booking();
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	booking.setPackingType(Integer.parseInt(request.getParameter("selType")));
	booking.setCarParkId(Long.parseLong(request.getParameter("selCarpark")));
	if (request.getParameter("txtArrivalDate") != null && request.getParameter("txtArrivalDate").length() > 0) {
		booking.setArrivalDate(sdf.parse(request.getParameter("txtArrivalDate")));
	}
	if (request.getParameter("txtDepartureDate") != null && request.getParameter("txtDepartureDate").length() > 0) {
		booking.setDepartureDate(sdf.parse(request.getParameter("txtDepartureDate")));
	}
	booking.setCarRegNumber(request.getParameter("txtCarRegNumber"));
	booking.setCarBrand(request.getParameter("txtCarBrand"));
	booking.setCarModel(request.getParameter("txtCarModel"));
	booking.setCreatedDate(new Date(System.currentTimeMillis()));
	User user = (User) session.getAttribute("user");
	if (user == null) {
		session.setAttribute("booking", booking);
		response.sendRedirect(request.getContextPath() + "/login.jsp");
	} else {
		BookingService bookingService = new BookingService();
		booking.setCustomerId(user.getId());
		bookingService.save(booking);
		session.setAttribute("message", "Booking is added");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
%>
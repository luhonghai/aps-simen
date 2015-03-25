<%@page import="uk.ac.gre.restful.BookingService"%>
<%@page import="uk.ac.gre.entities.Booking"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uk.ac.gre.restful.UserService"%>
<%@page import="uk.ac.gre.entities.User"%>
<%
	UserService userService = new UserService();
	User user = new User();
	user.setFirstName(request.getParameter("txtFirstName"));
	user.setSurname(request.getParameter("txtSurname"));
	user.setAddress(request.getParameter("txtAddress"));
	user.setEmail(request.getParameter("txtEmail"));
	user.setPassword(request.getParameter("txtPassword"));
	user.setPhone(request.getParameter("txtPhone"));
	user.setType(User.TYPE_CUSTOMER);
	user.setGender(request.getParameter("rdGender").equalsIgnoreCase("male"));
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	if (request.getParameter("txtDob") != null && request.getParameter("txtDob").length() > 0) {
		user.setDob(sdf.parse(request.getParameter("txtDob")));
	}
	user.setId(-1L);
	User tmpUser = null;
	if (userService.save(user)) {
		tmpUser = userService.findLatestUser();
	}
	if (tmpUser != null) {
		session.setAttribute("user", tmpUser);
		Booking booking = (Booking) session.getAttribute("booking");
		if (booking != null) {
			BookingService bookingService = new BookingService();
			booking.setCustomerId(tmpUser.getId());
			bookingService.save(booking);
			session.setAttribute("message", "Submit successfully!");
			session.setAttribute("booking", null);
		}
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	} else {
		response.sendRedirect(request.getContextPath() + "/login.jsp");
	}
%>
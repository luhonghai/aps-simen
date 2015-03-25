<%@tag import="uk.ac.gre.remote.bean.BookingBean"%>
<%@tag import="uk.ac.gre.remote.IBooking"%>
<%@tag import="java.text.SimpleDateFormat"%>
<%@tag import="uk.ac.gre.remote.bean.UserBean"%>
<%@tag import="uk.ac.gre.remote.IUser"%>
<%@tag import="uk.ac.gre.remote.bean.CarParkBean"%>
<%@tag import="uk.ac.gre.remote.ICarPark"%>
<%@tag import="uk.ac.gre.remote.bean.AirPortBean"%>
<%@tag import="uk.ac.gre.utils.ClientUtility"%>
<%@tag import="uk.ac.gre.remote.IAirPort"%>
<%@tag import="uk.ac.gre.entities.*"%>
<%@tag import="java.util.List"%>
<%@tag description="Customer management" pageEncoding="UTF-8" %>
<div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Booking management</h2>   
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
               
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables">
                                    <thead>
                                        <tr>
                                        	<th>Airport</th>
                                            <th>Car park</th>
                                            <th>Location</th>
                                            <th>Arrival Date</th>
                                            <th>Departure Date</th>
                                            <th>Car Number</th>
                                            <th>Car Brand</th>
                                            <th>Car Model</th>
                                            <th>Type</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        IBooking bookingBean = (IBooking) ClientUtility.lookup(BookingBean.class, IBooking.class);
                                        IAirPort airPortBean =(IAirPort) ClientUtility.lookup(AirPortBean.class, IAirPort.class);
                                        ICarPark carParkBean = (ICarPark) ClientUtility.lookup(CarParkBean.class, ICarPark.class);
                                        IUser userBean = (IUser) ClientUtility.lookup(UserBean.class, IUser.class);
                                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                        List<Booking> bookings = bookingBean.findAll();
                                        if (bookings != null && bookings.size() > 0) {
                                        	for (Booking booking : bookings) {
                                        		User user = userBean.find(booking.getCustomerId());
                                        		CarPark carPark = carParkBean.find(booking.getCarParkId());
                                        		AirPort airPort = airPortBean.find(carPark.getAirportId());
                                        %>
                                        	<tr>
                                        		<td><%=airPort.getName() %></td>
                                        		<td><%=carPark.getName() %></td>
                                        		<td><%=airPort.getLocation() %></td>
                                        		<td><%=booking.getArrivalDate() != null ? sdf.format(booking.getArrivalDate()) : ""%></td>
                                        		<td><%=booking.getDepartureDate() != null ? sdf.format(booking.getDepartureDate()) : ""%></td>
                                        		<td><%=booking.getCarRegNumber() %></td>
                                        		<td><%=booking.getCarBrand() %></td>
                                        		<td><%=booking.getCarModel() %></td>
                                        		<%String parkingType = "Default";
                                        		if (booking.getPackingType() == Booking.PACKING_TYPE_DISABLED ) {
                                        			parkingType = "Disabled";
                                        		} else if (booking.getPackingType() == Booking.PACKING_TYPE_FAMILY) {
                                        			parkingType = "Family";
                                        		}
                                        		%>
                                        		<td><%=parkingType %></td>
                                        	</tr>
                                        <%}} %>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
           
        </div>
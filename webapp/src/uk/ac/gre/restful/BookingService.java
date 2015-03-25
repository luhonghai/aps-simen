package uk.ac.gre.restful;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import uk.ac.gre.entities.Booking;
import uk.ac.gre.remote.IBooking;
import uk.ac.gre.remote.bean.BookingBean;
import uk.ac.gre.utils.ClientUtility;

@Path("booking")
public class BookingService {
	private IBooking bookingBean;
	
	public BookingService() {
		bookingBean = (IBooking) ClientUtility.lookup(BookingBean.class, IBooking.class);
	}
	
	@GET
	@Path("/delete")
	@Produces("application/json")
	public boolean delete(
			@QueryParam("id") long id) {
		try {
			bookingBean.delete(id);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	@POST
	@Path("/save")
	@Produces("application/json")
	public boolean save( Booking booking) {
		try {
			bookingBean.save(booking);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	@GET
	@Path("/find")
	@Produces("application/json")
	public Booking find(
			@QueryParam("id") long id) {
		try {
			return bookingBean.find(id);
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	@GET
	@Path("/list")
	@Produces("application/json")
	public List<Booking> findAll() {
		try {
			return bookingBean.findAll();
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
}

package uk.ac.gre.soap;

import java.util.Date;
import java.util.List;

import javax.jws.WebService;

import uk.ac.gre.entities.Booking;
import uk.ac.gre.remote.IBooking;
import uk.ac.gre.remote.bean.BookingBean;
import uk.ac.gre.utils.ClientUtility;

@WebService()
public class BookingService implements IBookingService {

	private IBooking bookingBean;
	
	public BookingService() {
		bookingBean = (IBooking) ClientUtility.lookup(BookingBean.class, IBooking.class);
	}
	
	@Override
	public Booking[] findAll(long fromMs, long toMs) {
		List<Booking> bookings = bookingBean.findAll();
		//List<Booking> bookings = bookingBean.findByDate(new Date(fromMs), new Date(toMs));
		if (bookings == null || bookings.size() == 0) return null;
		Booking[] items = new Booking[bookings.size()];
		bookings.toArray(items);
		return items;
	}

	@Override
	public Booking findAvailableBooking(String carRegNo, long date) {
		
		return bookingBean.findByCar(carRegNo, new Date(date));
	}

}

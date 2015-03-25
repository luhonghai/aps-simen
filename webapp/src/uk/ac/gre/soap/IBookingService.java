package uk.ac.gre.soap;
import java.util.List;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

import uk.ac.gre.entities.Booking;

@WebService
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface IBookingService {
	
	/**
	 *  Find all available booking on date range
	 * @param fromMs From date in millisecond
	 * @param toMs To date in millisecond
	 * @return list of all booking information
	 */
	public Booking[] findAll(long fromMs, long toMs);
	
	/**
	 * Find Booking of Car with registration number and selected date
	 * @param carRegNo Car registration number
	 * @param date selected date in millisecond
	 * @return booking information
	 */
	public Booking findAvailableBooking(String carRegNo, long date);
}

package uk.ac.gre.remote;

import javax.ejb.Remote;

import uk.ac.gre.entities.Booking;

import java.util.Date;
import java.util.List;

@Remote
public interface IBooking {
	public void save(Booking booking);
	public void delete(long id);
	public Booking find(long id);
	public List<Booking> findAll();
	public List<Booking> findByDate(Date from, Date to);
	public Booking findByCar(String carRegNo, Date selectedDate);
}

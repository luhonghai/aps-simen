package uk.ac.gre.remote.bean;

import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import uk.ac.gre.entities.Booking;
import uk.ac.gre.remote.IBooking;

@Stateless
public class BookingBean implements IBooking {

	@PersistenceContext(unitName = "JPADB")
	private EntityManager entityManager;
	
	@Override
	public void save(Booking booking) {
		if (booking.getId() > 0) {
			Booking b = find(booking.getId());
			b.setArrivalDate(booking.getArrivalDate());
			b.setCarBrand(booking.getCarBrand());
			b.setCarModel(booking.getCarModel());
			b.setCarParkId(booking.getCarParkId());
			b.setCarRegNumber(booking.getCarRegNumber());
			b.setCustomerId(booking.getCustomerId());
			b.setDepartureDate(booking.getDepartureDate());
			b.setPackingType(booking.getPackingType());
			entityManager.merge(b);
		} else {
			booking.setId(0L);
			entityManager.persist(booking);
		}
	}

	@Override
	public void delete(long id) {
		entityManager.remove(find(id));
	}

	@Override
	public Booking find(long id) {
		return entityManager.find(Booking.class, id);
	}

	@Override
	public List<Booking> findAll() {
		return entityManager.createNamedQuery("Booking.findAll", Booking.class).getResultList();
	}

	@Override
	public List<Booking> findByDate(Date from, Date to) {
		return entityManager.createNamedQuery("Booking.findByDate", Booking.class)
				.setParameter("sd", from)
				.setParameter("ed", to)
				.getResultList();
	}

	@Override
	public Booking findByCar(String carRegNo, Date selectedDate) {
		List<Booking> bookings =  entityManager.createNamedQuery("Booking.findByCar", Booking.class)
				.setParameter("crn", carRegNo).setFirstResult(0).setMaxResults(1).getResultList();
		return bookings.size() > 0 ? bookings.get(0): null;
	}

}

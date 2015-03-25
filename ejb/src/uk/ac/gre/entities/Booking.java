package uk.ac.gre.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.xml.bind.annotation.XmlRootElement;

@Entity(name="booking")
@NamedQueries({
	@NamedQuery(name="Booking.findAll", query = "SELECT b from booking b"),
	@NamedQuery(name="Booking.findByDate", query = "SELECT b from booking b where b.arrivalDate > :sd and b.arrivalDate < :ed"),
	@NamedQuery(name="Booking.findByCar", query = "SELECT b from booking b where b.carRegNumber = :crn")
})
@XmlRootElement(name = "Booking",namespace="http://student.aps.com/")
public class Booking implements Serializable {
	
	public static final int PACKING_TYPE_DEFAULT = 0;
	public static final int PACKING_TYPE_FAMILY = 1;
	public static final int PACKING_TYPE_DISABLED = 2;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6768212666278885689L;
	
	@Id
	private long id;
	
	@Column(name="car_park_id")
	private long carParkId;
	
	@Column(name="customer_id")
	private long customerId;
	
	@Column(name="created_date")
	private Date createdDate;
	
	@Column(name="arrival_date")
	private Date arrivalDate;
	
	@Column(name="departure_date")
	private Date departureDate;
	
	@Column(name="car_reg_no")
	private String carRegNumber;
	
	@Column(name="car_brand")
	private String carBrand;
	
	@Column(name="car_model")
	private String carModel;
	
	@Column(name="parking_type")
	private int packingType;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getCarParkId() {
		return carParkId;
	}

	public void setCarParkId(long carParkId) {
		this.carParkId = carParkId;
	}

	public long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(long customerId) {
		this.customerId = customerId;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}

	public String getCarRegNumber() {
		return carRegNumber;
	}

	public void setCarRegNumber(String carRegNumber) {
		this.carRegNumber = carRegNumber;
	}

	public String getCarBrand() {
		return carBrand;
	}

	public void setCarBrand(String carBrand) {
		this.carBrand = carBrand;
	}

	public String getCarModel() {
		return carModel;
	}

	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}

	public int getPackingType() {
		return packingType;
	}

	public void setPackingType(int packingType) {
		this.packingType = packingType;
	}

	public Date getArrivalDate() {
		return arrivalDate;
	}

	public void setArrivalDate(Date arrivalDate) {
		this.arrivalDate = arrivalDate;
	}
}

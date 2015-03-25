package uk.ac.gre.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity(name = "car_park")
@NamedQueries({
	@NamedQuery(name="CarPark.findAll", query = "SELECT c from car_park c")
})
public class CarPark implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8108787781791727274L;
	
	@Id
	private long id;
	
	@Column(name = "air_port_id")
	private long airportId;
	
	private String name;
	
	private String phone;
	
	private int capacity;
	
	private float price;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getAirportId() {
		return airportId;
	}

	public void setAirportId(long airportId) {
		this.airportId = airportId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

}

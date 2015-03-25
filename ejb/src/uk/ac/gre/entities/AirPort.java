package uk.ac.gre.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity(name = "air_port")
@NamedQueries({
	@NamedQuery(name ="AirPort.findAll", query="SELECT a from air_port a")
})
public class AirPort implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6792644599831638094L;

	@Id
	private long id;
	
	private String name;
	
	private String location;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
}

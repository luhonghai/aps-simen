package uk.ac.gre.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity(name="currency")
@NamedQueries({
	@NamedQuery(
			name="Currency.findAll", 
			query = "SELECT c from currency c"),
	@NamedQuery(
			name="Currency.findByCode", 
			query = "SELECT c from currency c where c.code=:code")
})
public class Currency implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -9048430717375573842L;

	@Id
	private long id;
	
	private String code;
	
	private String name;
	
	private float rate;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
}

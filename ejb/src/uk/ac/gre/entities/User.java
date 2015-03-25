package uk.ac.gre.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity(name = "user")
@NamedQueries({
	@NamedQuery(
			name="User.findAll",
			query="SELECT u FROM user u"),
	@NamedQuery(
			name="User.login",
			query="SELECT u FROM user u where u.email=:e and u.password=:p"),
	@NamedQuery(
					name="User.findByType",
					query="SELECT u FROM user u where u.type=:t"),
	@NamedQuery(
							name="User.latest",
							query="SELECT u FROM user u ORDER BY u.id DESC")
})
public class User implements Serializable {

	public static final int TYPE_CUSTOMER = 1;
	public static final int TYPE_STAFF = 0;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	private long id;
	
	private int type;
	
	@Column(name = "first_name")
	private String firstName;
	
	private String surname;
	
	private String email;
	
	private String password;
	
	private boolean gender;
	
	private Date dob;
	
	private String phone;
	
	private String address;

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}

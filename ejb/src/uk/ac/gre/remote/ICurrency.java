package uk.ac.gre.remote;

import java.util.List;

import javax.ejb.Remote;

import uk.ac.gre.entities.Currency;

@Remote
public interface ICurrency {
	
	public List<Currency> findAll();
	
	public Currency findByCode(String code);
}

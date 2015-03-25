package uk.ac.gre.remote.bean;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import uk.ac.gre.entities.Currency;
import uk.ac.gre.remote.ICurrency;

@Stateless
public class CurrencyBean implements ICurrency {

	@PersistenceContext(unitName = "CJPADB")
	private EntityManager entityManager;
	
	@Override
	public List<Currency> findAll() {
		return entityManager
				.createNamedQuery("Currency.findAll", Currency.class)
				.getResultList();
	}

	@Override
	public Currency findByCode(String code) {
		List<Currency> currencies = entityManager
				.createNamedQuery("Currency.findByCode", Currency.class)
				.setParameter("code", code)
				.getResultList();
		return currencies.size() > 0 ? currencies.get(0) : null;
	}
}

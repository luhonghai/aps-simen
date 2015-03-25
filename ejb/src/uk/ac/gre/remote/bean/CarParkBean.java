package uk.ac.gre.remote.bean;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import uk.ac.gre.entities.CarPark;
import uk.ac.gre.remote.ICarPark;

@Stateless
public class CarParkBean implements ICarPark {
	
	@PersistenceContext(unitName = "JPADB")
	private EntityManager entityManager;

	@Override
	public void save(CarPark carPark) {
		if (carPark.getId() > 0) {
			entityManager.merge(carPark);
		} else {
			carPark.setId(0L);
			entityManager.persist(carPark);
		}
	}

	@Override
	public void delete(long id) {
		entityManager.remove(find(id));
	}

	@Override
	public CarPark find(long id) {
		return entityManager.find(CarPark.class, id);
	}

	@Override
	public List<CarPark> findAll() {
		return entityManager.createNamedQuery("CarPark.findAll", CarPark.class).getResultList();
	}

}

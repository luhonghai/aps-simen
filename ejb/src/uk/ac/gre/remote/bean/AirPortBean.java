package uk.ac.gre.remote.bean;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import uk.ac.gre.entities.AirPort;
import uk.ac.gre.remote.IAirPort;

@Stateless
public class AirPortBean implements IAirPort {

	@PersistenceContext(unitName = "JPADB")
	private EntityManager entityManager;
	
	@Override
	public void save(AirPort airPort) {
		if (airPort.getId() > 0) {
			AirPort a = find(airPort.getId());
			a.setName(airPort.getName());
			a.setLocation(airPort.getLocation());
			entityManager.merge(a);
		} else {
			airPort.setId(0L);
			entityManager.persist(airPort);
		}
	}

	@Override
	public void delete(long id) {
		entityManager.remove(find(id));
	}

	@Override
	public AirPort find(long id) {
		return entityManager.find(AirPort.class, id);
	}

	@Override
	public List<AirPort> findAll() {
		return entityManager.createNamedQuery("AirPort.findAll", AirPort.class).getResultList();
	}

}

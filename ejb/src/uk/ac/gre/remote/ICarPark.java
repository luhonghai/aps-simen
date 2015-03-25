package uk.ac.gre.remote;

import java.util.List;

import javax.ejb.Remote;

import uk.ac.gre.entities.CarPark;

@Remote
public interface ICarPark {
	public void save(CarPark carPark);
	public void delete(long id);
	public CarPark find(long id);
	public List<CarPark> findAll();
}

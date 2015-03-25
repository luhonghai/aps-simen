package uk.ac.gre.remote;

import java.util.List;

import javax.ejb.Remote;

import uk.ac.gre.entities.AirPort;

@Remote
public interface IAirPort {
	public void save(AirPort airPort);
	public void delete(long id);
	public AirPort find(long id);
	public List<AirPort> findAll();
}

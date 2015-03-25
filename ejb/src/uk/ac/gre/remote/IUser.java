package uk.ac.gre.remote;

import java.util.List;

import javax.ejb.Remote;

import uk.ac.gre.entities.User;

@Remote
public interface IUser {
	public void save(User user);
	public void delete(long id);
	public User login(String username, String password);
	public User find(long id);
	public List<User> findAll();
	public List<User> findAll(int type);
	
	public User findLatestUser();
}

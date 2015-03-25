package uk.ac.gre.restful;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import uk.ac.gre.entities.User;
import uk.ac.gre.remote.IUser;
import uk.ac.gre.remote.bean.UserBean;
import uk.ac.gre.utils.ClientUtility;

@Path("/user")
public class UserService {
	private IUser userBean;
	
	public UserService() {
		userBean = (IUser) ClientUtility.lookup(UserBean.class, IUser.class);
	}
	
	@GET
	@Path("/delete")
	@Produces("application/json")
	public boolean delete(
			@QueryParam("id") long id) {
		try {
			userBean.delete(id);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	@POST
	@Path("/save")
	@Produces("application/json")
	public boolean save( User user) {
		try {
			userBean.save(user);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	@GET
	@Path("/find")
	@Produces("application/json")
	public User find(
			@QueryParam("id") long id) {
		try {
			return userBean.find(id);
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	@GET
	@Path("/list")
	@Produces("application/json")
	public List<User> findAll(@QueryParam("type") int type) {
		try {
			return userBean.findAll(type);
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public User login(String email, String password) {
		return userBean.login(email, password);
	}
	
	public User findLatestUser() {
		return userBean.findLatestUser();
	}
}

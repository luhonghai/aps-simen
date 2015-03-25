package uk.ac.gre.remote.bean;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import uk.ac.gre.entities.User;
import uk.ac.gre.remote.IUser;

/**
 * Session Bean implementation class UserBean
 */
@Stateless
@LocalBean
public class UserBean implements IUser {

	@PersistenceContext(unitName = "JPADB")
	private EntityManager entityManager;
	
    /**
     * Default constructor. 
     */
    public UserBean() {
    }

	@Override
	public void save(User user) {
		if (user.getId() > 0) {
			User u = find(user.getId());
			u.setAddress(user.getAddress());
			u.setDob(user.getDob());
			u.setEmail(user.getEmail());
			u.setFirstName(user.getFirstName());
			u.setGender(user.isGender());
			if (user.getPassword() != null && user.getPassword().length() > 0) {
				u.setPassword(md5(user.getPassword()));
			}
			u.setPhone(user.getPhone());
			u.setSurname(user.getSurname());
			u.setType(user.getType());
			entityManager.merge(u);
		} else {
			user.setId(0L);
			user.setPassword(md5(user.getPassword()));
			entityManager.persist(user);
		}
	}

	@Override
	public void delete(long id) {
	    entityManager.remove(find(id));
	}

	@Override
	public User find(long id) {
		return entityManager.find(User.class, id);
	}

	@Override
	public List<User> findAll() {
		return entityManager
				.createNamedQuery("User.findAll", User.class)
				.getResultList();
	}

	@Override
	public User login(String username, String password) {
		List<User> users = entityManager
				.createNamedQuery("User.login", User.class)
				.setParameter("e", username)
				.setParameter("p", md5(password))
				.getResultList();
		return users.size() > 0 ? users.get(0) : null;
	}

	@Override
	public List<User> findAll(int type) {
		return entityManager
				.createNamedQuery("User.findByType", User.class)
				.setParameter("t", type)
				.getResultList();
	}
	
	public User findLatestUser() {
		List<User> users = entityManager
				.createNamedQuery("User.latest", User.class).
				setFirstResult(0).setMaxResults(1)
				.getResultList();
		return users.size() > 0 ? users.get(0) : null;
	}

	private String md5(String input) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            return "";
        }
        md.update(input.getBytes());

        byte byteData[] = md.digest();

        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }


        //convert the byte to hex format method 2
        StringBuffer hexString = new StringBuffer();
        for (int i=0;i<byteData.length;i++) {
            String hex=Integer.toHexString(0xff & byteData[i]);
            if(hex.length()==1) hexString.append('0');
            hexString.append(hex);
        }
        return hexString.toString();
    }
}

package uk.ac.gre.restful;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import uk.ac.gre.entities.CarPark;
import uk.ac.gre.remote.ICarPark;
import uk.ac.gre.remote.bean.CarParkBean;
import uk.ac.gre.utils.ClientUtility;

@Path("carpark")
public class CarParkService {
	private ICarPark carParkBean;
	
	public CarParkService() {
		carParkBean = (ICarPark) ClientUtility.lookup(CarParkBean.class, ICarPark.class);
	}
	
	@GET
	@Path("/delete")
	@Produces("application/json")
	public boolean delete(
			@QueryParam("id") long id) {
		try {
			carParkBean.delete(id);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	@POST
	@Path("/save")
	@Produces("application/json")
	public boolean save( CarPark carPark) {
		try {
			carParkBean.save(carPark);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	@GET
	@Path("/find")
	@Produces("application/json")
	public CarPark find(
			@QueryParam("id") long id) {
		try {
			return carParkBean.find(id);
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	@GET
	@Path("/list")
	@Produces("application/json")
	public List<CarPark> findAll() {
		try {
			return carParkBean.findAll();
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
}

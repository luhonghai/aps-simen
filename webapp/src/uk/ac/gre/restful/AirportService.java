package uk.ac.gre.restful;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import uk.ac.gre.entities.AirPort;
import uk.ac.gre.remote.IAirPort;
import uk.ac.gre.remote.bean.AirPortBean;
import uk.ac.gre.utils.ClientUtility;

@Path("airport")
public class AirportService {
	
	private IAirPort airportBean;
	
	public AirportService() {
		airportBean = (IAirPort) ClientUtility.lookup(AirPortBean.class, IAirPort.class);
	}
	
	@GET
	@Path("/delete")
	@Produces("application/json")
	public boolean delete(
			@QueryParam("id") long id) {
		try {
			airportBean.delete(id);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	@POST
	@Path("/save")
	@Produces("application/json")
	public boolean save( AirPort airport) {
		try {
			airportBean.save(airport);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	@GET
	@Path("/find")
	@Produces("application/json")
	public AirPort find(
			@QueryParam("id") long id) {
		try {
			return airportBean.find(id);
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	@GET
	@Path("/list")
	@Produces("application/json")
	public List<AirPort> findAll() {
		try {
			return airportBean.findAll();
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
}

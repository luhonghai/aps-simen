package uk.ac.gre.restful;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import uk.ac.gre.entities.Currency;
import uk.ac.gre.remote.ICurrency;
import uk.ac.gre.remote.bean.CurrencyBean;
import uk.ac.gre.utils.ClientUtility;

@Path("/currency")
public class ExchangeService {
	private ICurrency currencyBean;
	
	public ExchangeService() {
		currencyBean = (ICurrency) ClientUtility.lookup(CurrencyBean.class, ICurrency.class);
	}
	
	@GET
	@Path("/exchange")
	@Produces("application/json")
	public float exchange(@QueryParam("amount") float amount,@QueryParam("code") String code) {
		Currency c = currencyBean.findByCode(code);
		if (c != null)
			return c.getRate() * amount;
		return 0.0f;
	}

	@GET
	@Path("/list")
	@Produces("application/json")
	public List<Currency> findAll() {
		return currencyBean.findAll();
	}
}

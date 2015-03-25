package uk.ac.gre.utils;

import java.util.Properties;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class ClientUtility {
	private static final String DISTINCT_NAME = "";
	private static final String APP_NAME = "";
	private static final String MODULE_NAME = "WebApp";
	
	private static Context initialContext;
	private static final String PKG_INTERFACES = "org.jboss.ejb.client.naming";
	public static Context getInitialContext() throws NamingException {
		if (initialContext == null) {
			Properties properties = new Properties();
			properties.put(Context.URL_PKG_PREFIXES, PKG_INTERFACES);
			properties.put("jboss.naming.client.ejb.context", true);
			initialContext = new InitialContext(properties);
		}
		return initialContext;
	}
	
	public static String getLookupName(Class bean, Class remote) {
		return "ejb:" + APP_NAME + "/" 
				+ MODULE_NAME + "/" 
				+ DISTINCT_NAME + "/" 
				+ bean.getSimpleName() + "!"
				+ remote.getName();
	}
	
	public static Object lookup(Class bean, Class remote) {
		try {
			return getInitialContext().lookup(getLookupName(bean, remote));
		} catch (NamingException e) {
			e.printStackTrace();
			return null;
		}
	}
}

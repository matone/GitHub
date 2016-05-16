package util;

import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import remote.HibFacadeBeanRemote;

public class FacadeRemoteUtil {
	
	public HibFacadeBeanRemote getHibFacadeBeanRemote(){
		
		try {
			Context context;
			Object result = null;
			Hashtable jndiProperties = new Hashtable();
			jndiProperties.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
			context = new InitialContext(jndiProperties);			
			result = context.lookup("ejb:EJBEar/EJBServer//HibFacadeBean!remote.HibFacadeBeanRemote");
			HibFacadeBeanRemote remote = (HibFacadeBeanRemote) result;
			return remote;
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	
}

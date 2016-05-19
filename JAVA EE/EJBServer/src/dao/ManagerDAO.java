package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.people.Manager;


public class ManagerDAO {

	/**
	 * Finds manager by given attributes
	 * @param em The EntityManager used to create and remove persistent entity instances, to find entities by their primary key, and to query over entities.
	 * @param input manager, with attributes to find
	 * @return Returns manager with wanted attributes
	 */
	public Manager getManagerByStats(EntityManager em, Manager input){
		
		TypedQuery<Manager> q = em.createNamedQuery("Manager.getManagerByStats", Manager.class)
									.setParameter("firstName", input.getFirstName())
									.setParameter("lastName", input.getLastName())
									.setParameter("city", input.getCity())
									.setParameter("street", input.getStreet())
									.setParameter("postalCode", input.getPostalCode())
									.setParameter("phoneNumber", input.getPhoneNumber())
									.setParameter("email", input.getEmail());
		
		List<Manager> managers = q.getResultList();
		
		if (managers.size() == 0){
			return null;
		} else{
			return managers.get(0);
		}
		
	}	
}

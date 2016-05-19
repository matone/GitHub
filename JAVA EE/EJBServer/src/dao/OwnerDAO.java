package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.people.Owner;

public class OwnerDAO {
	
	/**
	 * Finds owner by given attributes
	 * @param em The EntityManager used to create and remove persistent entity instances, to find entities by their primary key, and to query over entities.
	 * @param input owner, with attributes to find
	 * @return Returns owner with wanted attributes
	 */
	public Owner getOwnerByStats(EntityManager em, Owner input){
		
		TypedQuery<Owner> q = em.createNamedQuery("Owner.getOwnerByStats", Owner.class)
									.setParameter("firstName", input.getFirstName())
									.setParameter("lastName", input.getLastName())
									.setParameter("city", input.getCity())
									.setParameter("street", input.getStreet())
									.setParameter("postalCode", input.getPostalCode())
									.setParameter("phoneNumber", input.getPhoneNumber())
									.setParameter("email", input.getEmail());
		
		List<Owner> owners = q.getResultList();
		
		if (owners.size() == 0){
			return null;
		} else{
			return owners.get(0);
		}
	}
	
}

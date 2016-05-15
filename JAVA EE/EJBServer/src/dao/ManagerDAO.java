package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.people.Manager;


public class ManagerDAO {

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
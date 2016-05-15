package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.Rent;

public class RentDAO {
	

	public List<Rent> getRentsByGraveOwner(EntityManager em, int graveId, int ownerId){
		
		TypedQuery<Rent> q = em.createNamedQuery("Rent.getRentsByGraveIdOwnerId", Rent.class).setParameter("graveId", graveId).setParameter("ownerId", ownerId);
		
		List<Rent> rents = q.getResultList();
		
		return rents;
	}
	
}

package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.Rent;

public class RentDAO {
	
	/**
	 * Finds all rents with according grave and owner ID
	 * @param em The EntityManager used to create and remove persistent entity instances, to find entities by their primary key, and to query over entities
	 * @param graveId ID of grave of the management
	 * @param ownerId ID of owner of the management
	 * @return Returns Returns list of rents with specific sector and 
	 */
	public List<Rent> getRentsByGraveOwner(EntityManager em, int graveId, int ownerId){
		
		TypedQuery<Rent> q = em.createNamedQuery("Rent.getRentsByGraveIdOwnerId", Rent.class).setParameter("graveId", graveId).setParameter("ownerId", ownerId);
		
		List<Rent> rents = q.getResultList();
		
		return rents;
	}
	
}

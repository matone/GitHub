package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.Funeral;

public class FuneralDAO {
	
	/**
	 * Finds all funerals according to IDs of grave and deceased
	 * @param em The EntityManager used to create and remove persistent entity instances, to find entities by their primary key, and to query over entities
	 * @param graveId ID of grave which is used to find funerals
	 * @param deceasedId ID of deceased which is used to find funerals
	 * @return Returns list of funerals with specific grave and decease IDs
	 */
	public List<Funeral> getFuneralsByGraveDeceased(EntityManager em, int graveId, int deceasedId){
		
		TypedQuery<Funeral> q = em.createNamedQuery("Funeral.getFuneralsByGraveIdOwnerId", Funeral.class).setParameter("graveId", graveId).setParameter("deceasedId", deceasedId);
		
		List<Funeral> funerals = q.getResultList();
		
		return funerals;
	}
	
}

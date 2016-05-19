package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.places.Grave;

public class GraveDAO {

	
	/**
	 * Finds grave according to grave ID
	 * @param em The EntityManager used to create and remove persistent entity instances, to find entities by their primary key, and to query over entities
	 * @param id ID of searched grave
	 * @return Returns grave with specific ID
	 */
	public Grave getGraveById(EntityManager em, int id){
		
		TypedQuery<Grave> q =  em.createNamedQuery("Grave.getGraveById", Grave.class).setParameter("id", id);
		
		List<Grave> graves = q.getResultList();

		if (graves.size() == 0){
			return null;
		} else{
			return graves.get(0);
		}
		
	}
	
	/**
	 * Finds grave according to sector and grave number
	 * @param em The EntityManager used to create and remove persistent entity instances, to find entities by their primary key, and to query over entities
	 * @param sectorNumber
	 * @param graveNumber
	 * @return Returns grave with specific sector and grave number
	 */
	public Grave getGraveByNumberSector(EntityManager em, Integer sectorNumber, Integer graveNumber){
		
		TypedQuery<Grave> q =  em.createNamedQuery("Grave.getGraveByNumberSector", Grave.class)
													.setParameter("graveNumber", graveNumber)
													.setParameter("sectorNumber", sectorNumber);
		
		List<Grave> graves = q.getResultList();

		if (graves.size() == 0){
			return null;
		} else{
			return graves.get(0);
		}
		
	}
	
}

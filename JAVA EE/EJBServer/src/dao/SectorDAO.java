package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.people.Owner;
import model.places.Grave;
import model.places.Sector;

public class SectorDAO {
	
	public List<Sector> getScheme(EntityManager em){
		
		TypedQuery<Sector> q = em.createNamedQuery("Sector.findAllWithGraves", Sector.class);
		
		List<Sector> sectors = q.getResultList();
		
		for (Sector curSector : sectors) {
			List<Grave> graves = new ArrayList<Grave>();
			
			for (Grave curGrave : curSector.getGraves()) {
				em.detach(curGrave);
				curGrave.setRents(null);
				curGrave.setFunerals(null);
				graves.add(curGrave);
			}
			
			curSector.setGraves(graves);
			em.detach(curSector);
			
		}	
		return sectors;
	}
	
	public Sector getSectorById(EntityManager em, int id){
		
		TypedQuery<Sector> q = em.createNamedQuery("Sector.getSectorById", Sector.class).setParameter("id", id);
		
		List<Sector> sectors = q.getResultList();
		
		if (sectors.size() == 0){
			return null;
		} else{
			return sectors.get(0);
		}
	}	
}
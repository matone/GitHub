package executive;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceException;

import dao.ApplicantDAO;
import dao.DeceasedDAO;
import dao.FuneralDAO;
import dao.GraveDAO;
import dao.ManagementDAO;
import dao.ManagerDAO;
import dao.OwnerDAO;
import dao.RentDAO;
import dao.SectorDAO;
import model.Funeral;
import model.Management;
import model.Rent;
import model.people.Applicant;
import model.people.Deceased;
import model.people.Manager;
import model.people.Owner;
import model.places.Grave;
import model.places.Sector;

@Stateless
public class HibExecutiveBean {
	
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Grave getGraveById(EntityManager em, int id) throws PersistenceException {
		
		GraveDAO gDao = new GraveDAO();
		
		Grave grave = gDao.getGraveById(em, id);
		
		List<Funeral> funerals = new ArrayList<Funeral>();
		List<Rent> rents = new ArrayList<Rent>();
			
		for (Rent curRent : grave.getRents()) {
			em.detach(curRent.getOwner());
			em.detach(curRent);
			curRent.getOwner().setRents(null);
			rents.add(curRent);
		}
		
		for (Funeral curFuneral : grave.getFunerals()) {
			em.detach(curFuneral.getDeceased());
			em.detach(curFuneral);
			curFuneral.getDeceased().setExhumations(null);
			curFuneral.getDeceased().setFunerals(null);
			curFuneral.setApplicant(null);
			funerals.add(curFuneral);
		}
		
		em.detach(grave.getSector());
		grave.getSector().setManagements(null);
		grave.getSector().setGraves(null);
		
		em.detach(grave);
		grave.setRents(rents);
		grave.setFunerals(funerals);
		
		return grave;
	}
	
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Sector getSectorById(EntityManager em, int id) throws PersistenceException {
		SectorDAO sDao = new SectorDAO();
		
		Sector sector = sDao.getSectorById(em, id);
		
		List<Management> managements = new ArrayList<Management>();
		
		for (Management curManagement : sector.getManagements()) {
			em.detach(curManagement.getManager());
			em.detach(curManagement);
			curManagement.getManager().setManagements(null);
			managements.add(curManagement);
		}		
		
		em.detach(sector);
		sector.setGraves(null);
		sector.setManagements(managements);
		
		return sector;		
	}
	
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Sector> getSectorTree(EntityManager em) throws PersistenceException {
		
		SectorDAO sDao = new SectorDAO();
		
		List<Sector> sectors = sDao.getScheme(em);
		
		for (Sector curSector : sectors) {
			List<Grave> graves = new ArrayList<Grave>();
			
			for (Grave curGrave : curSector.getGraves()) {
				curGrave.setRents(null);
				em.detach(curGrave);
				graves.add(curGrave);
			}
			curSector.setManagements(null);
			curSector.setGraves(graves);
			em.detach(curSector);
		}
		return sectors;
	}

	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Rent> getRentsByGraveOwner(EntityManager em, int graveId, int ownerId) throws PersistenceException {

		RentDAO rDao = new RentDAO();
		
		List<Rent> rents = rDao.getRentsByGraveOwner(em, graveId, ownerId);
		
		for (Rent curRent : rents) {
			em.detach(curRent);
			curRent.setGrave(null);
			curRent.setOwner(null);
		}
		
		return rents;
	}
	
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Funeral> getFuneralsByGraveDeceased(EntityManager em, int graveId, int deceasedId) throws PersistenceException {
		FuneralDAO fDao = new FuneralDAO();
		
		List<Funeral> funerals = fDao.getFuneralsByGraveDeceased(em, graveId, deceasedId);
		
		for (Funeral curFuneral : funerals) {
			em.detach(curFuneral);
			curFuneral.setGrave(null);
			curFuneral.setApplicant(null);
			curFuneral.setDeceased(null);
		}
		
		return funerals;
	}

	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Management> getManagementsBySectorManager(EntityManager em, int graveId, int deceasedId) throws PersistenceException {
		ManagementDAO mDao = new ManagementDAO();
		
		List<Management> managements = mDao.getManagementsBySectorManager(em, graveId, deceasedId);
		
		for (Management curManagement : managements) {
			em.detach(curManagement);
			curManagement.setSector(null);
			curManagement.setManager(null);
		}
		
		return managements;
	}

	public Integer insertSector(EntityManager em, Sector sector) throws PersistenceException {
		
		em.persist(sector);
		
		return sector.getId();
	}

	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Integer createGrave(EntityManager em, Grave grave, Sector sector) throws PersistenceException {
		Sector sectorDB = em.find(Sector.class, sector.getId());
		
		grave.setSector(sectorDB);
		
		sectorDB.setFullGravesNumber(sectorDB.getFullGravesNumber()+1);
		
		
		em.persist(grave);
		
		return grave.getId();
	}

	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void updateGrave(EntityManager em, Grave grave) throws PersistenceException {
		
		Grave graveDB = em.find(Grave.class, grave.getId());
		
		graveDB.setGraveNumber(grave.getGraveNumber());
		graveDB.setAllPlacesNumber(grave.getAllPlacesNumber());
	}
	
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void updateSector(EntityManager em, Sector sector) throws PersistenceException {
		
		Sector sectorDB = em.find(Sector.class, sector.getId());
		
		sectorDB.setAllGravesNumber(sector.getAllGravesNumber());
		sectorDB.setSectorNumber(sector.getSectorNumber());
		sectorDB.setSize(sector.getSize());
	}

	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void removeGrave(EntityManager em, Grave grave) throws PersistenceException {
		
		Grave graveDB = em.getReference(Grave.class, grave.getId());
		
		em.remove(graveDB);
	}
	
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void removeSector(EntityManager em, Sector sector) throws PersistenceException {
		
		Sector sectorDB = em.getReference(Sector.class, sector.getId());
		
		em.remove(sectorDB);
	}
	
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Integer insertManager(EntityManager em, Manager manager, Sector sector) throws PersistenceException {
		ManagerDAO oDao = new ManagerDAO();
		
		Sector sectorDB = em.find(Sector.class, sector.getId());
		
		for (Management curManagement : sectorDB.getManagements()) {
			if (curManagement.getDateTo() == null) {
				curManagement.setDateTo(Calendar.getInstance());
			}
		}
		
		Manager managerDB = oDao.getManagerByStats(em, manager);
		Management management;
		
		if (managerDB==null) {
			em.persist(manager);
			management = new Management(sector, manager);
		} else {
			management = new Management(sector, managerDB);
		}
		
		em.persist(management);
		return management.getManager().getId();
	}
	
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Integer insertOwner(EntityManager em, Owner owner, Grave grave) throws PersistenceException {	
		OwnerDAO oDao = new OwnerDAO();
		
		Grave graveDB = em.find(Grave.class, grave.getId());
		
		for (Rent curRent : graveDB.getRents()) {
			if (curRent.getDateTo() == null) {
				curRent.setDateTo(Calendar.getInstance());
			}
		}
		
		Owner ownerDB = oDao.getOwnerByStats(em, owner);
		
		Rent rent;
		
		if (ownerDB==null) {
			em.persist(owner);
			rent = new Rent(owner, grave);
		} else {
			rent = new Rent(ownerDB, grave);
		}
		
		
		em.persist(rent);
		return rent.getOwner().getId();
	}
	
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void updateManager(EntityManager em, Manager manager) throws PersistenceException {
		em.find(Manager.class, manager.getId());
		
		em.merge(manager);
	}
	
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void updateOwner(EntityManager em, Owner owner) throws PersistenceException {
		em.find(Owner.class, owner.getId());
		
		em.merge(owner);
	}
	
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Grave chceckGraveForFuneral(EntityManager em, Integer sectorNumber, Integer graveNumber) throws PersistenceException {
		GraveDAO gDao = new GraveDAO();
		
		Grave grave = gDao.getGraveByNumberSector(em, sectorNumber, graveNumber);
		if (grave != null){
			
			em.detach(grave.getSector());
			
			grave.getSector().setGraves(null);
			grave.getSector().setManagements(null);
			
			List<Rent> rents = new ArrayList<Rent>();
			
			for (Rent curRent : grave.getRents()) {
				em.detach(curRent);
				em.detach(curRent.getOwner());
				
				curRent.getOwner().setRents(null);
				
				rents.add(curRent);
			}

			grave.setRents(rents);		
			
			if ((grave.getRents()!= null) && (grave.getAllPlacesNumber() > grave.getFullPlacesNumber())) {	
				return grave;
			}
			
		}
			
		return null;	
		
	}
	
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Applicant getApplicantByStats(EntityManager em, Applicant applicant) throws PersistenceException {
		ApplicantDAO aDao = new ApplicantDAO();
		
		Applicant applicantDB = aDao.getApplicantByStats(em, applicant);
		
		if (applicantDB==null) {
			em.persist(applicant);
			return applicant;	
		} else {
			
		}
		
		return applicantDB;
	}
	
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Funeral insertFuneral(EntityManager em, Applicant applicant, Grave grave, Funeral funeral, Deceased deceased) throws PersistenceException {
		ApplicantDAO aDao = new ApplicantDAO();
		DeceasedDAO dDao = new DeceasedDAO();
		
		Applicant applicantDB = aDao.getApplicantByStats(em, applicant);
		Deceased deceasedDB = dDao.getDeceasedByStats(em, deceased);
		
		if (applicantDB == null) {
			applicantDB = applicant;
			em.persist(applicantDB);
		}
		
		if (deceasedDB == null) {
			deceasedDB = deceased;
			em.persist(deceasedDB);
		}
		
		funeral.setGrave(grave);
		funeral.setApplicant(applicantDB);
		funeral.setDeceased(deceasedDB);
		
		em.persist(funeral);
		
		return funeral;
	}

}




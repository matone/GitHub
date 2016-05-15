package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.people.Applicant;

public class ApplicantDAO {
	
public Applicant getApplicantByStats(EntityManager em, Applicant input){
		
		TypedQuery<Applicant> q = em.createNamedQuery("Applicant.getApplicantByStats", Applicant.class)
									.setParameter("firstName", input.getFirstName())
									.setParameter("lastName", input.getLastName())
									.setParameter("city", input.getCity())
									.setParameter("street", input.getStreet())
									.setParameter("postalCode", input.getPostalCode())
									.setParameter("phoneNumber", input.getPhoneNumber())
									.setParameter("email", input.getEmail());
		
		List<Applicant> applicants = q.getResultList();
		
		if (applicants.size() == 0){
			return null;
		} else{
			return applicants.get(0);
		}
	}

}

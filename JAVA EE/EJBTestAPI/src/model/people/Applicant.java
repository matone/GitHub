package model.people;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import model.Exhumation;
import model.Funeral;

@Entity
@Table(name="applicant")
@NamedQueries({	
	@NamedQuery(name = "Applicant.getApplicantByStats",
	query = "select a from Applicant a "+
			"where a.firstName = :firstName "+
			"AND a.lastName = :lastName "+
			"AND a.city = :city "+
			"AND a.street = :street "+
			"AND a.postalCode = :postalCode "+
			"AND a.phoneNumber = :phoneNumber "+
			"AND a.email = :email")
})
public class Applicant extends Person{

	private static final long serialVersionUID = -694815369781152440L;
	
	private Set<Funeral> funerals;
	
	private Set<Exhumation> exhumations;
	
	@OneToMany (mappedBy = "applicant")
	public Set<Funeral> getFunerals() {
		return funerals;
	}
	public void setFunerals(Set<Funeral> funerals) {
		this.funerals = funerals;
	}
	
	@OneToMany (mappedBy = "applicant")
	public Set<Exhumation> getExhumations() {
		return exhumations;
	}
	public void setExhumations(Set<Exhumation> exhumations) {
		this.exhumations = exhumations;
	}	
}

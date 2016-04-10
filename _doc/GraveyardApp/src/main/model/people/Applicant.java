package main.model.people;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import main.model.Exhumation;
import main.model.Funeral;

@Entity
@Table(name="applicant")
public class Applicant extends Person{
	
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
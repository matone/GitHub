package main.model.people;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import main.model.Management;

@Entity
@Table(name = "manager")
public class Manager extends Person{
	private Set<Management> managements;
		
	@OneToMany (mappedBy = "manager")
	public Set<Management> getManagements() {
		return managements;
	}
	public void setManagements(Set<Management> managements) {
		this.managements = managements;
	}
}

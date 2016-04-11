package main.model.people;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import main.model.Rent;

@Entity
@Table(name="owner")
public class Owner extends Person{
	
	private Set<Rent> rents;
	
	
	@OneToMany (mappedBy = "owner")
	public Set<Rent> getRents() {
		return rents;
	}
	public void setRents(Set<Rent> rents) {
		this.rents = rents;
	}
	
}

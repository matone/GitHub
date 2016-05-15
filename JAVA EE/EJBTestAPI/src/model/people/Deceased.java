package model.people;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import model.Exhumation;
import model.Funeral;

@Entity
@Table(name="deceased")
@NamedQueries({	
	@NamedQuery(name = "Deceased.getDeceasedByStats",
	query = "select d from Deceased d "+
			"where d.firstName = :firstName "+
			"AND d.lastName = :lastName "+
			"AND d.age = :age")
})
public class Deceased implements Serializable{

	private static final long serialVersionUID = -7222794000549878883L;
	
	private int id;
	
	private String firstName;
	
	private String lastName;
	
	private int age;
	
	private Set<Exhumation> exhumations;
	
	private Set<Funeral> funerals;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public int getId(){
		return id;
	}
	public void setId(int id){
		this.id = id;
	}
	
	@Column(name = "first_name")
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName=firstName;
	}

	@Column(name = "last_name")
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName=lastName;
	}
	
	@OneToMany (mappedBy = "deceased")
	public Set<Funeral> getFunerals() {
		return funerals;
	}
	public void setFunerals(Set<Funeral> funerals) {
		this.funerals = funerals;
	}
	
	@OneToMany (mappedBy = "deceased")
	public Set<Exhumation> getExhumations() {
		return exhumations;
	}
	public void setExhumations(Set<Exhumation> exhumations) {
		this.exhumations = exhumations;
	}
	
	@Column(name = "age")
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
}
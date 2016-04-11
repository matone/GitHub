package main.model.people;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import javafx.beans.property.SimpleStringProperty;
import main.model.Exhumation;
import main.model.Funeral;

@Entity
@Table(name="deceased")
public class Deceased {
	private int id;
	private SimpleStringProperty firstName = new SimpleStringProperty();
	private SimpleStringProperty lastName = new SimpleStringProperty();
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
		return firstName.get();
	}
	public SimpleStringProperty firstNameProperty() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName.set(firstName);
	}

	@Column(name = "last_name")
	public String getLastName() {
		return lastNameProperty().get();
	}
	public SimpleStringProperty lastNameProperty() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName.set(lastName);
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

package main.model.people;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import javafx.beans.property.SimpleStringProperty;

@MappedSuperclass
public class Person {
	private int id;
	private SimpleStringProperty firstName = new SimpleStringProperty();
	private SimpleStringProperty lastName = new SimpleStringProperty();
	private SimpleStringProperty city = new SimpleStringProperty();
	private SimpleStringProperty street = new SimpleStringProperty();
	private SimpleStringProperty postalCode = new SimpleStringProperty();
	private SimpleStringProperty email = new SimpleStringProperty();
	private SimpleStringProperty phoneNumber = new SimpleStringProperty();
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "id")
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
	
	@Column(name = "city")
	public String getCity(){
		return cityProperty().get();
	}	
	public SimpleStringProperty cityProperty() {
		return city;
	}
	public void setCity(String city) {
		this.city.set(city);
	}
	
	@Column(name = "street")
	public String getStreet(){
		return streetProperty().get();
	}	
	public SimpleStringProperty streetProperty() {
		return street;
	}
	public void setStreet(String street) {
		this.street.set(street);
	}
	
	@Column(name = "postal_code")
	public String getPostalCode(){
		return postalCodeProperty().get();
	}	
	public SimpleStringProperty postalCodeProperty() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode.set(postalCode);
	}
	
	@Column(name = "email")
	public String getEmail(){
		return emailProperty().get();
	}	
	public SimpleStringProperty emailProperty() {
		return email;
	}
	public void setEmail(String email) {
		this.email.set(email);
	}
	
	@Column(name = "phone_number")
	public String getPhoneNumber(){
		return phoneNumberProperty().get();
	}	
	public SimpleStringProperty phoneNumberProperty() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber.set(phoneNumber);
	}
}

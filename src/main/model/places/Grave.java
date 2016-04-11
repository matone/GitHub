package main.model.places;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import main.model.Funeral;
import main.model.Rent;


@Entity
@Table(name="grave")
public class Grave{
	private int id;
	private int graveNumber;
	private int allPlacesNumber;
	private int fullPlacesNumber;
	
	private Set<Rent> rents;
	private Set<Funeral> funerals;
	
	private Sector sector;

	public Grave() {
	}
	
	public Grave(int number, int places, Sector sector) {
		setSector(sector);
		setFullPlacesNumber(0);
		setGraveNumber(number);
		setAllPlacesNumber(places);
	}
		
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "id")
	public int getId(){
		return id;
	}
	public void setId(int id){
		this.id = id;
	}
	
	@Column(name = "grave_number")
	public int getGraveNumber() {
		return graveNumber;
	}
	public void setGraveNumber(int graveNumber) {
		this.graveNumber = graveNumber;
	}
	
	@Column(name = "all_places_number")
	public int getAllPlacesNumber() {
		return allPlacesNumber;
	}
	public void setAllPlacesNumber(int allPlacesNumber) {
		this.allPlacesNumber = allPlacesNumber;
	}
	
	@Column(name = "full_places_number")
	public int getFullPlacesNumber() {
		return fullPlacesNumber;
	}
	public void setFullPlacesNumber(int number) {
		this.fullPlacesNumber = number;
	}

	@ManyToOne
	@JoinColumn(name = "sector_id")
	public Sector getSector() {
		return sector;
	}

	public void setSector(Sector sector) {
		this.sector = sector;
	}
	
	@OneToMany (mappedBy = "grave")
	public Set<Rent> getRents() {
		return rents;
	}
	public void setRents(Set<Rent> rents) {
		this.rents = rents;
	}

	@OneToMany (mappedBy = "grave")
	public Set<Funeral> getFunerals() {
		return funerals;
	}

	public void setFunerals(Set<Funeral> funerals) {
		this.funerals = funerals;
	}

}

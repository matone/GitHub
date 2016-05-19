package model.places;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import model.Funeral;
import model.Rent;


@Entity
@Table(name="grave")
@NamedQueries({
	@NamedQuery(name = "Grave.getGraveById",
				query = "select g from Grave g where g.id = :id"),
	
	@NamedQuery(name = "Grave.getGraveByNumberSector",
				query = "select g from Grave g "+
						"join g.sector s "+
						"where g.graveNumber = :graveNumber "+
						"AND s.sectorNumber = :sectorNumber")
})
public class Grave implements Serializable{

	private static final long serialVersionUID = -2985568366806334956L;
	
	private Integer id;
	
	private int graveNumber;
	
	private int allPlacesNumber;
	
	private int fullPlacesNumber;
	
	private List<Rent> rents;
	
	private List<Funeral> funerals;
	
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
	public Integer getId(){
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
	
	@OneToMany (mappedBy = "grave", cascade=CascadeType.REMOVE)
	public List<Rent> getRents() {
		return rents;
	}
	public void setRents(List<Rent> rents) {
		this.rents = rents;
	}

	@OneToMany (mappedBy = "grave", cascade=CascadeType.REMOVE)
	public List<Funeral> getFunerals() {
		return funerals;
	}

	public void setFunerals(List<Funeral> funerals) {
		this.funerals = funerals;
	}

}

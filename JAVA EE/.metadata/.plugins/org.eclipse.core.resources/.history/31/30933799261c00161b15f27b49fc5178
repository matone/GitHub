package model.places;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import model.Management;

@Entity
@NamedQueries({
	@NamedQuery(name = "Sector.findAllWithGraves",
				query = "select s from Sector s "+
						"left join fetch s.graves g"),
	
	@NamedQuery(name = "Sector.getSectorById",
				query = "select s from Sector s where s.id = :id"),
	
	@NamedQuery(name = "Sector.getSectorBySectorNumber",
				query = " from Sector s where s.sectorNumber = :sectorNumber")
})
public class Sector implements Serializable{

	private static final long serialVersionUID = 925828546029219981L;
	
	private Integer id;
	
	private int size;
	
	private int allGravesNumber;
	
	private int fullGravesNumber=0;
	
	private int sectorNumber;
	
	private List<Grave> graves;
	
	private List<Management> managements;
	
	public Sector(){
	}
	
	public Sector(int number, int size, int gravesNumber){
		setSectorNumber(number);
		setAllGravesNumber(gravesNumber);
		setSize(size);
	}	
	
	public Sector(int number){
		setSectorNumber(number);
	}	

    @Id
    @SequenceGenerator( name = "sectorSeq", sequenceName = "SECTOR_SEQ", allocationSize = 1, initialValue = 1 )
    @GeneratedValue( strategy = GenerationType.SEQUENCE, generator = "sectorSeq" )
	public Integer getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	@OneToMany (mappedBy = "sector")
	public List<Grave> getGraves() {
		return graves;
	}
	public void setGraves(List<Grave> graves) {
		this.graves = graves;
	}

	@Column(name = "size")
	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	@Column(name = "all_graves_number")
	public int getAllGravesNumber() {
		return allGravesNumber;
	}

	public void setAllGravesNumber(int allGravesNumber) {
		this.allGravesNumber = allGravesNumber;
	}

	@Column(name = "full_graves_number")
	public int getFullGravesNumber() {
		return fullGravesNumber;
	}

	public void setFullGravesNumber(int fullGravesNumber) {
		this.fullGravesNumber = fullGravesNumber;
	}

	@Column(name = "sector_number")
	public int getSectorNumber() {
		return sectorNumber;
	}

	public void setSectorNumber(int sectorNumber) {
		this.sectorNumber = sectorNumber;
	}

	@OneToMany (mappedBy = "sector")
	public List<Management> getManagements() {
		return managements;
	}

	public void setManagements(List<Management> managements) {
		this.managements = managements;
	}
}

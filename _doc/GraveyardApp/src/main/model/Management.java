package main.model;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import main.model.people.Manager;
import main.model.places.Sector;

@Entity
@Table(name="management")
public class Management {
	private int id;
	private Manager manager;
	private Sector sector;
	private Calendar dateFrom = Calendar.getInstance();
	private Calendar dateTo;
	
	public Management() {
	}
	
	public Management(Sector sector, Manager manager) {
		setSector(sector);
		setManager(manager);
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

	@ManyToOne
	@JoinColumn(name = "manager_id", nullable = false)
	public Manager getManager(){
		return manager;
	}
	public void setManager(Manager manager){
		this.manager = manager;
	}
	
	@ManyToOne
	@JoinColumn(name = "sector_id", nullable = false)
	public Sector getSector(){
		return sector;
	}
	public void setSector(Sector sector){
		this.sector = sector;
	}

	@Column(name = "date_from")
	public Calendar getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(Calendar dateFrom) {
		this.dateFrom = dateFrom;
	}

	@Column(name = "date_to")
	public Calendar getDateTo() {
		return dateTo;
	}
	
	public void setDateTo(Calendar dateTo) {
		this.dateTo = dateTo;
	}

	public void setIntDateFrom(int year,int month,int date,int hourOfDay,int minute) {
		dateFrom.clear();
		this.dateFrom.set(year, month, date, hourOfDay, minute);
	}
	public void setIntDateTo(int year,int month,int date,int hourOfDay,int minute) {
		dateTo = Calendar.getInstance();
		this.dateTo.set(year, month, date, hourOfDay, minute);
	}
}

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

import main.model.people.Applicant;
import main.model.people.Deceased;
import main.model.places.Grave;

@Entity
@Table(name="funeral")
public class Funeral {
	private int id;
	private Deceased deceased;
	private Grave grave;
	private Applicant applicant;
	private Calendar dateFrom = Calendar.getInstance();
	private Calendar dateTo;
	
	public Funeral() {
	}
	
	public Funeral(Deceased deceased, Grave grave, Applicant applicant) {
		setDeceased(deceased);
		setGrave(grave);
		setApplicant(applicant);
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@ManyToOne
	@JoinColumn(name = "grave_id", nullable = false)
	public Grave getGrave() {
		return grave;
	}
	public void setGrave(Grave grave) {
		this.grave = grave;
	}
	
	@ManyToOne
	@JoinColumn(name = "applicant_id", nullable = false)
	public Applicant getApplicant() {
		return applicant;
	}
	
	public void setApplicant(Applicant applicant) {
		this.applicant = applicant;
	}
	
	@ManyToOne
	@JoinColumn(name = "deceased_id", nullable = false)
	public Deceased getDeceased() {
		return deceased;
	}
	public void setDeceased(Deceased deceased) {
		this.deceased = deceased;
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

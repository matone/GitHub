package model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import model.people.Applicant;
import model.people.Deceased;

@Entity
@Table(name="exhumation")
public class Exhumation implements Serializable{

	private static final long serialVersionUID = -6938598767503375186L;
	
	private int id;
	
	private Calendar dateFrom = Calendar.getInstance();
	
	private Deceased deceased;
	
	private Applicant applicant;

	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@ManyToOne
	@JoinColumn(name = "deceased_id", nullable = false)
	public Deceased getDeceased() {
		return deceased;
	}
	public void setDeceased(Deceased deceased) {
		this.deceased = deceased;
	}
	
	@ManyToOne
	@JoinColumn(name = "applicant_id", nullable = false)
	public Applicant getApplicant() {
		return applicant;
	}
	public void setApplicant(Applicant applicant) {
		this.applicant = applicant;
	}
	
	@Column(name = "date_from")
	public Calendar getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(Calendar dateFrom) {
		this.dateFrom = dateFrom;
	}

	public void setIntDateFrom(int year,int month,int date,int hourOfDay,int minute) {
		dateFrom.clear();
		this.dateFrom.set(year, month, date, hourOfDay, minute);
	}
	
}

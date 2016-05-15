package model.people;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import model.Rent;

@Entity
@Table(name="owner")
@NamedQueries({
	@NamedQuery(name = "Owner.findAll",
				query = "select o from Owner o "+
						"left join fetch o.rents s"),
	
	@NamedQuery(name = "Owner.getOwnerByStats",
	query = "select o from Owner o "+
			"where o.firstName = :firstName "+
			"AND o.lastName = :lastName "+
			"AND o.city = :city "+
			"AND o.street = :street "+
			"AND o.postalCode = :postalCode "+
			"AND o.phoneNumber = :phoneNumber "+
			"AND o.email = :email")
})
public class Owner extends Person{

	private static final long serialVersionUID = -5132696910248698406L;
	
	private List<Rent> rents;
	
	
	@OneToMany (mappedBy = "owner")
	public List<Rent> getRents() {
		return rents;
	}
	
	public void setRents(List<Rent> rents) {
		this.rents = rents;
	}
	
}

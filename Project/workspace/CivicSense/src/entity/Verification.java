package entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the VERIFICATION database table.
 * 
 */
@Entity
public class Verification implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="VERIFICATION_ID")
	private String verificationId;

	private String name;

	//bi-directional many-to-one association to Citizen
	@OneToMany(mappedBy="verification")
	private List<Citizen> citizens;

	//bi-directional many-to-one association to Ngo
	@OneToMany(mappedBy="verification")
	private List<Ngo> ngos;

	//bi-directional many-to-one association to Location
    @ManyToOne
	@JoinColumn(name="LOCATION_ID")
	private Location location;

    public Verification() {
    }

	public String getVerificationId() {
		return this.verificationId;
	}

	public void setVerificationId(String verificationId) {
		this.verificationId = verificationId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Citizen> getCitizens() {
		return this.citizens;
	}

	public void setCitizens(List<Citizen> citizens) {
		this.citizens = citizens;
	}
	
	public List<Ngo> getNgos() {
		return this.ngos;
	}

	public void setNgos(List<Ngo> ngos) {
		this.ngos = ngos;
	}
	
	public Location getLocation() {
		return this.location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}
	
}
package entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the LOCATION database table.
 * 
 */
@Entity
public class Location implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="LOCATION_ID")
	private int locationId;

	private String ward;

	@Column(name="\"ZONE\"")
	private String zone;

	//bi-directional many-to-one association to Citizen
	@OneToMany(mappedBy="location")
	private List<Citizen> citizens;

	//bi-directional many-to-one association to Complaintdetail
	@OneToMany(mappedBy="location")
	private List<Complaintdetail> complaintdetails;

	//bi-directional many-to-one association to Group
	@OneToMany(mappedBy="location")
	private List<Group> groups;

	//bi-directional many-to-one association to Ngo
	@OneToMany(mappedBy="location")
	private List<Ngo> ngos;

	//bi-directional many-to-one association to Suggestion
	@OneToMany(mappedBy="location")
	private List<Suggestion> suggestions;

	//bi-directional many-to-one association to Verification
	@OneToMany(mappedBy="location")
	private List<Verification> verifications;

    public Location() {
    }

	public int getLocationId() {
		return this.locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public String getWard() {
		return this.ward;
	}

	public void setWard(String ward) {
		this.ward = ward;
	}

	public String getZone() {
		return this.zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public List<Citizen> getCitizens() {
		return this.citizens;
	}

	public void setCitizens(List<Citizen> citizens) {
		this.citizens = citizens;
	}
	
	public List<Complaintdetail> getComplaintdetails() {
		return this.complaintdetails;
	}

	public void setComplaintdetails(List<Complaintdetail> complaintdetails) {
		this.complaintdetails = complaintdetails;
	}
	
	public List<Group> getGroups() {
		return this.groups;
	}

	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}
	
	public List<Ngo> getNgos() {
		return this.ngos;
	}

	public void setNgos(List<Ngo> ngos) {
		this.ngos = ngos;
	}
	
	public List<Suggestion> getSuggestions() {
		return this.suggestions;
	}

	public void setSuggestions(List<Suggestion> suggestions) {
		this.suggestions = suggestions;
	}
	
	public List<Verification> getVerifications() {
		return this.verifications;
	}

	public void setVerifications(List<Verification> verifications) {
		this.verifications = verifications;
	}
	
}
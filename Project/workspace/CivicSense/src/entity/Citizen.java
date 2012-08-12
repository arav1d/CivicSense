package entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the CITIZEN database table.
 * 
 */
@Entity
public class Citizen implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="USER_ID")
	private int userId;

	private int age;

	private String door;

	private String email;

	private String fname;

	private String lname;

	@Column(name="\"PASSWORD\"")
	private String password;

	private long phone;

	private String sex;

	private String street;

	private String username;

	//bi-directional many-to-one association to Location
    @ManyToOne
	@JoinColumn(name="LOC_ID")
	private Location location;

	//bi-directional many-to-one association to Verification
    @ManyToOne
	@JoinColumn(name="VERIFYID")
	private Verification verification;

	//bi-directional many-to-one association to Complaintdetail
	@OneToMany(mappedBy="citizen")
	private List<Complaintdetail> complaintdetails;

	//bi-directional many-to-one association to Groupcontent
	@OneToMany(mappedBy="citizen")
	private List<Groupcontent> groupcontents;

	//bi-directional many-to-one association to Suggestion
	@OneToMany(mappedBy="citizen")
	private List<Suggestion> suggestions;

    public Citizen() {
    }

	public int getUserId() {
		return this.userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getAge() {
		return this.age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getDoor() {
		return this.door;
	}

	public void setDoor(String door) {
		this.door = door;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFname() {
		return this.fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return this.lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public long getPhone() {
		return this.phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getStreet() {
		return this.street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Location getLocation() {
		return this.location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}
	
	public Verification getVerification() {
		return this.verification;
	}

	public void setVerification(Verification verification) {
		this.verification = verification;
	}
	
	public List<Complaintdetail> getComplaintdetails() {
		return this.complaintdetails;
	}

	public void setComplaintdetails(List<Complaintdetail> complaintdetails) {
		this.complaintdetails = complaintdetails;
	}
	
	public List<Groupcontent> getGroupcontents() {
		return this.groupcontents;
	}

	public void setGroupcontents(List<Groupcontent> groupcontents) {
		this.groupcontents = groupcontents;
	}
	
	public List<Suggestion> getSuggestions() {
		return this.suggestions;
	}

	public void setSuggestions(List<Suggestion> suggestions) {
		this.suggestions = suggestions;
	}
	
}
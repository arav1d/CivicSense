package entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the NGO database table.
 * 
 */
@Entity
public class Ngo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="NGO_ID")
	private int ngoId;

	@Column(name="\"DESC\"")
	private String desc;

	private String email;

	private String motto;

	private String name;

	@Column(name="OFF_ADDR")
	private String offAddr;

	@Column(name="\"PASSWORD\"")
	private String password;

	@Column(name="PH_NO")
	private long phNo;

	private String username;

	//bi-directional many-to-one association to Group
	@OneToMany(mappedBy="ngo")
	private List<Group> groups;

	//bi-directional many-to-one association to Location
    @ManyToOne
	@JoinColumn(name="LOC_ID")
	private Location location;

	//bi-directional many-to-one association to Verification
    @ManyToOne
	@JoinColumn(name="VERIFY_ID")
	private Verification verification;

    public Ngo() {
    }

	public int getNgoId() {
		return this.ngoId;
	}

	public void setNgoId(int ngoId) {
		this.ngoId = ngoId;
	}

	public String getDesc() {
		return this.desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMotto() {
		return this.motto;
	}

	public void setMotto(String motto) {
		this.motto = motto;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOffAddr() {
		return this.offAddr;
	}

	public void setOffAddr(String offAddr) {
		this.offAddr = offAddr;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public long getPhNo() {
		return this.phNo;
	}

	public void setPhNo(long phNo) {
		this.phNo = phNo;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<Group> getGroups() {
		return this.groups;
	}

	public void setGroups(List<Group> groups) {
		this.groups = groups;
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
	
}
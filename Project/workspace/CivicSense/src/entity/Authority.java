package entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the AUTHORITY database table.
 * 
 */
@Entity
public class Authority implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="AUTHORITY_ID")
	private int authorityId;

	private int credits;

	private String dept;

	private String email;

	private String fname;

	private String lname;

	@Column(name="OFF_ADDR")
	private String offAddr;

	@Column(name="\"PASSWORD\"")
	private String password;

	@Column(name="PH_NO")
	private long phNo;

	private String sex;

	private String username;

	private String ward;

	@Column(name="\"ZONE\"")
	private String zone;

	//bi-directional many-to-one association to Complaintdetail
	@OneToMany(mappedBy="authority")
	private List<Complaintdetail> complaintdetails;

	//bi-directional many-to-one association to Memo
	@OneToMany(mappedBy="authority")
	private List<Memo> memos;

	//bi-directional many-to-one association to Suggestion
	@OneToMany(mappedBy="authority")
	private List<Suggestion> suggestions;

    public Authority() {
    }

	public int getAuthorityId() {
		return this.authorityId;
	}

	public void setAuthorityId(int authorityId) {
		this.authorityId = authorityId;
	}

	public int getCredits() {
		return this.credits;
	}

	public void setCredits(int credits) {
		this.credits = credits;
	}

	public String getDept() {
		return this.dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
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

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public List<Complaintdetail> getComplaintdetails() {
		return this.complaintdetails;
	}

	public void setComplaintdetails(List<Complaintdetail> complaintdetails) {
		this.complaintdetails = complaintdetails;
	}
	
	public List<Memo> getMemos() {
		return this.memos;
	}

	public void setMemos(List<Memo> memos) {
		this.memos = memos;
	}
	
	public List<Suggestion> getSuggestions() {
		return this.suggestions;
	}

	public void setSuggestions(List<Suggestion> suggestions) {
		this.suggestions = suggestions;
	}
	
}
package entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the ADMINISTRATOR database table.
 * 
 */
@Entity
public class Administrator implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ADMIN_ID")
	private int adminId;

	private String email;

	private String fname;

	private String lname;

	@Column(name="\"PASSWORD\"")
	private String password;

	@Column(name="PH_NO")
	private long phNo;

	private String sex;

	private String username;

	@Column(name="\"ZONE\"")
	private String zone;

	//bi-directional many-to-one association to Memo
	@OneToMany(mappedBy="administrator")
	private List<Memo> memos;

    public Administrator() {
    }

	public int getAdminId() {
		return this.adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
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

	public String getZone() {
		return this.zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public List<Memo> getMemos() {
		return this.memos;
	}

	public void setMemos(List<Memo> memos) {
		this.memos = memos;
	}
	
}
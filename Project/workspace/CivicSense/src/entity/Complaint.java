package entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the COMPLAINT database table.
 * 
 */
@Entity
public class Complaint implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="COMPLAINT_NO")
	private int complaintNo;

	private String dept;

	@Column(name="\"DESC\"")
	private String desc;

	private String level1;

	private String level2;

	private String level3;

	//bi-directional many-to-one association to Complaintdetail
	@OneToMany(mappedBy="complaint")
	private List<Complaintdetail> complaintdetails;

    public Complaint() {
    }

	public int getComplaintNo() {
		return this.complaintNo;
	}

	public void setComplaintNo(int complaintNo) {
		this.complaintNo = complaintNo;
	}

	public String getDept() {
		return this.dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getDesc() {
		return this.desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getLevel1() {
		return this.level1;
	}

	public void setLevel1(String level1) {
		this.level1 = level1;
	}

	public String getLevel2() {
		return this.level2;
	}

	public void setLevel2(String level2) {
		this.level2 = level2;
	}

	public String getLevel3() {
		return this.level3;
	}

	public void setLevel3(String level3) {
		this.level3 = level3;
	}

	public List<Complaintdetail> getComplaintdetails() {
		return this.complaintdetails;
	}

	public void setComplaintdetails(List<Complaintdetail> complaintdetails) {
		this.complaintdetails = complaintdetails;
	}
	
}
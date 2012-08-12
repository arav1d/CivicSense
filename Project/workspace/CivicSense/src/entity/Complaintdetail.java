package entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the COMPLAINTDETAILS database table.
 * 
 */
@Entity
@Table(name="COMPLAINTDETAILS")
public class Complaintdetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="COMPLAINT_ID")
	private int complaintId;

	@Column(name="COMPLAINT_DESC")
	private String complaintDesc;

    @Temporal( TemporalType.DATE)
	@Column(name="\"DATE\"")
	private Date date;

	private String dept;

	@Column(name="\"DESC\"")
	private String desc;

	private String feedback;

	@Column(name="FEEDBACK_TYPE")
	private int feedbackType;

	private int level1status;

	private int level2status;

	private int level3status;

	private String street;

	private int support;

	private int validity;

	//bi-directional many-to-one association to Authority
    @ManyToOne
	@JoinColumn(name="AUTHORITY_ID")
	private Authority authority;

	//bi-directional many-to-one association to Citizen
    @ManyToOne
	@JoinColumn(name="USER_ID")
	private Citizen citizen;

	//bi-directional many-to-one association to Complaint
    @ManyToOne
	@JoinColumn(name="COMPLAINT_NO")
	private Complaint complaint;

	//bi-directional many-to-one association to Location
    @ManyToOne
	@JoinColumn(name="LOC_ID")
	private Location location;

    public Complaintdetail() {
    }

	public int getComplaintId() {
		return this.complaintId;
	}

	public void setComplaintId(int complaintId) {
		this.complaintId = complaintId;
	}

	public String getComplaintDesc() {
		return this.complaintDesc;
	}

	public void setComplaintDesc(String complaintDesc) {
		this.complaintDesc = complaintDesc;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
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

	public String getFeedback() {
		return this.feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public int getFeedbackType() {
		return this.feedbackType;
	}

	public void setFeedbackType(int feedbackType) {
		this.feedbackType = feedbackType;
	}

	public int getLevel1status() {
		return this.level1status;
	}

	public void setLevel1status(int level1status) {
		this.level1status = level1status;
	}

	public int getLevel2status() {
		return this.level2status;
	}

	public void setLevel2status(int level2status) {
		this.level2status = level2status;
	}

	public int getLevel3status() {
		return this.level3status;
	}

	public void setLevel3status(int level3status) {
		this.level3status = level3status;
	}

	public String getStreet() {
		return this.street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public int getSupport() {
		return this.support;
	}

	public void setSupport(int support) {
		this.support = support;
	}

	public int getValidity() {
		return this.validity;
	}

	public void setValidity(int validity) {
		this.validity = validity;
	}

	public Authority getAuthority() {
		return this.authority;
	}

	public void setAuthority(Authority authority) {
		this.authority = authority;
	}
	
	public Citizen getCitizen() {
		return this.citizen;
	}

	public void setCitizen(Citizen citizen) {
		this.citizen = citizen;
	}
	
	public Complaint getComplaint() {
		return this.complaint;
	}

	public void setComplaint(Complaint complaint) {
		this.complaint = complaint;
	}
	
	public Location getLocation() {
		return this.location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}
	
}
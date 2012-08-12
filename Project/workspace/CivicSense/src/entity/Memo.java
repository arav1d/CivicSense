package entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the MEMO database table.
 * 
 */
@Entity
public class Memo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="MEMO_ID")
	private int memoId;

	@Column(name="COMP_DESC")
	private String compDesc;

    @Temporal( TemporalType.DATE)
	@Column(name="\"DATE\"")
	private Date date;

	private String dept;

	@Column(name="\"DESC\"")
	private String desc;

	//bi-directional many-to-one association to Administrator
    @ManyToOne
	@JoinColumn(name="ADMIN_ID")
	private Administrator administrator;

	//bi-directional many-to-one association to Authority
    @ManyToOne
	@JoinColumn(name="AUTHORITY_ID")
	private Authority authority;

    public Memo() {
    }

	public int getMemoId() {
		return this.memoId;
	}

	public void setMemoId(int memoId) {
		this.memoId = memoId;
	}

	public String getCompDesc() {
		return this.compDesc;
	}

	public void setCompDesc(String compDesc) {
		this.compDesc = compDesc;
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

	public Administrator getAdministrator() {
		return this.administrator;
	}

	public void setAdministrator(Administrator administrator) {
		this.administrator = administrator;
	}
	
	public Authority getAuthority() {
		return this.authority;
	}

	public void setAuthority(Authority authority) {
		this.authority = authority;
	}
	
}
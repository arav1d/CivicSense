package entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the GROUPCONTENTS database table.
 * 
 */
@Entity
@Table(name="GROUPCONTENTS")
public class Groupcontent implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="CONTENTS_ID")
	private long contentsId;

	private String content;

    @Temporal( TemporalType.DATE)
	@Column(name="\"DATE\"")
	private Date date;

	//bi-directional many-to-one association to Citizen
    @ManyToOne
	@JoinColumn(name="USER_ID")
	private Citizen citizen;

	//bi-directional many-to-one association to Group
    @ManyToOne
	@JoinColumn(name="GROUP_ID")
	private Group group;

    public Groupcontent() {
    }

	public long getContentsId() {
		return this.contentsId;
	}

	public void setContentsId(long contentsId) {
		this.contentsId = contentsId;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Citizen getCitizen() {
		return this.citizen;
	}

	public void setCitizen(Citizen citizen) {
		this.citizen = citizen;
	}
	
	public Group getGroup() {
		return this.group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}
	
}
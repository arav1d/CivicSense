package entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the "GROUP" database table.
 * 
 */
@Entity
@Table(name="\"GROUP\"")
public class Group implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="GROUP_ID")
	private int groupId;

    @Temporal( TemporalType.DATE)
	@Column(name="\"DATE\"")
	private Date date;

	@Column(name="\"DESC\"")
	private String desc;

	private String name;

	//bi-directional many-to-one association to Location
    @ManyToOne
	@JoinColumn(name="LOC_ID")
	private Location location;

	//bi-directional many-to-one association to Ngo
    @ManyToOne
	@JoinColumn(name="NGO_ID")
	private Ngo ngo;

	//bi-directional many-to-one association to Groupcontent
	@OneToMany(mappedBy="group")
	private List<Groupcontent> groupcontents;

    public Group() {
    }

	public int getGroupId() {
		return this.groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getDesc() {
		return this.desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Location getLocation() {
		return this.location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}
	
	public Ngo getNgo() {
		return this.ngo;
	}

	public void setNgo(Ngo ngo) {
		this.ngo = ngo;
	}
	
	public List<Groupcontent> getGroupcontents() {
		return this.groupcontents;
	}

	public void setGroupcontents(List<Groupcontent> groupcontents) {
		this.groupcontents = groupcontents;
	}
	
}
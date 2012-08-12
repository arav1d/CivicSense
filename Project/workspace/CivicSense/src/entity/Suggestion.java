package entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the SUGGESTION database table.
 * 
 */
@Entity
public class Suggestion implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="SUGGESTION_ID")
	private int suggestionId;

    @Temporal( TemporalType.DATE)
	@Column(name="\"DATE\"")
	private Date date;

	@Column(name="\"DESC\"")
	private String desc;

	private int support;

	//bi-directional many-to-one association to Authority
    @ManyToOne
	@JoinColumn(name="AUTHORITY_ID")
	private Authority authority;

	//bi-directional many-to-one association to Citizen
    @ManyToOne
	@JoinColumn(name="USER_ID")
	private Citizen citizen;

	//bi-directional many-to-one association to Location
    @ManyToOne
	@JoinColumn(name="LOC_ID")
	private Location location;

    public Suggestion() {
    }

	public int getSuggestionId() {
		return this.suggestionId;
	}

	public void setSuggestionId(int suggestionId) {
		this.suggestionId = suggestionId;
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

	public int getSupport() {
		return this.support;
	}

	public void setSupport(int support) {
		this.support = support;
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
	
	public Location getLocation() {
		return this.location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}
	
}
package entity;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the COMPLAINTSUPPORT database table.
 * 
 */
@Embeddable
public class ComplaintsupportPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="COMPLAINT_ID")
	private int complaintId;

	@Column(name="USER_ID")
	private int userId;

    public ComplaintsupportPK() {
    }
	public int getComplaintId() {
		return this.complaintId;
	}
	public void setComplaintId(int complaintId) {
		this.complaintId = complaintId;
	}
	public int getUserId() {
		return this.userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof ComplaintsupportPK)) {
			return false;
		}
		ComplaintsupportPK castOther = (ComplaintsupportPK)other;
		return 
			(this.complaintId == castOther.complaintId)
			&& (this.userId == castOther.userId);

    }
    
	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.complaintId;
		hash = hash * prime + this.userId;
		
		return hash;
    }
}
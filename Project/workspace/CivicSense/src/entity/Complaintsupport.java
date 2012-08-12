package entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the COMPLAINTSUPPORT database table.
 * 
 */
@Entity
public class Complaintsupport implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private ComplaintsupportPK id;

    public Complaintsupport() {
    }

	public ComplaintsupportPK getId() {
		return this.id;
	}

	public void setId(ComplaintsupportPK id) {
		this.id = id;
	}
	
}
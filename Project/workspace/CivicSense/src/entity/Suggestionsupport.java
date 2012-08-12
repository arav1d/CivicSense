package entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the SUGGESTIONSUPPORT database table.
 * 
 */
@Entity
public class Suggestionsupport implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private SuggestionsupportPK id;

    public Suggestionsupport() {
    }

	public SuggestionsupportPK getId() {
		return this.id;
	}

	public void setId(SuggestionsupportPK id) {
		this.id = id;
	}
	
}
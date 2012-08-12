package entity;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the SUGGESTIONSUPPORT database table.
 * 
 */
@Embeddable
public class SuggestionsupportPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="SUGGESTION_ID")
	private int suggestionId;

	@Column(name="USER_ID")
	private int userId;

    public SuggestionsupportPK() {
    }
	public int getSuggestionId() {
		return this.suggestionId;
	}
	public void setSuggestionId(int suggestionId) {
		this.suggestionId = suggestionId;
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
		if (!(other instanceof SuggestionsupportPK)) {
			return false;
		}
		SuggestionsupportPK castOther = (SuggestionsupportPK)other;
		return 
			(this.suggestionId == castOther.suggestionId)
			&& (this.userId == castOther.userId);

    }
    
	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.suggestionId;
		hash = hash * prime + this.userId;
		
		return hash;
    }
}
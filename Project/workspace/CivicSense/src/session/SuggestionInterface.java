package session;
import java.util.List;

import javax.ejb.Local;

import entity.Authority;
import entity.Citizen;
import entity.Suggestion;
import entity.Suggestionsupport;

@Local
/*
 * Interface for suggestion
 * 
 */
public interface SuggestionInterface {
	/* Method to post suggestion
	 * @param suggestion 
	 */
	public void postSuggestion(Suggestion suggestion);
/*   Method to increment support
 * 
 * 
 */
	public int incrementSupport(int suggestId,int userId);
	public Suggestion getSuggestion(int id);
	public List<Suggestion> getSuggestions(Authority authority);
	public Suggestionsupport getSuggestionSupport(Suggestion suggestion,Citizen user);
}

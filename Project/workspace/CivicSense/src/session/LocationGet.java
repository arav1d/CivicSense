package session;
import java.util.List;

import javax.ejb.Local;

import entity.Location;
import entity.Verification;
import entity.Suggestion;

@Local
public interface LocationGet {
	public Location getLocation(String ward,String zone);
	public Verification getVerification(String verifyId,Location location,String name);
	public List<Suggestion> getSuggestions(Location location);
	public Suggestion getSuggestion(int suggestion);
}

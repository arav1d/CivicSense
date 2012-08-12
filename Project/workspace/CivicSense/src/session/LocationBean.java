package session;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entity.Location;
import entity.Suggestion;
import entity.Verification;

/**
 * Session Bean implementation class LocationBean
 * @author 4MB
 * @version 1.0
 */
@Stateless
public class LocationBean implements LocationGet {

    /**
     * Default constructor. 
     */
	@PersistenceContext(unitName="CivicSense")
	private EntityManager em;
    public LocationBean() {
        // TODO Auto-generated constructor stub
    }

	@SuppressWarnings("unchecked")
	@Override
	/*
	 * Method to return location given the ward and zone
	 * @see session.LocationGet#getLocation(java.lang.String, java.lang.String)
	 * @param ward
	 * @param zone
	 * @return location
	 */
	public Location getLocation(String ward, String zone) {
		Query query=em.createQuery("select loc from Location loc where (loc.ward=?1) AND (loc.zone=?2)").setParameter(1, ward).setParameter(2, zone).setMaxResults(1);
		List<Location> locations=query.getResultList();
		if(!locations.isEmpty())
			return locations.get(0);
		else
			return null;
		}

	@Override
	/* Method to return 
	 * @return verify
	 * @param verifyId
	 * @param location
	 * @param name
	 * @see session.LocationGet#getVerification@see session.GroupInterface#createGroup(entity.Group)(java.lang.String, entity.Location, java.lang.String)
	 */
	public Verification getVerification(String verifyId, Location location,String name) {
		// TODO Auto-generated method stub
		Verification verify= em.find(Verification.class, verifyId);
		if(verify!=null)
		if(verify.getLocation().getLocationId()==location.getLocationId() )
			return verify;
		
			return null;
	}

	/*
	 * Method to return suggestions related to the location.
	 * @param location
	 * @return suggestions
	 * @see session.LocationGet#getSuggestions(entity.Location)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Suggestion> getSuggestions(Location location) {
		// TODO Auto-generated method stub
		Query query=em.createQuery("select suggestions from Suggestion suggestions where (suggestions.location=?1) order by suggestions.date desc").setParameter(1,location);
		List<Suggestion> suggestions=query.getResultList();
		if(!suggestions.isEmpty())
			return suggestions;
		else
			return null;

	}

	/*
	 * Method to return suggestion given the suggestion id. 
	 * @see session.LocationGet#getSuggestion(int)
	 * @param suggestionId
	 * @return suggestion
	 */
	public Suggestion getSuggestion(int suggestionId) {
		// TODO Auto-generated method stub
		Suggestion suggestion=em.find(Suggestion.class, suggestionId);
		if(suggestion!=null)
			return suggestion;
		else
			return null;
	}

}

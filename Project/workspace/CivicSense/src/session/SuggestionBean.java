package session;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entity.Citizen;
import entity.Suggestion;
import entity.Suggestionsupport;
import entity.SuggestionsupportPK;

/**
 * Session Bean implementation class SuggestionBean
 * @author 4MB
 * @version 1.0
 */
@Stateless
public class SuggestionBean implements SuggestionInterface {

    /**
     * Default constructor. 
     */
	@PersistenceContext(unitName="CivicSense")
	private EntityManager em;
	/*
	 * Constructor for SuggestionBean class
	 */
    public SuggestionBean() {
        // TODO Auto-generated constructor stub
    }

	@Override
	/*
	 * Method to post Suggestion
	 * @see session.SuggestionInterface#postSuggestion(entity.Suggestion)
	 */
	public void postSuggestion(Suggestion suggestion) {
		// TODO Auto-generated method stub
		em.persist(suggestion);
	}

	@Override
	/*
	 * Method to increment support for the complaint
	 * @see session.SuggestionInterface#incrementSupport(int)
	 * @param suggestId
	 * @return number of supports
	 */
	public int incrementSupport(int suggestId,int userId) {
		// TODO Auto-generated method stub
		Suggestion suggestion=getSuggestion(suggestId);
		if(suggestion!=null)
		{
			SuggestionsupportPK key=new SuggestionsupportPK();
			key.setSuggestionId(suggestId);
			key.setUserId(userId);
			Suggestionsupport support=new Suggestionsupport();
			support.setId(key);
			em.persist(support);
		suggestion.setSupport(suggestion.getSupport()+1);
		em.merge(suggestion);
		return suggestion.getSupport();
		}
		return 0;
	}

	@Override
	/*
	 * Method to return suggestion
	 * @see session.SuggestionInterface#getSuggestion(int)
	 * @param id
	 * @return suggestion
	 */
	public Suggestion getSuggestion(int id) {
		// TODO Auto-generated method stub
		Suggestion suggestion = em.find(Suggestion.class, id);
		if(suggestion!=null)
			return suggestion;
		return null;
	}

	@Override
	/*
	 * Method to return the list of suggestions addressed to the authority
	 * @see session.SuggestionInterface#getSuggestions(entity.Authority)
	 * @param authority
	 * @return suggestions
	 */
	public List<Suggestion> getSuggestions(entity.Authority authority) {
		// TODO Auto-generated method stub
		Query query=em.createQuery("select suggestion from Suggestion suggestion where suggestion.authority=?1").setParameter(1,authority);
		@SuppressWarnings("unchecked")
		List<Suggestion> suggestions=query.getResultList();
		if(!suggestions.isEmpty())
			return suggestions;
		return null;
	}

	@Override
	public Suggestionsupport getSuggestionSupport(Suggestion suggestion,
			Citizen user) {
		// TODO Auto-generated method stub
		SuggestionsupportPK key=new SuggestionsupportPK();
		key.setSuggestionId(suggestion.getSuggestionId());
		key.setUserId(user.getUserId());
		Suggestionsupport obj=em.find(Suggestionsupport.class,key );
		if(obj==null)
		{return null;
		}
		else
		{	return obj;
		}
	}



}

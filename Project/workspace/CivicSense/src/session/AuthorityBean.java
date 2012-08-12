package session;


import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;



/**
 * Session Bean implementation class AuthorityBean
 * @author 4MB
 * @version 1.0
 */
@Stateless
public class AuthorityBean implements Authority {

    /**
     * Default constructor. 
     */
	@PersistenceContext(unitName="CivicSense")
	private EntityManager em;
    public AuthorityBean() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public void createAuthority(entity.Authority authority) {
		em.persist(authority);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	/*
	 * Return authority of the corresponding zone and ward 
	 * @see session.Authority#getAuthority(java.lang.String, java.lang.String, java.lang.String)
	 * @param zone
	 * @param ward
	 * @param dept
	 * @return authority
	 */
	public entity.Authority getAuthority(String zone, String ward, String dept) {
		Query query=em.createQuery("select authority from Authority authority where (authority.ward=?1) AND (authority.zone=?2) AND (authority.dept=?3)").setParameter(1,ward).setParameter(2, zone).setParameter(3,dept).setMaxResults(1);
		List<entity.Authority> authorities=query.getResultList();
		if(!authorities.isEmpty())
			return authorities.get(0);
		else
			return null;
		
	}

	@Override
	/**
	 * Checks if the authority is present in the database 
	 * @param username 
	   @return boolean  
	 */
	public boolean isPresent(String username) {
		// TODO Auto-generated method stub
		Query query=em.createQuery("select user1 from Authority user1 where user1.username=?1").setParameter(1,username).setMaxResults(1);
    	@SuppressWarnings("unchecked")
		List<entity.Authority> users=query.getResultList();
    	if(!users.isEmpty())
    		return true;
		return false;
	}

}

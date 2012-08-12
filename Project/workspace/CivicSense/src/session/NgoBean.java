package session;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;


import entity.Ngo;
import entity.Verification;

/**
 * Session Bean implementation class NgoBean
 * @author 4MB
 * @version 1.0
 */
@Stateless
public class NgoBean implements NgoInterface {

    /**
     * Default constructor. 
     */
	@PersistenceContext(unitName="CivicSense")
	private EntityManager em;
    public NgoBean() {
        // TODO Auto-generated constructor stub
    }

	@SuppressWarnings("unchecked")
	@Override
	/*
	 * Method to check if the username exists or not
	 * @return boolean
	 * @see session.NgoInterface#isPresent(java.lang.String)
	 */
	public boolean isPresent(String username) {
		// TODO Auto-generated method stub
		Query query=em.createQuery("select user1 from Ngo user1 where user1.username=?1").setParameter(1,username).setMaxResults(1);
    	List<Ngo> users=query.getResultList();
    	if(!users.isEmpty())
    		return true;
		return false;
	}

	@Override
	/* Method to verify name,zone,ward of the NGO 
	 * @param vid
	 * @param name
	 * @param ward
	 * @return boolean
	 * @see session.NgoInterface#isValid(java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 */
	public boolean isValid(String vid, String name, String zone, String ward) {
		// TODO Auto-generated method stub
		Verification verify=em.find(Verification.class, vid);
		if(verify!=null)
		{
			//System.out.println(verify.getName().trim()+verify.getLocation().getZone()+verify.getLocation().getWard());
		if(name.equals(verify.getName().trim()) && zone.equals(verify.getLocation().getZone()) && ward.equals(verify.getLocation().getWard()))
					return true;
		}
		return false;
	}

}

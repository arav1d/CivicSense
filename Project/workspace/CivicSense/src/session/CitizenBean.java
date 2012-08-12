package session;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entity.Citizen;
import entity.Verification;

/**
 * Session Bean implementation class CitizenBean
 * @author 4MB
 * @version 1.0
 */
@Stateless
public class CitizenBean implements CitizenInterface {

    /**
     * Default constructor. 
     */
	@PersistenceContext(unitName="CivicSense")
	private EntityManager em;

    public CitizenBean() {
        // TODO Auto-generated constructor stub
    	
    }
    @SuppressWarnings("unchecked")
	public boolean isPresent(String username)
    {
    	Query query=em.createQuery("select user1 from Citizen user1 where user1.username=?1").setParameter(1,username).setMaxResults(1);
    	List<Citizen> users=query.getResultList();
    	if(!users.isEmpty())
    		return true;
		return false;
    	
    }
	@Override
	public boolean isValid(String vid,String name,String zone,String ward) {
		// TODO Auto-generated method stub
		Verification verify=em.find(Verification.class, vid);
		if(verify!=null)
		{
			System.out.println(verify.getName().trim()+verify.getLocation().getZone()+verify.getLocation().getWard());
		if(name.equals(verify.getName().trim()) && zone.equals(verify.getLocation().getZone()) && ward.equals(verify.getLocation().getWard()))
					return true;
		}
		return false;
	}
}

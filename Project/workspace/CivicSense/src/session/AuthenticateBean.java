package session;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entity.Administrator;
import entity.Authority;
import entity.Citizen;
import entity.Ngo;

/**
 * Session Bean implementation class AuthenticateBean
 * @author 4MB
 * @version 1.0
 */
@Stateless

public class AuthenticateBean implements AuthenticateUser {

    /**
     * Default constructor. 
     */
	@PersistenceContext(unitName="CivicSense")
	private EntityManager em;
    public AuthenticateBean() {
        // TODO Auto-generated constructor stub
    }
    @SuppressWarnings("unchecked")
    /* Performs authentication of the username and password of the user and returns the corresponding user object
     * @param username 
     * @param password
     * @param user
     * @return obj
     */
	public Object authenticate(String username,String password,String user)
    {
    	String uname="",pass="";
    	Object obj=null;
    	if(user.equals("citizen"))
    	{
    		Query query=em.createQuery("select user from Citizen user where user.username=?1").setParameter(1, username).setMaxResults(1);
    		
    		List<Citizen> user1=query.getResultList();
    		if(!user1.isEmpty())
    		{
    		uname=user1.get(0).getUsername();
    		pass=user1.get(0).getPassword();
    		if(uname.equals(username)&&pass.equals(password))
    			obj=user1.get(0);
    		}
    	}
    	else if(user.equals("authority"))
    	{
Query query=em.createQuery("select user from Authority user where user.username=?1").setParameter(1, username);
    		
		List<Authority> user1=(List<Authority>)query.getResultList();
		if(user1.size()>0)
		{
		uname=user1.get(0).getUsername();
		pass=user1.get(0).getPassword();
		if(uname.equals(username)&&pass.equals(password))
			obj=user1.get(0);
		}
    	}
    	else if(user.equals("admin"))
    	{
    		Query query=em.createQuery("select user from Administrator user where user.username=?1").setParameter(1, username);
    		List<Administrator> user1=(List<Administrator>)query.getResultList();
    		if(user1.size()>0)
    		{
    		uname=user1.get(0).getUsername();
    		pass=user1.get(0).getPassword();
    		if(uname.equals(username)&&pass.equals(password))
    			obj=user1.get(0);
    		}
    		
    	}
    	else
    	{
    		Query query=em.createQuery("select user from Ngo user where user.username=?1").setParameter(1, username);
    		List<Ngo> user1=(List<Ngo>)query.getResultList();
    		if(user1.size()>0)
    		{
    		uname=user1.get(0).getUsername();
    		pass=user1.get(0).getPassword();
    		if(uname.equals(username)&&pass.equals(password))
    			obj=user1.get(0);
    		}
    	}
    	return obj;
    	
    }

}

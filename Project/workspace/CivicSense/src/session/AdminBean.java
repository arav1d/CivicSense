package session;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entity.Administrator;

/**
 * Session Bean implementation class AdminBean
 * @author 4MB
 * @version 1.0
 */
@Stateless
public class AdminBean implements AdminInterface {

    /**
     * Default constructor. 
     */
	@PersistenceContext(unitName="CivicSense")
	private EntityManager em;
    /*
     * Constructor for AdminBean
     */
	public AdminBean() {
        // TODO Auto-generated constructor stub
    }

	@SuppressWarnings("unchecked")
	@Override
	/**
	 * Returns the administrator of the corresponding zone.
	 * @param zone
	 * @return Administrator
	 */
	public Administrator getAdmin(String zone) {
		// TODO Auto-generated method stub
		Query query=em.createQuery("select admin from Administrator admin where (admin.zone=?1)").setParameter(1, zone).setMaxResults(1);
		List<Administrator> admins=query.getResultList();
		if(!admins.isEmpty())
			return admins.get(0);
		else
			return null;
	}

}

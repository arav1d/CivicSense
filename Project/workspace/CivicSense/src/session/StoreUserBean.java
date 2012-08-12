package session;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import entity.Citizen;
import entity.Ngo;

/**
 * Session Bean implementation class CitizenBean
 * @author 4MB
 * @version 1.0
 */
@Stateless
public class StoreUserBean implements StoreUser {

    /**
     * Default constructor. 
     */
	@PersistenceContext(unitName="CivicSense")
	private EntityManager em;
	/*
	 * Constructor for StoreUserBean
	 */
    public StoreUserBean() {
        // TODO Auto-generated constructor stub
    }
	@Override
	/* Method to insert citizen
	 * @see session.StoreUser#insertCitizen(entity.Citizen)
	 */
	public void insertCitizen(Citizen c) {
		em.persist(c);
		return;
	}
	@Override
	/*
	 * Method to insert Ngo
	 * @see session.StoreUser#insertNgo(entity.Ngo)
	 */
	public boolean insertNgo(Ngo ngo) {
		// TODO Auto-generated method stub
		em.persist(ngo);
		return true;
	}

}

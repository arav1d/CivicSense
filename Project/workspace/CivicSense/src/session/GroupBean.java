package session;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entity.Group;
import entity.Groupcontent;
import entity.Location;

/**
 * Session Bean implementation class GroupBean
 * @author 4MB
 * @version 1.0
 */
@Stateless
public class GroupBean implements GroupInterface {

    /**
     * Default constructor. 
     */
	@PersistenceContext(unitName="CivicSense")
	private EntityManager em;
    public GroupBean() {
        // TODO Auto-generated constructor stub
    }

	@Override
	/*
	 * Method to create group
	 * @see session.GroupInterface#createGroup(entity.Group)
	 * @param group
	 * @return group
	 */
	public void createGroup(Group group) {
		// TODO Auto-generated method stub
		em.persist(group);
	}

	@Override
	/* Method to post Group Content 
	 * @see session.GroupInterface#postContent(entity.Groupcontent)
	 * @param content
	 * @return content
	 */
	public void postContent(Groupcontent content) {
		// TODO Auto-generated method stub
		em.persist(content);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	/* Method to return groups in that location
	 * @param location
	 * @return groups  
	 * 
	 */
	public List<Group> getGroups(Location location) {
		// TODO Auto-generated method stub
		Query query=em.createQuery("select groups from Group groups where (groups.location=?1) order by groups.date desc").setParameter(1,location);
		List<Group> groups=query.getResultList();
		if(!groups.isEmpty())
			return groups;
		else
			return null;
	}

	@Override
	/**
	 * Returns the group given the key
	 * @param key
	 * @return group
	 */
	public Group getGroup(int key) {
		// TODO Auto-generated method stub
		return em.find(Group.class,key);
	}

	@SuppressWarnings("unchecked")
	@Override
	/**
	 * Returns the group contents given the group
	 * @param group
	 * @return groups
	 */
	public List<Groupcontent> getContents(Group group) {
		// TODO Auto-generated method stub
		Query query=em.createQuery("select contents from Groupcontent contents where (contents.group=?1)").setParameter(1, group);
		List<Groupcontent> groups=query.getResultList();
		if(!groups.isEmpty())
			return groups;
		else
			return null;
		}

}

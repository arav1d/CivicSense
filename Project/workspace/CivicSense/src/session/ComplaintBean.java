package session;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;




import entity.Citizen;
import entity.Complaintdetail;
import entity.Complaintsupport;
import entity.ComplaintsupportPK;
import entity.Location;
import entity.Authority;


/**
 * Session Bean implementation class ComplaintBean
 * @author 4MB
 * @version 1.0
 */
@Stateless
public class ComplaintBean implements Complaint {

    /**
     * Default constructor. 
     */
	@PersistenceContext(unitName="CivicSense")
	private EntityManager em;
    public ComplaintBean() {
        // TODO Auto-generated constructor stub
    }

	@SuppressWarnings("unchecked")
	@Override
	public List<Complaintdetail> getComplaint(String key,Location loc) {
		Query query=em.createQuery("select complaint from Complaintdetail complaint where (complaint.location=?1) AND (complaint.complaintDesc=?2) order by complaint.date desc").setParameter(1, loc).setParameter(2, key);
		
		List<Complaintdetail> complaints=query.getResultList();
		if(!complaints.isEmpty())
		return complaints;
		else
			return null;
	}

	@Override
	public void removeComplaint(Complaint complaint) {
		// TODO Auto-generated method stub
		em.remove(complaint);
	}



	@SuppressWarnings("unchecked")
	@Override
	public List<Complaintdetail> getNegativeFeedbacks(String zone) {
		// TODO Auto-generated method stub
		Query query=em.createQuery("select complaints from Complaintdetail complaints where (complaints.feedbackType=?1) AND complaints.location.zone=?2 order by complaints.date desc").setParameter(1,2).setParameter(2,zone);
		List<Complaintdetail> details=(List<Complaintdetail>)query.getResultList();
		if(!details.isEmpty())
			return details;
			else
				return null;
		
	}

	@Override
	public entity.Complaint getComplaintType(String desc) {
		Query query=em.createQuery("select complaint from Complaint complaint where (complaint.desc=?1)").setParameter(1,desc).setMaxResults(1);
		@SuppressWarnings("unchecked")
		List<entity.Complaint> complaints= query.getResultList();
		if(!complaints.isEmpty())
			return complaints.get(0);
		else
			return null;
	}

	@Override
	public void insertComplaint(Complaintdetail complaint) {
		// TODO Auto-generated method stub
		em.persist(complaint);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Complaintdetail> getComplaint(int locId) {
		// TODO Auto-generated method stub
		Query query=em.createQuery("select complaint from Complaintdetail complaint where complaint.location.locationId=?1 order by complaint.date desc").setParameter(1, locId);
		List<Complaintdetail> details=(List<Complaintdetail>)query.getResultList();
		if(!details.isEmpty())
			return details;
			else
				return null;
	}
	

	@Override
	public Complaintdetail getComplaintById(int key) {
		// TODO Auto-generated method stub
		return em.find(Complaintdetail.class, key);
	}







	public void setFeedback(Complaintdetail id,String feedback,String feedbackType)
	{	
		Complaintdetail detail=em.find(Complaintdetail.class,id.getComplaintId());
		Authority authority=detail.getAuthority();
		Authority auth=em.find(Authority.class,authority.getAuthorityId());
		
				detail.setFeedback(feedback);
				if(feedbackType.equals("neg"))
				{
					auth.setCredits(auth.getCredits()-1);
					detail.setFeedbackType(2);
				}
					else
					detail.setFeedbackType(1);
				em.merge(auth);
		em.merge(detail);
	}

	@Override
	public void incrementComplaintSupport(Complaintdetail c1, int support,int userId) {
		// TODO Auto-generated method stub
		Complaintdetail detail=em.find(Complaintdetail.class,c1.getComplaintId());
		detail.setSupport(support);
		ComplaintsupportPK key=new ComplaintsupportPK();
		key.setComplaintId(c1.getComplaintId());
		key.setUserId(userId);
		Complaintsupport support1=new Complaintsupport();
		support1.setId(key);
		em.persist(support1);
		em.merge(detail);
		
	}

	@Override
	public void invalidate(int complaintId) {
		// TODO Auto-generated method stub
		
		Complaintdetail complaint=em.find(Complaintdetail.class, complaintId);
		complaint.setValidity(0);
		em.merge(complaint);
	}

	@Override
	public List<Complaintdetail> getValidComplaints(Authority authority) {
		Query query=em.createQuery("select complaints from Complaintdetail complaints where complaints.validity=?1 AND complaints.authority=?2 AND complaints.level3status=?3 order by complaints.date desc").setParameter(1,1).setParameter(2, authority).setParameter(3, 0);
		@SuppressWarnings("unchecked")
		List<Complaintdetail> complaints=query.getResultList();
		if(!complaints.isEmpty())
		return complaints;
		else
			return null;
	}

	@Override
	public void setLevel(int complaintId, int level,Authority authority) {
		// TODO Auto-generated method stub
		Complaintdetail complaint=em.find(Complaintdetail.class, complaintId);
		if(level==1)
		{
			complaint.setLevel1status(1);
		}
		else if(level==2)
		{
			complaint.setLevel2status(1);
		}
		else
		{	
			Authority auth=em.find(Authority.class, authority.getAuthorityId());
			complaint.setLevel3status(1);
			auth.setCredits(auth.getCredits()+1);
			em.merge(auth);
		}
		em.merge(complaint);
	}

	@Override
	public void filter(int complaintId) {
		// TODO Auto-generated method stub
		Complaintdetail complaint=em.find(Complaintdetail.class, complaintId);
		em.remove(complaint);
	}

	@Override
	public List<Complaintdetail> getInValidComplaints(String zone) {
		// TODO Auto-generated method stub
		Query query=em.createQuery("select complaints from Complaintdetail complaints where complaints.validity=?1 AND complaints.location.zone=?2 order by complaints.date desc").setParameter(1,0).setParameter(2,zone);
		@SuppressWarnings("unchecked")
		List<Complaintdetail> complaints=query.getResultList();
		if(!complaints.isEmpty())
		return complaints;
		else
			return null;
	}

	@Override
	public List<Complaintdetail> getSearchComplaints(String searchKey) {
		// TODO Auto-generated method stub
		Query query=em.createQuery("select complaints from Complaintdetail complaints where complaints.complaintDesc like '%"+searchKey+"%'");
		@SuppressWarnings("unchecked")
		List<Complaintdetail> complaints=query.getResultList();
		if(!complaints.isEmpty())
			return complaints;
			else
				return null;		
	}

	@Override
	public List<Complaintdetail> getComplaint(Citizen userId) {
		// TODO Auto-generated method stub
		Query query=em.createQuery("select complaints from Complaintdetail complaints where complaints.citizen=?1").setParameter(1,userId);
		@SuppressWarnings("unchecked")
		List<Complaintdetail> complaints=query.getResultList();
		if(!complaints.isEmpty())
			return complaints;
			else
				return null;
	}

	@Override
	public Complaintsupport getComplaintSupport(int complaintId, int userId) {
		// TODO Auto-generated method stub
		ComplaintsupportPK key=new ComplaintsupportPK();
		key.setComplaintId(complaintId);
		key.setUserId(userId);
		Complaintsupport obj=em.find(Complaintsupport.class,key );
		if(obj==null)
		{
			return null;
		}
		else
		{	
			return obj;
		}
	}



	




}

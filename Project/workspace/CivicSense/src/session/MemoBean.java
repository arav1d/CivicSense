package session;



import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entity.Complaintdetail;
import entity.Memo;
import entity.Authority;

/**
 * Session Bean implementation class MemoBean
 * @author 4MB
 * @version 1.0
 */
@Stateless
public class MemoBean implements MemoInterface {

    /**
     * Default constructor. 
     */
	@PersistenceContext(unitName="CivicSense")
	private EntityManager em;
    public MemoBean() {
        // TODO Auto-generated constructor stub
    }

	@Override
	/*
	 * @see session.MemoInterface#issueMemo(entity.Memo)
	 */
	public void issueMemo(Memo memo,int complaintID) {
		// TODO Auto-generated method stub
		Complaintdetail complaint=em.find(Complaintdetail.class,complaintID);
		complaint.setFeedbackType(3);
		complaint.setValidity(1);
		em.merge(complaint);
		em.persist(memo);
	}

	@Override
	/*
	 * Method to return memo issued to the authority
	 * @see session.MemoInterface#getMemos(entity.Authority)
	 * @param authority
	 * @return memos
	 */
	public List<Memo> getMemos(Authority authority) {
		Query query=em.createQuery("select memo from Memo memo where memo.authority=?1").setParameter(1,authority);
		@SuppressWarnings("unchecked")
		List<Memo> memos=query.getResultList();
		if(!memos.isEmpty())
			return memos;
		return null;
	}

	@Override
	/*
	 * Method to return memo given the memoId
	 * @see session.MemoInterface#getMemo(int)
	 * @param memoId
	 * @return memo
	 */
	public Memo getMemo(int memoId) {
		// TODO Auto-generated method stub
		Memo memo=em.find(Memo.class,memoId);
		if(memo!=null)
			return memo;
		return null;
	}
	

}

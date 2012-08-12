package session;

import java.util.List;

import javax.ejb.Local;



import entity.Memo;
import entity.Authority;
@Local
public interface MemoInterface {
	public void issueMemo(Memo memo,int complaintID);
	public List<Memo> getMemos(Authority authority);
	public Memo getMemo(int memoId);
 }


package session;

import java.util.List;

import javax.ejb.Local;

import entity.Citizen;
import entity.Complaintdetail;
import entity.Location;
import entity.Authority;

@Local
public interface Complaint {

public List<Complaintdetail> getComplaint(String key,Location location);

public void removeComplaint(Complaint complaint);

public List<Complaintdetail> getNegativeFeedbacks(String zone); 

public entity.Complaint getComplaintType(String desc);

public void insertComplaint(Complaintdetail complaint);

public List<Complaintdetail> getComplaint(int locId);

public Complaintdetail getComplaintById(int key);

public void setFeedback(Complaintdetail id,String feedback,String feedbackType);

public void incrementComplaintSupport(Complaintdetail c1,int support,int userId);

public void invalidate(int complaintId);

public List<Complaintdetail> getValidComplaints(Authority authority);


public void setLevel(int complaintId,int level,Authority authority);

public void filter(int complaintId);

public List<Complaintdetail> getInValidComplaints(String zone);

public List<Complaintdetail> getSearchComplaints(String searchKey);

public List<Complaintdetail> getComplaint(Citizen userId);

public entity.Complaintsupport getComplaintSupport(int complaintId, int userId);

}


package session;
import javax.ejb.Local;

import entity.Administrator;

@Local
/*
 * Administrator interface 
 * @author 4MB
 * @version 1.0
 */
public interface AdminInterface {
	/* Method to return the administrator of the corresponding zone
	 * @param zone
	 */
public Administrator getAdmin(String zone);
}

package session;
import javax.ejb.Local;

@Local
/**
 * Authenticate user interface
 * @author 4MB
 * @version 1.0
 * 
 */
public interface AuthenticateUser {
	/* Performs authentication of the username and password of the user and returns the corresponding user object
     * @param username 
     * @param password
     * @param user
     * @return obj
     */
	public Object authenticate(String username,String password,String user);

}

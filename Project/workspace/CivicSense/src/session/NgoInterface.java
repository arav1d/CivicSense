package session;
import javax.ejb.Local;

@Local
public interface NgoInterface {
	public boolean isPresent(String username);
	public boolean isValid(String vid,String name,String zone,String ward);
}

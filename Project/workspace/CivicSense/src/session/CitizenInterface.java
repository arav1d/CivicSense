package session;
import javax.ejb.Local;

@Local
public interface CitizenInterface {
public boolean isPresent(String username);
public boolean isValid(String vid,String name,String zone,String ward);

}

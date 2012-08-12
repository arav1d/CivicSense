package session;
import javax.ejb.Local;

@Local
public interface Authority {
public void createAuthority(entity.Authority authority);
public entity.Authority getAuthority(String zone,String ward,String dept);
public boolean isPresent(String username);

}

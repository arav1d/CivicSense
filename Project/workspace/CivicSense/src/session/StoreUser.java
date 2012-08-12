package session;
import javax.ejb.Local;

import entity.Citizen;
import entity.Ngo;

@Local
public interface StoreUser {
public void insertCitizen(Citizen c);
public boolean insertNgo(Ngo ngo);
}

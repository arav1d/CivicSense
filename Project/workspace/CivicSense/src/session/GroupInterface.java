package session;
import java.util.List;

import javax.ejb.Local;

import entity.Group;
import entity.Groupcontent;
import entity.Location;

@Local
public interface GroupInterface {
public void createGroup(Group group);
public void postContent(Groupcontent content);
public List<Group> getGroups(Location location);
public Group getGroup(int key);
public List<Groupcontent> getContents(Group group);
}

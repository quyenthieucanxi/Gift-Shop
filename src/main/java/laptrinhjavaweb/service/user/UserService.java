package laptrinhjavaweb.service.user;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import laptrinhjavaweb.dao.user.UserDao;
import laptrinhjavaweb.models.user.User;
@Service
@Transactional
public class UserService {
  @Autowired
  private UserDao userDAO;
  
  public List<User> findAll() {
    return userDAO.findAll();
  }
  public User findById(int id) {
    return userDAO.findById(id);
  }
  public User findByLogin_name(String login_name) 
  {
	    return userDAO.findByLogin_name(login_name);
}
 
  public void save(User user){
    // validate business
    userDAO.save(user);
  }
  public void update(User user){
    // validate business
    userDAO.update(user);
  }
  
  public void delete(int id){
    // validate business
    userDAO.delete(id);
  }
  public User checkAccount(User user)
  {
	  User temp=userDAO.checkAccount(user);
	  if (temp!= null)
	  {
		  return temp;
	  }
	  return null;
  }
  public String checkPermission (int id)
  {
	  return  userDAO.checkPermission(id);
  }
  
}


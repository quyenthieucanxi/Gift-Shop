package laptrinhjavaweb.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import laptrinhjavaweb.models.user.User;

@Controller
public class HomeControllerAdmin extends BaseControllerAdmin {

	@RequestMapping(value = { "/admin/home" })
	public ModelAndView Home(HttpSession session) {

		
		//int id_permission = (User) session.getAttribute("userAdmin");
		 User sameObject = (User) session.getAttribute("userAdmin");
		if (sameObject != null)
		{
			_mv.setViewName("admin/home");
			return _mv;
		}
		_mv.setViewName("admin/404");
		String Role = (String) session.getAttribute("Role");
		System.out.println(Role);
		if (Role!= null)
		{	
			if (Role.equals(("Admin")))
			{
				_mv.setViewName("admin/home");
				session.setAttribute("Role",Role);
				return _mv;
			}
			else
				_mv.setViewName("admin/404");
		}
		return  _mv;
	}
}

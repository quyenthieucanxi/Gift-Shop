package laptrinhjavaweb.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import laptrinhjavaweb.models.user.User;
import laptrinhjavaweb.service.user.UserService;

@Controller
public class RegisterController {
	@Autowired
	private UserService userservice;
	
	@RequestMapping(value="/register",method = RequestMethod.GET)
	public ModelAndView Register (Model model)
	{
		ModelAndView mav= new ModelAndView("user/register");
		model.addAttribute("user",new User());
		return mav;
	}
	@RequestMapping(value="/register",method = RequestMethod.POST)
	public String CreateUser(@ModelAttribute("user") User user,HttpSession session,BindingResult result,Model model)
	{
		String userName = user.getLogin_name();
		String fullName = user.getFull_name();
		String email = user.getEmail();
		
		if (result.hasErrors()) {
		    return "redirect:/register";
		}
		if (fullName == "")
		{
			model.addAttribute("error","Full Name cannot be empty");
			return "redirect:/register";
		}
		if (email == "")
		{
			model.addAttribute("error","Email cannot be empty");
			return "redirect:/register";
		}
		
		User temp = userservice.findByLogin_name(userName);
		if (temp != null)
		{
			 model.addAttribute("error","There is already an account with this user name: " + userName);
			 return "redirect:/register";
		}
		
		userservice.save(user);
		//User registeredUser = userservice.findById(user.getId());
		
		session.setAttribute("UserInfo",user);
		return "redirect:/trang-chu";
	}
}

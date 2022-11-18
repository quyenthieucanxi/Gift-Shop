package laptrinhjavaweb.controller.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import laptrinhjavaweb.common.GooglePojo;
import laptrinhjavaweb.common.GoogleUtils;
import laptrinhjavaweb.models.user.User;
import laptrinhjavaweb.service.user.UserService;

import org.apache.http.client.ClientProtocolException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;


@Controller
public class LoginController {
	@Autowired
	private UserService userservice;

	
	 @Autowired 
	 private GoogleUtils googleUtils;
	 
	@RequestMapping(value={"/login"},method = RequestMethod.GET)
	public String Login (@RequestParam(required = false) String message, Model model,HttpSession session)
	{
		if (message != null && !message.isEmpty()) {
			if (message.equals("logout")) {
		          model.addAttribute("message", "Logout!");
		        }
			if (message.equals("error")) {
		         model.addAttribute("message", "Login Failed!");
		        }
	        if (message.equals("google_error")) {
	          model.addAttribute("message", "Login by Google Failed!");
	        }
		}
		model.addAttribute("user",new User());
		return "user/login";
	}
	@SuppressWarnings("unused")
	@RequestMapping(value={"/login"},method = RequestMethod.POST)
	public String LoginUser (@ModelAttribute("user") User user ,HttpSession session)
	{	
		
		User check = userservice.checkAccount(user);
		
		if (check!=null)
		{
			String role = userservice.checkPermission(check.getId());
			if (role.equals("Admin"))
				session.setAttribute("userAdmin",check);
			session.setAttribute("Role",role);
			System.out.println(role);
			session.setAttribute("UserInfo",check);
		}
		else
		{
			return "redirect:/login?message=error" ;
		}
		return "redirect:/";
		
	}
		@RequestMapping("/login-google")
		public String loginGoogle(HttpServletRequest request, HttpSession session) throws ClientProtocolException, IOException {
	    String code = request.getParameter("code");
	    
	    if (code == null || code.isEmpty()) {
	      return "redirect:/login?messge=google_error";
	    }
	    String accessToken = googleUtils.getToken(code);
	    
	    GooglePojo googlePojo = googleUtils.getUserInfo(accessToken);
	    session.setAttribute("UserGooGle",googlePojo);
	    UserDetails userDetail = googleUtils.buildUser(googlePojo);
	    UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null,
	        userDetail.getAuthorities());
	    authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
	    SecurityContextHolder.getContext().setAuthentication(authentication);
	    return "redirect:/trang-chu";
	  }
		@RequestMapping(value={"/logout"})
		public ModelAndView Logout (HttpServletRequest request, HttpServletResponse response,HttpSession session)
		{
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (auth != null)
				new SecurityContextLogoutHandler().logout(request,response,auth);
			session.removeAttribute("UserInfo");
			session.invalidate();
			return new ModelAndView("redirect:/trang-chu");
		}
}

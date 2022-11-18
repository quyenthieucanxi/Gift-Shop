package laptrinhjavaweb.controller.user;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import laptrinhjavaweb.service.user.HomeService;

@Controller
public class BaseController {
	@Autowired
	HomeService _homeservice;
	
	public ModelAndView _mav = new ModelAndView();
	
	@PostConstruct
	public ModelAndView Init( ) {
		_mav.addObject("Category", _homeservice.GetDataCategory());
		_mav.addObject("FeaturedProducts", _homeservice.GetDataFeaturedProducts());
		return _mav;
	}
}
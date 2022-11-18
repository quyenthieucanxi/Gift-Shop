package laptrinhjavaweb.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import laptrinhjavaweb.service.admin.AccountServiceAdmin;
@Controller
public class BillController extends BaseControllerAdmin {
	@Autowired AccountServiceAdmin accountServiceAdmin;
	
	@RequestMapping(value = "/admin/load-bill")
	public ModelAndView Prodict() {
		_mv.addObject("Bill", accountServiceAdmin.GetDataBill());
		_mv.setViewName("admin/bill/load");
		return _mv;
	}
}

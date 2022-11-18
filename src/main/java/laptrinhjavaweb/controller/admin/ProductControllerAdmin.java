package laptrinhjavaweb.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import laptrinhjavaweb.models.user.Product;
import laptrinhjavaweb.service.admin.CategoryServiceAdmin;
import laptrinhjavaweb.service.admin.ProductServiceAdmin;

@Controller
public class ProductControllerAdmin extends BaseControllerAdmin {
	@Autowired
	private ProductServiceAdmin productServiceAdmin;
	
	@Autowired
	private CategoryServiceAdmin categoryServiceAdmin;

	@RequestMapping(value = "/admin/load-product")
	public ModelAndView Prodict() {
		_mv.addObject("Product", productServiceAdmin.GetDataProduct());
		_mv.setViewName("admin/product/load");
		return _mv;
	}

	@RequestMapping(value = "/admin/create-product", method = RequestMethod.GET)
	public ModelAndView CreateProduct(Model model) {
		_mv.addObject("category", categoryServiceAdmin.GetDataCategory());
		model.addAttribute("product", new Product());
		_mv.setViewName("admin/product/create");
		return _mv;
	}

	@RequestMapping(value = "/admin/create-product", method = RequestMethod.POST)
	public String CreateProduct(@ModelAttribute("product") Product product) {
		_mv.addObject("category", categoryServiceAdmin.GetDataCategory());
		productServiceAdmin.InsertProduct(product);
		return "redirect:/admin/load-product";
	}

	@RequestMapping(value = { "/admin/DeleteProduct/{id}" })
	public String DeleteProduct(@PathVariable int id) {

		productServiceAdmin.DeleteProduct(id);
		return "redirect:/admin/load-product";
	}

	@RequestMapping(value = "/admin/EditProduct/{id}", method = RequestMethod.GET)
	public ModelAndView EditProduct(@PathVariable int id, Model model) {
		_mv.addObject("category", categoryServiceAdmin.GetDataCategory());
		Product product = productServiceAdmin.GetDataProductId(id);
		model.addAttribute("product", product);
		_mv.setViewName("admin/product/Edit");
		return _mv;
	}

	@RequestMapping(value = "/admin/EditProduct/{id}", method = RequestMethod.POST)
	public String EditProduct(@PathVariable int id, @ModelAttribute("product") Product product) {
		productServiceAdmin.UpdateProduct(product);
		return "redirect:/admin/load-product";
	}
}

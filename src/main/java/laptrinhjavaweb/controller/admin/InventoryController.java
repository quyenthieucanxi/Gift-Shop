package laptrinhjavaweb.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import laptrinhjavaweb.models.user.Inventory;
import laptrinhjavaweb.service.admin.InventoryServiceAdmin;
import laptrinhjavaweb.service.admin.ProductServiceAdmin;

@Controller
public class InventoryController extends BaseControllerAdmin{

	@Autowired
	private InventoryServiceAdmin inventoryServiceAdmin;
	@Autowired
	private ProductServiceAdmin productServiceAdmin;
	
	@RequestMapping(value = "/admin/load-inventory")
	public ModelAndView Inventory() {
		_mv.addObject("Inventory", inventoryServiceAdmin.GetDataInventory());
		_mv.addObject("Product", productServiceAdmin.GetDataProduct());
		_mv.setViewName("admin/inventory/load");
		return _mv;
	}
	
	@RequestMapping(value = { "/admin/DeleteInventory/{id}" })
	public String DeleteInventory(@PathVariable int id) {

		inventoryServiceAdmin.DeleteInventory(id);
		return "redirect:/admin/load-inventory";
	}
	
	@RequestMapping(value= "/admin/create-inventory", method = RequestMethod.GET)
	public ModelAndView CreateInventory(Model model)
	{
		model.addAttribute("inventory", new Inventory());
		_mv.setViewName("admin/inventory/create");
		return _mv;
	}
	@RequestMapping(value= "/admin/create-inventory", method = RequestMethod.POST)
	public String Createinventory(@ModelAttribute("inventory") Inventory inventory)
	{
		inventoryServiceAdmin.InsertInventory(inventory);
		return "redirect:/admin/load-inventory";
	}
	
	@RequestMapping(value= "/admin/EditInventory/{id}", method = RequestMethod.GET)
	public ModelAndView EditInventory(@PathVariable int id, Model model)
	{
		Inventory inventory = inventoryServiceAdmin.GetDataInventoryId(id);
		model.addAttribute("inventory", inventory);
		_mv.setViewName("admin/inventory/Edit");
		return _mv;
	}
	@RequestMapping(value= "/admin/EditInventory/{id}", method = RequestMethod.POST)
	public String EditInventory(@PathVariable int id, @ModelAttribute("inventory") Inventory inventory)
	{
		inventoryServiceAdmin.UpdateInventory(inventory);
		return "redirect:/admin/load-inventory";
	}
}

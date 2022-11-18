package laptrinhjavaweb.service.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import laptrinhjavaweb.dao.user.BillsDao;
import laptrinhjavaweb.models.user.Bill_Detail;
import laptrinhjavaweb.models.user.Bills;
import laptrinhjavaweb.models.user.Cart_Item;

@Service
public class BillService {
	@Autowired
	private BillsDao billsDao;
	
	public int AddBills(Bills bills) {
		return billsDao.AddBills(bills);
	}
	
	public void AddBillsDetail(HashMap<Long, Cart_Item> carts) {
		int idBills = billsDao.GetIdBills();
		for(Map.Entry<Long, Cart_Item> itemCart : carts.entrySet()) {
			Bill_Detail bill_Detail = new Bill_Detail();
			bill_Detail.setId_bill(idBills);
			bill_Detail.setId_product(itemCart.getValue().getProduct().getId());
			bill_Detail.setQuantity(itemCart.getValue().getQuantity());
			bill_Detail.setTotal(itemCart.getValue().getTotal_purchase_price());
			billsDao.AddBillsDetail(bill_Detail);
		}
	}
}
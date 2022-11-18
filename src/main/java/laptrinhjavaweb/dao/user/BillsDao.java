package laptrinhjavaweb.dao.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import laptrinhjavaweb.models.user.Bill_Detail;
import laptrinhjavaweb.models.user.Bills;

@Repository
public class BillsDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int AddBills(Bills bills) {
		String sql = "INSERT INTO bills (login_name, full_name, phone, email, note, total, quantity) "
				+ "VALUES (?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, bills.getLogin_name(), bills.getFull_name(), bills.getPhone(), bills.getEmail(),
				bills.getNote(), bills.getTotal(), bills.getQuantity());
	}

	/*
	 * public int AddBills(Bills bills) { StringBuffer sql = new StringBuffer();
	 * sql.
	 * append("INSERT INTO bill_detail (login_name, full_name, phone, email, note, total, quantity) VALUES ("
	 * + bills.getLogin_name()+ ", " +bills.getFull_name()+ ", " +bills.getPhone()+
	 * ", " +bills.getEmail()+ ", " +bills.getNote()+ ", " +bills.getTotal()+
	 * ", "+bills.getQuantity()+ ")"); int insert =
	 * jdbcTemplate.update(sql.toString()); return insert; }
	 */

	public int GetIdBills() {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT MAX(id) FROM bills;");
		int id = jdbcTemplate.queryForObject(sql.toString(), new Object[] {}, int.class);
		return id;
	}

	public void AddBillsDetail(Bill_Detail bill_Detail) {
		String sql = "INSERT INTO bill_detail (id_product, id_bill, quantity, total) " + "VALUES (?,?,?,?)";
		jdbcTemplate.update(sql, bill_Detail.getId_product(), bill_Detail.getId_bill(), bill_Detail.getQuantity(),
				bill_Detail.getTotal());
	}

//	public int AddBillsDetail(Bill_Detail bill_Detai) {
//		StringBuffer sql =  new StringBuffer();
//		sql.append("INSERT INTO bill_detail (id_product, id_bill, quantity, total) VALUES (" +bill_Detai.getId_product()+ ", " +bill_Detai.getId_bill()+ ", " +bill_Detai.getQuantity()+ ", " +bill_Detai.getTotal()+ ")");
//		int insert = jdbcTemplate.update(sql.toString().toString());
//		return insert;
//	}
}
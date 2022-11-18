package laptrinhjavaweb.models.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class BillsMapper implements RowMapper<Bills> {
	public Bills mapRow(ResultSet rs, int rowNum) throws SQLException {
		Bills bill = new Bills();
		bill.setLogin_name(rs.getString("login_name"));
		bill.setFull_name(rs.getString("full_name"));
		bill.setPhone(rs.getString("phone"));
		bill.setEmail(rs.getString("email"));
		bill.setNote(rs.getString("note"));
		bill.setTotal(rs.getFloat("total"));
		bill.setQuantity(rs.getInt("quantity"));
		return bill;
	}
}

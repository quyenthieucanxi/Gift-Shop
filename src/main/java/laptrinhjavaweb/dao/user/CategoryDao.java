package laptrinhjavaweb.dao.user;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import laptrinhjavaweb.models.user.Category;
import laptrinhjavaweb.models.user.CategoryMapper;

@Repository
public class CategoryDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Category> GetDataCategory(){
		List<Category> list = new ArrayList<Category>();
		String sql = "SELECT *  FROM category";
		list = jdbcTemplate.query(sql, new CategoryMapper());
		return list;
		
	}
}
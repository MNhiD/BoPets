package shop.dao;

import java.util.List;
import shop.entity.Category;

public interface CategoryDao {
	Category searchById(String id);
	List<Category> selectAll();
	Category create(Category entity);
	void update (Category entity);
	Category delete(String id);
}

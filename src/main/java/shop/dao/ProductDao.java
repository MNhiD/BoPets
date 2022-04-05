package shop.dao;

import java.util.List;
import shop.entity.Product;

public interface ProductDao {
	Product searchById(String id);
	List<Product> selectAll();
	Product create(Product entity);
	void update (Product entity);
	Product delete(String id);
	List<Product> searchByCategoryId(String categoryId);
	List<Product> searchByKeyWord(String keywords);
	String getNewId();
	List<Product> filterByKey(String key);
	List<Product> filterByPriceASC();
	List<Product> filterByPriceDESC();
}
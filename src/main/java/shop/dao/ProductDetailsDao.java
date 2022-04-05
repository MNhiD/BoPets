package shop.dao;

import java.util.List;
import shop.entity.ProductDetails;
import shop.entity.ProductDetails;

public interface ProductDetailsDao {
	ProductDetails searchById(String id);
	List<ProductDetails> selectAll();
	ProductDetails create(ProductDetails entity);
	void update (ProductDetails entity);
	ProductDetails delete(String id);
	List<ProductDetails> searchByProductId(String productId);
	List<ProductDetails> searchByKeyWord(String keywords);
}
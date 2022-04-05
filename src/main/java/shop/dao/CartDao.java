package shop.dao;

import java.util.List;


import shop.entity.Cart;

public interface CartDao {
	List<Cart> searchByCustomerId(int id);
	public List<Cart> searchByProductId(String pId);
	List<Cart> selectAll();
	Cart create(Cart entity);
	void update (Cart entity);
	Cart delete(String pid, int uid);
	void delete(int uid);
	String checkExist(String id);
}

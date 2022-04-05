package shop.dao;

import java.util.List;
import shop.entity.SellOrder;

public interface SellOrderDao {
	SellOrder searchById(String id);
	List<SellOrder> searchByCustomerId(int id);
	List<SellOrder> searchByStatus(int customerID,String status);
	List<SellOrder> selectAll();
	SellOrder create(SellOrder entity);
	void update (SellOrder entity);
	SellOrder delete(String id);
	List<SellOrder> searchByProductId(String prId);
	String selectId();
	List<SellOrder> selectPending();
	List<SellOrder> selectShipping();
	List<SellOrder> selectSuccess();
	List<SellOrder> selectCancel();
}
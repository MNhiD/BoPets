package shop.dao;

import java.util.List;

import shop.bean.BestSeller;
import shop.entity.SellDetails;

public interface SellDetailsDao {
	public List<SellDetails> searchById(String id) ;
	List<SellDetails> selectAll();
	SellDetails create(SellDetails entity);
	void update (SellDetails entity);
	SellDetails delete(String id);
	List<SellDetails> selectBestSeller();
	List<BestSeller> bestSeller();
}
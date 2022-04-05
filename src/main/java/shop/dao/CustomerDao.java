package shop.dao;

import java.util.List;
import shop.entity.Customer;

public interface CustomerDao {
	Customer searchById(String accId);
	List<Customer> selectAll();
	Customer create(Customer entity);
	void update (Customer entity);
	Customer delete(String accid);
	String checkExist(String accID);
	String checkExistMail(String email);
}

package shop.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import shop.entity.Address;

public interface AddressDao {
	Address searchById(String id);
	List<Address> selectAll();
	Address create(Address entity);
	void update (Address entity);
	Address delete(String id);
	String checkExist(String id);
}

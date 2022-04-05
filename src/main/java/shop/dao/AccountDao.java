package shop.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import shop.entity.Account;

public interface AccountDao {
	Account searchById(String id);
	List<Account> selectAll();
	Account create(Account entity);
	void update (Account entity);
	Account delete(String id);
	String checkExist(String id);
}

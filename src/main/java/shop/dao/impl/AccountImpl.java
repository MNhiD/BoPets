package shop.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import shop.dao.AccountDao;
import shop.entity.Account;

@Transactional
@Repository
public class AccountImpl implements AccountDao {
	@Autowired
	SessionFactory factory;
	@Override
	public Account searchById(String id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Account AS c WHERE c.accountID = :accID";
		Query query = session.createQuery(hql);
		query.setParameter("accID", id);
		query.setMaxResults(1);
		List<Account> entity = query.list();
		Account cate = entity.get(0);
		System.out.println("password: "+cate.getPassword());
		return cate;
		
	}

	@Override
	public List<Account> selectAll() {
		String hql = "FROM Account";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Account> list = query.list();
		return list;
	}

	@Override
	public Account create(Account entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Account entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public Account delete(String id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Account AS c WHERE c.accountID = :accID";
		Query query = session.createQuery(hql);
		query.setParameter("accID", id);
		List<Account> entity = query.list();
		Account acc = entity.get(0);
		session.delete(acc);
		return acc;
	}
	@Override
	public String checkExist(String id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT c.accountID FROM Account c WHERE c.accountID = :accID";
		Query query = session.createQuery(hql);
		query.setParameter("accID", id);
		String accountId = (String) query.uniqueResult();    
		System.out.println("accountID:"+ accountId);
		return accountId;
	}
	
}

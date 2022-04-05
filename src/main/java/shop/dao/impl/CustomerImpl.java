package shop.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import shop.dao.CustomerDao;
import shop.entity.Customer;

@Transactional
@Repository
public class CustomerImpl implements CustomerDao {
	@Autowired
	SessionFactory factory;
	
	@Override
	public Customer searchById(String accId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Customer AS c WHERE c.accountID = :accID";
		Query query = session.createQuery(hql);
		query.setParameter("accID", accId);
		query.setMaxResults(1);
		List<Customer> entity = query.list();	                               	
		Customer cate = entity.get(0);
		return cate;
		
	}

	@Override
	public List<Customer> selectAll() {
		String hql = "FROM Customer";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Customer> list = query.list();
		return list;
	}

	@Override
	public Customer create(Customer entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Customer entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public Customer delete(String id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Customer AS c WHERE c.accountID = :accID";
		Query query = session.createQuery(hql);
		query.setParameter("accID", id);
		List<Customer> entity = query.list();
		Customer acc = entity.get(0);
		session.delete(acc);
		return acc;
	}
	
	@Override
	public String checkExist(String accId) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT c.accountID FROM Customer c WHERE c.accountID = :accID";
		Query query = session.createQuery(hql);
		query.setParameter("accID", accId);
		String accountId = (String) query.uniqueResult();    
		System.out.println("accountID:"+ accountId);
		return accountId;
	}
	@Override
	public String checkExistMail(String email) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT c.email FROM Customer c WHERE c.email = :mail";
		Query query = session.createQuery(hql).setMaxResults(1);
		query.setParameter("mail", email);		
		String rsMail = (String) query.uniqueResult();    
		System.out.println("accountID:"+ rsMail);
		return rsMail;
	}
}

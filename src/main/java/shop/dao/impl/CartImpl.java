package shop.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import shop.dao.CartDao;
import shop.entity.Cart;

@Transactional
@Repository
public class CartImpl implements CartDao {
	@Autowired
	SessionFactory factory;
	
	@Override
	public List<Cart> searchByCustomerId(int cId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Cart AS a WHERE a.customerID = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", cId);
		List<Cart> entity = query.list();	                               	
		return entity;
		
	}
	@Override
	public List<Cart> searchByProductId(String pId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Cart AS a WHERE a.productID = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", pId);
		List<Cart> entity = query.list();	                               	
		return entity;
		
	}

	@Override
	public List<Cart> selectAll() {
		String hql = "FROM Cart";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Cart> list = query.list();
		return list;
	}

	@Override
	public Cart create(Cart entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Cart entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}
	
	@Override
	public Cart delete(String pid, int uid) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Cart AS c WHERE c.productID = :id AND c.customerID = :uid";
		Query query = session.createQuery(hql);
		query.setParameter("id", pid);
		query.setParameter("uid", uid);
		List<Cart> entity = query.list();
		Cart ad = entity.get(0);
		session.delete(ad);
		return ad;
	}
	@Override
	public void delete(int uid) {
		Session session = factory.getCurrentSession();
		String hql = "DELETE FROM Cart AS c WHERE c.customerID = :uid";
		Query query = session.createQuery(hql);
		query.setParameter("uid", uid);
		query.executeUpdate();
	}

	@Override
	public String checkExist(String id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT c.customer FROM Address c WHERE c.customer = :id";
		Query query = session.createQuery(hql).setMaxResults(1);
		query.setParameter("id", id);		
		String cusId = (String) query.uniqueResult();    
		System.out.println("customerId:"+ cusId);
		return cusId;
	}
}

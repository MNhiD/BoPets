package shop.dao.impl;

import java.util.List;
import javax.persistence.TypedQuery;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import shop.dao.SellOrderDao;
import shop.entity.SellOrder;

@Transactional
@Repository
public class SellOrderImpl implements SellOrderDao {
	@Autowired
	SessionFactory factory;
	@Override
	public SellOrder searchById(String id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SellOrder AS p WHERE p.sellID = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<SellOrder> entity = query.list();
		SellOrder pd = entity.get(0);
		return pd;
		
	}
	@Override
	public List<SellOrder> searchByCustomerId(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SellOrder AS p WHERE p.customerID = :cID";
		Query query = session.createQuery(hql);
		query.setParameter("cID", id);
		List<SellOrder> entity = query.list();
		//SellOrder pd = entity.get(0);
		return entity;
	}
	@Override
	public List<SellOrder> searchByStatus(int customerID,String status) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SellOrder AS p WHERE p.status = :s AND p.customerID = :cID";
		Query query = session.createQuery(hql);
		query.setParameter("s", status);
		query.setParameter("cID", customerID);
		List<SellOrder> entity = query.list();
		return entity;
		
	}
	@Override
	public List<SellOrder> selectAll() {
		String hql = "FROM SellOrder";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<SellOrder> list = query.list();
		return list;
	}

	@Override
	public SellOrder create(SellOrder entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(SellOrder entity) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(entity);
			t.commit();
			System.out.println("success");
		} catch (Exception e) {
			t.rollback();
			System.out.println("fail");
		} finally {
			session.close();
		}
	}

	@Override
	public SellOrder delete(String id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product AS p WHERE p.productId = :pdID";
		Query query = session.createQuery(hql);
		query.setParameter("pdID", id);
		List<SellOrder> entity = query.list();
		SellOrder pd = entity.get(0);
		session.delete(pd);
		return pd;
	}

	@Override
	public List<SellOrder> searchByProductId(String prId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SellOrder p WHERE p.categories.categoryId=:cateID";//cateID: đặt bên controller
		Query query = session.createQuery(hql);
		query.setParameter("cateID", prId);
		List<SellOrder> entity = query.list();
		
		
		return entity;
	}
	@Override
	public String selectId() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT MAX(c.sellID) FROM SellOrder c";
		Query query = session.createQuery(hql);
		String mxId = (String) query.uniqueResult();    
		System.out.println("accountID:"+ mxId);
		return mxId;
	}
	@Override
	public List<SellOrder> selectPending() {
		String hql = "FROM SellOrder AS s WHERE s.status = 'pending'";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<SellOrder> list = query.list();
		return list;
	}

	@Override
	public List<SellOrder> selectSuccess() {
		String hql = "FROM SellOrder AS s WHERE s.status = 'success'";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<SellOrder> list = query.list();
		return list;
	}

	@Override
	public List<SellOrder> selectCancel() {
		String hql = "FROM SellOrder AS s WHERE s.status = 'cancel'";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<SellOrder> list = query.list();
		return list;
	}
	@Override
	public List<SellOrder> selectShipping() {
		String hql = "FROM SellOrder AS s WHERE s.status = 'delivery'";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<SellOrder> list = query.list();
		return list;
	}
	
}

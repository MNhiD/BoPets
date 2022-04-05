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

import shop.bean.BestSeller;
import shop.dao.SellDetailsDao;
import shop.entity.SellDetails;

@Transactional
@Repository
public class SellDetailsImpl implements SellDetailsDao {
	@Autowired
	SessionFactory factory;
	
	@Override
	public List<SellDetails> searchById(String id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SellDetails AS p WHERE p.sellID= :sID";
		Query query = session.createQuery(hql);
		query.setParameter("sID", id);
		List<SellDetails> entity = query.list();
		return entity;
	}

	@Override
	public List<SellDetails> selectAll() {
		String hql = "FROM SellDetails";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<SellDetails> list = query.list();
		return list;
	}

	@Override
	public SellDetails create(SellDetails entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}
	
	@Transactional
	@Override
	public void update(SellDetails entity) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(entity);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			System.out.println("fail");
		} finally {
			session.close();
		}
		System.out.println("success");
	}

	@Override
	public SellDetails delete(String id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SellDetails AS p WHERE p.productId = :pdID";
		Query query = session.createQuery(hql);
		query.setParameter("pdID", id);
		List<SellDetails> entity = query.list();
		SellDetails pd = entity.get(0);
		session.delete(pd);
		return pd;
	}
	
	@Override
	public List<SellDetails> selectBestSeller() {
//		String hql = "SELECT sd.productID.productID, "
//				+ "sum(sd.amount), "
//				+ "sum(sd.price) "
//				+ "FROM SellDetails AS sd "
//				+ "GROUP BY sd.productID.productID";
		
		String hql = "SELECT sd.productID.name, "
				+ "1, "
				+ "2 "
				+ "FROM SellDetails AS sd ";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<SellDetails> list = query.list();
		return list;
	}
	
	@Override
	public List<BestSeller> bestSeller() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT m.productID, COUNT(m.amount), SUM(m.price*m.amount) "
				+ "FROM (SELECT s.sellID, sd.productID, sd.amount, sd.price FROM (SELECT se.sellID FROM SELLORDER se WHERE se.status=:'success') as s "
				+ "INNER JOIN SELLDETAILS as sd ON s.sellID=:sd.sellID) as m "
				+ " GROUP BY m.productID";
		Query query = session.createQuery(hql);
		List<BestSeller> list = query.list();
		return list;
	}
}

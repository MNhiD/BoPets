package shop.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import shop.dao.AddressDao;
import shop.entity.Address;

@Transactional
@Repository
public class AddressImpl implements AddressDao {
	@Autowired
	SessionFactory factory;
	
	@Override
	public Address searchById(String adId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Address AS a WHERE a.customer = :adID";
		Query query = session.createQuery(hql);
		query.setParameter("adID", adId);
		query.setMaxResults(1);
		List<Address> entity = query.list();	                               	
		Address cate = entity.get(0);
		return cate;
		
	}

	@Override
	public List<Address> selectAll() {
		String hql = "FROM Address";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Address> list = query.list();
		return list;
	}

	@Override
	public Address create(Address entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Address entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public Address delete(String address) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Address AS c WHERE c.address = :add";
		Query query = session.createQuery(hql);
		query.setParameter("add", address);
		List<Address> entity = query.list();
		Address ad = entity.get(0);
		session.delete(ad);
		return ad;
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

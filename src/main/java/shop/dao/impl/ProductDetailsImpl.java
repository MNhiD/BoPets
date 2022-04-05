package shop.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import shop.dao.ProductDetailsDao;
import shop.entity.ProductDetails;

@Transactional
@Repository
public class ProductDetailsImpl implements ProductDetailsDao {
	@Autowired
	SessionFactory factory;
	@Override
	public ProductDetails searchById(String id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductDetails AS p WHERE p.productID = :pdID";
		Query query = session.createQuery(hql);
		query.setParameter("pdID", id);
		List<ProductDetails> entity = query.list();
		ProductDetails pd = entity.get(0);
		return pd;
		
	}

	@Override
	public List<ProductDetails> selectAll() {
		String hql = "FROM ProductDetails";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<ProductDetails> list = query.list();
		return list;
	}

	@Override
	public ProductDetails create(ProductDetails entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(ProductDetails entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public ProductDetails delete(String id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductDetails AS p WHERE p.productID = :pdID";
		Query query = session.createQuery(hql);
		query.setParameter("pdID", id);
		List<ProductDetails> entity = query.list();
		ProductDetails pd = entity.get(0);
		session.delete(pd);
		return pd; 
	}

	@Override
	public List<ProductDetails> searchByProductId(String productId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductDetails p WHERE p.productID=:pdID";//cateID: đặt bên controller
		Query query = session.createQuery(hql);
		query.setParameter("pdID", productId);
		List<ProductDetails> entity = query.list();
		
		
		return entity;
	}


	  @Override public List<ProductDetails> searchByKeyWord(String keywords) {
	  
	 
	  return null; 
	  }

	
}

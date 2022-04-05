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

import shop.dao.ProductDao;
import shop.entity.Product;

@Transactional
@Repository
public class ProductImpl implements ProductDao {
	@Autowired
	SessionFactory factory;
	@Override
	public Product searchById(String id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product AS p WHERE p.productId = :pdID";
		Query query = session.createQuery(hql);
		query.setParameter("pdID", id);
		List<Product> entity = query.list();
		Product pd = entity.get(0);
		return pd;
		
	}

	@Override
	public List<Product> selectAll() {
		String hql = "FROM Product";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
//		for(Product p:list) {
//			System.out.println(p.getName()+"-"+p.getStatus());
//		}
		return list;
	}

	@Override
	public Product create(Product entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}
	@Transactional
	@Override
	public void update(Product entity) {
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
	public Product delete(String id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product AS p WHERE p.productId = :pdID";
		Query query = session.createQuery(hql);
		query.setParameter("pdID", id);
		List<Product> entity = query.list();
		Product pd = entity.get(0);
		session.delete(pd);
		return pd;
	}

	@Override
	public List<Product> searchByCategoryId(String categoryId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product p WHERE p.categories.categoryId=:cateID";//cateID: đặt bên controller
		Query query = session.createQuery(hql);
		query.setParameter("cateID", categoryId);
		List<Product> entity = query.list();
		
		
		return entity;
	}

	@Override
	public List<Product> searchByKeyWord(String keywords) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product p WHERE p.name LIKE :key OR p.categories.name LIKE :key";//key: đặt bên controller
		Query query = session.createQuery(hql);
		query.setParameter("key", "%"+keywords+"%");
		List<Product> entity = query.list();
		
		
		return entity;
	}
	@Override
	public List<Product> filterByKey(String key) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product p WHERE p.name LIKE :key OR p.categories.name LIKE :key OR p.productId LIKE :key";//key: đặt bên controller
		Query query = session.createQuery(hql);
		query.setParameter("key", "%"+key+"%");
		List<Product> entity = query.list();
		return entity;
		
	}

	@Override
	public String getNewId() {
		Session session = factory.getCurrentSession();
		String hql = "Select MAX(p.productId) FROM Product p";
		Query query = session.createQuery(hql);
		String maxId = (String) query.uniqueResult();
		if(maxId==null) {
			return "P001";
		}
		else {
			
			Long max = (long) Integer.parseInt(maxId.substring(1));
			
			
			System.out.println("ID max: "+ max);
			return "P"+ String.format("%03d", max+1);
		}
	}
	@Override
	public List<Product> filterByPriceASC() {
		String hql="FROM Product p ORDER BY p.price ASC";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		List<Product> listProduct=query.list();
		return listProduct;
	}
	@Override
	public List<Product> filterByPriceDESC() {
		String hql="FROM Product p ORDER BY p.price DESC";
		Session session=factory.getCurrentSession();
		Query query=session.createQuery(hql);
		List<Product> listProduct=query.list();
		return listProduct;
	}
}

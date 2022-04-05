package shop.dao.impl;

import java.util.List;
import javax.persistence.TypedQuery;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import shop.dao.CategoryDao;
import shop.entity.Category;

@Transactional
@Repository
public class CategoryImpl implements CategoryDao {
	@Autowired
	SessionFactory factory;
	@Override
	public Category searchById(String id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Category AS c WHERE c.categoryId = :cateID";
		Query query = session.createQuery(hql);
		query.setParameter("cateID", id);
		List<Category> entity = query.list();
		Category cate = entity.get(0);
		return cate;
		
	}

	@Override
	public List<Category> selectAll() {
		String hql = "FROM Category";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Category> list = query.list();
		return list;
	}

	@Override
	public Category create(Category entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Category entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public Category delete(String id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Category AS c WHERE c.categoryId = :cateID";
		Query query = session.createQuery(hql);
		query.setParameter("cateID", id);
		List<Category> entity = query.list();
		Category cate = entity.get(0);
		session.delete(cate);
		return cate;
	}

	
}

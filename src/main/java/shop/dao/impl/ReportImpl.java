package shop.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import shop.dao.ReportDao;
import shop.entity.Product;
import shop.entity.SellDetails;

@Transactional
@Repository
public class ReportImpl implements ReportDao {
	@Autowired
	SessionFactory factory;
	
	@Override
	public List<Object[]> revenueByCategory() {
		Session session = factory.getCurrentSession();
//		String hql="SELECT s.product.category.name,"
//				+"SUM(s.amount*s.price),"
//				+"SUM(s.amount),"
//				+"MIN(s.price),"
//				+"MAX(s.price),"
//				+"AVG(s.price) "
//				+"FROM SELLDETAILS s "
//				+"GROUP BY s.product.category.name";
		
		String hql="SELECT s.productID.categories.name,"
				+"SUM(s.amount),"
				+"SUM(s.productID.price*s.amount),"
				+"MIN(s.productID.price),"
				+"MAX(s.productID.price),"
				+"AVG(s.productID.price) " 
				+"FROM SellDetails AS s "
				+"GROUP BY s.productID.categories.name";
		
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		
		return list;
	}

	@Override
	public List<Object[]> revenueByMonth() {
		Session session=factory.getCurrentSession();
		String hql="SELECT MONTH(s.sellID.orderDate) ,"
				+"SUM(s.amount*s.price),"
				+"SUM(s.amount),"
				+"MIN(s.price),"
				+"MAX(s.price),"
				+"AVG(s.price) "
				+"FROM SellDetails s "
				+"GROUP BY MONTH(s.sellID.orderDate)";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		return list;
	}
}

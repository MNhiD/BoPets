package shop.dao;

import java.util.List;

public interface ReportDao {
	public List<Object[]> revenueByCategory();
	public List<Object[]> revenueByMonth();
}

package shop.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;
import shop.dao.ProductDao;
import shop.entity.Product;
@Scope(value= WebApplicationContext.SCOPE_SESSION, proxyMode=ScopedProxyMode.TARGET_CLASS)
@Service
public class CartService {
	@Autowired
	ProductDao pDao;
	
	Map<String, Product> map = new HashMap<>();
	public void add(String id) {
		Product p = map.get(id);
		if(p == null) {
			p = pDao.searchById(id);
			p.setAmount(1);
			map.put(id, p);
		}
		else {
			p.setAmount(p.getAmount()+1);
		}
	}
	public void create (Product product) {
		map.put(product.getProductId(), product);
		
	}
	public void remove(String id) {
		map.remove(id);
	}
	public void update(String id, int quantity) {
		Product p = map.get(id);
		p.setAmount(quantity);
	}
	public void clear() {
		map.clear();
	}
	public int getCount() {
		Collection<Product> ps = this.getCartItems();
		int count =0;
		for(Product p : ps) {
			count += p.getAmount();
		}
		return count;
		
	}
	public long getTotal() {
		Collection<Product> ps = this.getCartItems();
		long total =0;
		for(Product p : ps) {
			total += (p.getAmount() * p.getPrice());
		}
		return total;
	}
	public Collection<Product> getCartItems() {
		return map.values();
	}
	
}

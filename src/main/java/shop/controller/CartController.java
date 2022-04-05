package shop.controller;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import shop.bean.ProductSellDetails;
import shop.dao.CustomerDao;
import shop.dao.ProductDao;
import shop.dao.SellOrderDao;
import shop.dao.SellDetailsDao;
import shop.entity.Account;
import shop.entity.Customer;
import shop.entity.Product;
import shop.entity.SellDetails;
import shop.entity.SellOrder;
import shop.service.CartService;

@Controller
/* @SessionAttributes("cart") */

public class CartController{
	@Autowired
	CartService cart;
	@Autowired
	HttpSession session;
	@Autowired
	CustomerDao cusDao;
	@Autowired
	SellOrderDao sellDao;
	@Autowired
	SellDetailsDao detailsDao;
	@Autowired
	ProductDao pDao;
	  
	
	@ResponseBody
	@RequestMapping("addToCart")
	public String add(@RequestParam("productId") String productId, Model model, HttpServletRequest request) {
			cart.add(productId);
			System.out.println("Số lượng hiện tại: "+ cart.getCount());
			String count = String.valueOf(cart.getCount());
			return count;
	}
	
	@RequestMapping("details/addToCart")
	public String addToCartInDetails(@RequestParam("productId") String productId) {
		cart.add(productId);
		System.out.println("Số lượng hiện tại: "+ cart.getCount());
		String count = String.valueOf(cart.getCount());
		return count;
	}
	
	@RequestMapping("search-by-category/addToCart")
	public String addToCartInCate(@RequestParam("productId") String productId) {
		cart.add(productId);
		System.out.println("Số lượng hiện tại: "+ cart.getCount());
		String count = String.valueOf(cart.getCount());
		return count;
	}
	@RequestMapping("cart/remove")
	public String removeCart(@RequestParam("productId") String productId) {
		cart.remove(productId);
		return ""+cart.getCount();
	}
	@RequestMapping("cart/update")
	public String updateAmount(@RequestParam("amount") int amount, @RequestParam("productId") String productId) {
		cart.update(productId, amount);
		System.out.println("ĐÃ cập nhật số lượng: "+ cart.getCount());
		return ""+amount;
	}
	@RequestMapping("buynow/{id}")
	public String buyNow(Model model, @PathVariable("id") String productId) {
		cart.add(productId);
		
		List<Product> list = new ArrayList<Product>();
		for(Product p : cart.getCartItems()) {
			System.out.println("Thông tin các sản phẩm: ");
			System.out.println("Tên sản phẩm:"+ p.getName());
			list.add(p);
		}
		session.setAttribute("cart", list);
		session.setAttribute("count", cart.getTotal());
		session.setAttribute("amountCart", cart.getCount());
		return "user/shopping-cart";
	}
	@RequestMapping("checkout")
	public String showCheckout(Model model) {
		List<Product> list = new ArrayList<Product>();
		for(Product p : cart.getCartItems()) {
			System.out.println("Thông tin các sản phẩm: ");
			System.out.println("Tên sản phẩm:"+ p.getName());
			list.add(p);
		}
		for(Product a : list) {
			System.out.println("Thông tin sản phẩm của list!");
			System.out.println("Sản phẩm của list: "+ a.getName());			
		}
		session.setAttribute("cart", list);
		session.setAttribute("count", cart.getTotal());
		session.setAttribute("amountCart", cart.getCount());
		return "user/shopping-cart";
	}
	
	
	@RequestMapping(value="order", method=RequestMethod.GET)
	public String showOrder(Model model) {
		Account acc = (Account) session.getAttribute("account");
		Customer customer = cusDao.searchById(acc.getAccountID());
		model.addAttribute("cus", customer);
		model.addAttribute("total", cart.getTotal());
		session.setAttribute("amountCart", cart.getCount());
		return "user/order";
	}
	@RequestMapping(value="order", method=RequestMethod.POST)
	public String purchase(Model model, HttpServletRequest request , HttpServletResponse response) {
		String fname = request.getParameter("fname");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String notes = request.getParameter("notes");
		long total = cart.getTotal()+ 35000;
		if(fname.equals("")) {
			model.addAttribute("message","Tên không được để trống");
			return "redirect:checkout.htm";
		}
		else if(address.equals("")) {
			model.addAttribute("message", "Địa chỉ không tồn tại!");
			return "redirect:checkout.htm";
		}
		if(cart.getCartItems()==null || total == 35000 ){
			model.addAttribute("message", "Giỏ hàng trống");
			return "redirect:checkout.htm";
		}
		else {
			System.out.println("ID hiện trong order: "+ sellDao.selectId());
			int id = 0;
			if(sellDao.selectId()==null) {
				id = 1;
			}
			else {
				id = Integer.parseInt(sellDao.selectId())+1;
			}
			String sellID = String.valueOf(id);
			System.out.println("SellID : "+ sellID);
			HttpSession session = request.getSession();
			Account acc = (Account) session.getAttribute("account");
			Customer cus = cusDao.searchById(acc.getAccountID());			
			Date date = new Date();
			
			System.out.println("Ngày: "+ date);
			SellOrder sell = new SellOrder(sellID, cus.getCustomerID(),date , "pending", false, total, notes, address);
			sellDao.create(sell);
			System.out.println("ĐÃ thêm vào bảng sellOrder");
			for(Product p : cart.getCartItems()) {
				int amount = p.getAmount();
				int price  = p.getAmount() * p.getPrice();
				//SellDetails sellDt = new SellDetails(sellID, p.getProductId(), amount, price);
				SellDetails sellDt = new SellDetails();
				sellDt.setSellID(sell);
				sellDt.setProductID(p);
				sellDt.setAmount(amount);
				sellDt.setPrice(price);
				//System.out.println("Chưa thêm vào sellDetails");
				detailsDao.create(sellDt);
			}
			cart.clear();
			//session.removeAttribute("cart");
			return "redirect:purchase.htm";
			
		}
		
	}
	@RequestMapping(value="{id}.htm",params="linkDetails")
	public String confirmSellOrder(ModelMap model, @PathVariable("id") String id, HttpServletRequest request) {
		
		List<SellDetails> sellDetails = detailsDao.searchById(id);
		
		List<ProductSellDetails> psd = new ArrayList<ProductSellDetails>();
		
		for(SellDetails s : sellDetails) {

			//pDao.searchById(s.getProductID()).getName()
			ProductSellDetails p = new ProductSellDetails(s.getSellID().getSellID(),s.getProductID().getProductId(),s.getProductID().getName(),s.getAmount(),s.getPrice());
			System.out.println("SellID: "+ s.getSellID()+ "sản phẩm: "+ s.getProductID());
			psd.add(p);	
		}
		model.addAttribute("listDetails", psd);
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute("account");
		Customer customer = cusDao.searchById(acc.getAccountID());
		List<SellOrder> listAll = sellDao.searchByCustomerId(customer.getCustomerID());
		model.addAttribute("listAll", listAll);
		List<SellOrder> listStatus = sellDao.searchByStatus(customer.getCustomerID(),"pending");
		model.addAttribute("listStatus", listStatus);
		List<SellOrder> listShipping = sellDao.searchByStatus(customer.getCustomerID(),"delivery");
		model.addAttribute("listShipping", listShipping);
		List<SellOrder> listCancel = sellDao.searchByStatus(customer.getCustomerID(),"cancel");
		model.addAttribute("listCancel", listCancel);
		return "user/purchase";
	
	}
}

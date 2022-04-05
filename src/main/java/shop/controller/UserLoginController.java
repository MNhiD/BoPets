package shop.controller;

import java.io.IOException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import shop.bean.MailInfo;
import shop.dao.AccountDao;
import shop.dao.CartDao;
import shop.dao.CustomerDao;
import shop.dao.ProductDao;
import shop.entity.Account;
import shop.entity.Cart;
import shop.entity.Customer;
import shop.entity.Product;
import shop.service.CartService;
import shop.service.MailService;

@Controller
public class UserLoginController {
	@Autowired
	CartService cart;
	@Autowired
	AccountDao accDao;
	@Autowired
	CustomerDao customerDao;
	@Autowired
	HttpSession session;
	@Autowired
	MailService mailer;
	@Autowired
	CartDao cartDao;
	@Autowired
	ProductDao pDao;
	
	@RequestMapping(value="user-login", method = RequestMethod.GET)
	public String loginShow(Model model,HttpServletRequest request,HttpServletResponse response) {
		Cookie arr[] = request.getCookies();
		if(arr !=null) {
			for(Cookie o : arr) {
				if(o.getName().equals("userID")) {
					request.setAttribute("uid", o.getValue());				
				}
				if(o.getName().equals("pass")) {
					request.setAttribute("upw", o.getValue());				
				}
			}
		}
		return "user/login";
	}
	@RequestMapping(value = "user-login",method=RequestMethod.POST)
	public String login(ModelMap model,@RequestParam("accountId") String accountId,
			@RequestParam("password") String pass,
			HttpServletRequest request,HttpServletResponse response) throws IOException {
			String remember = request.getParameter("remember");
			
			 String check = accDao.checkExist(accountId);
			 
			 System.out.println("ĐÃ tìm thấy acc:"+ check);
			if(check == null) {
				model.addAttribute("message", "Tài khoản không tồn tại!");
				System.out.println("Tài khoản không tồn tại!");
				return "user/login";
			}
			else {
				Account acc = accDao.searchById(accountId);
			
				if(!pass.equals(acc.getPassword())) {
					model.addAttribute("message","Sai mật khẩu!");
					System.out.println("Sai mật khẩu!");
					return "user/login";
				}
				else{
					session.setAttribute("account", acc);
					model.addAttribute("message","");
					System.out.println("Đăng nhập thành công!");
					Cookie u = new Cookie("userID", acc.getAccountID());
					Cookie p = new Cookie("pass", acc.getPassword());
					u.setMaxAge(60*60);
					//Lưu đăng nhập
					if(remember !=null) {					
						p.setMaxAge(60*60);
					}
					else {
						p.setMaxAge(0); 
					}
					response.addCookie(u);
					response.addCookie(p);
					//load giỏ hàng
					Customer customer = customerDao.searchById(u.getValue());
					List<Cart> list = cartDao.searchByCustomerId(customer.getCustomerID());
					System.out.println("List ds sp của:"+ customer.getAccountID());					
					if(list!=null) {						
						Product product = new Product();
						for(Cart a : list) {
							System.out.println("Dòng 1 trong list cart"+ a.getProductID());
							product = pDao.searchById(a.getProductID());
							product.setAmount(a.getAmount());
							cart.create(product);
						}
					}
					
					System.out.println("Sản phẩm trong cartService: "+ cart.getCount());
					
					return "redirect:user.htm";
				}
			}
		
	}
	@RequestMapping(value = "user-logout")
	public String logout(ModelMap model, HttpServletRequest request) {
		System.out.println();
		//lưu lại giỏ hàng
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute("account");
		Customer customer = customerDao.searchById(acc.getAccountID());
		System.out.println("Kiểm tra mảng null"+cartDao.searchByCustomerId(customer.getCustomerID()));
		if(cartDao.searchByCustomerId(customer.getCustomerID())!=null) {
			System.out.println("Xóa sp trong csdl");
			cartDao.delete(customer.getCustomerID());
			System.out.println("Duyệt gán lại gio");
			for(Product p : cart.getCartItems()) {
				Cart c = new Cart();
				c.setProductID(p.getProductId());
				c.setCustomerID(customer.getCustomerID());
				c.setAmount(p.getAmount());
				cartDao.create(c);
			}
		}
		else {
			for(Product p : cart.getCartItems()) {
				Cart c = new Cart();
				c.setProductID(p.getProductId());
				c.setCustomerID(customer.getCustomerID());
				c.setAmount(p.getAmount());
				cartDao.create(c);
			}
		}
		
		//
		cart.clear();
		session.removeAttribute("amountCart");
		session.removeAttribute("account");
		
		return "user/index";
	}
	@RequestMapping(value="user-register", method = RequestMethod.GET)
	public String registerShow(Model model) {
		
		return "user/register";
	}
	@RequestMapping(value="user-register", method = RequestMethod.POST)
	public String register(Model model, HttpServletRequest request, HttpServletResponse response ) throws IOException, MessagingException {
		String accountID = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String rePass = request.getParameter("rePassword");
		String phone = request.getParameter("phone");
		if(!password.equals(rePass)) {
			model.addAttribute("message", "Mật khẩu không khớp");
			return "user/register";
		}
		else {
			Customer customer = new Customer(phone, email, "", accountID)  ;
			String check = customerDao.checkExist(accountID);
			if(check==null) {
				Account acc = new Account(accountID, password, "user.png", false, "customer");
				accDao.create(acc);
				customerDao.create(customer);
				session.setAttribute("account", acc);
				
				String from ="cadsv57711@gmail.com";
				String to = customer.getEmail();
				String subject ="[BOPETS-SHOP] - Yêu cầu kích hoạt tài khoản của bạn!";
				String url = request.getRequestURL().toString().replace("user-register",customer.getAccountID());
				String content ="Cảm ơn bạn đã tin dùng sản phẩm của BoPets. Click vào <a href ='"+url+"'>đây</a> để kích hoạt tài khoản và tiếp tục mua sắm. ";
				MailInfo mail = new MailInfo(from, to, subject, content);
				mailer.send(mail);
				
				return "user/index";
			}
			else {
				model.addAttribute("message", "Tên người dùng đã tồn tại!");
				return "user/register";
			}
		}
	}
	@RequestMapping("{userId}")
	public String active(Model model, @PathVariable("userId") String id) {
		Account user = accDao.searchById(id);
		user.setStatus(true);
		accDao.update(user);
		return "redirect:user-login.htm";
	}
	@RequestMapping(value ="user-forgot",method = RequestMethod.GET)
	public String forgotShow() {
		return "user/forgot";
	}
	@RequestMapping(value="user-forgot",method = RequestMethod.POST)
	public String forgot(Model model,HttpServletRequest request) throws MessagingException {
		  String accountId = request.getParameter("username"); 	
		  String email =request.getParameter("email");

		String check = customerDao.checkExist(accountId);
			String checkMail = customerDao.checkExistMail(email);
			if(check==null) {
				model.addAttribute("message", "Người dùng không tồn tại!");
				return "user/forgot";
			}
			else if(!email.equals(checkMail)){
				model.addAttribute("message", "Email chưa được đăng ký!");
				return "user/forgot";
			}
			else {
				Account account = accDao.searchById(accountId);				
				String from ="cadsv57711@gmail.com";
				String to = checkMail;
				String subject ="[BOPETS-SHOP] - Yêu cầu lấy lại mật khẩu.";
				String content ="Cảm ơn bạn đã tin dùng sản phẩm của BoPets.<br> Mật khẩu của bạn là: "+account.getPassword();
				MailInfo mail = new MailInfo(from, to, subject, content);
				mailer.send(mail);
				model.addAttribute("message","Kiểm tra email để nhận lại mật khẩu.");
				return "redirect: user-login.htm";
			}
			
	}
}

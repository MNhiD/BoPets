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
			 
			 System.out.println("???? t??m th???y acc:"+ check);
			if(check == null) {
				model.addAttribute("message", "T??i kho???n kh??ng t???n t???i!");
				System.out.println("T??i kho???n kh??ng t???n t???i!");
				return "user/login";
			}
			else {
				Account acc = accDao.searchById(accountId);
			
				if(!pass.equals(acc.getPassword())) {
					model.addAttribute("message","Sai m???t kh???u!");
					System.out.println("Sai m???t kh???u!");
					return "user/login";
				}
				else{
					session.setAttribute("account", acc);
					model.addAttribute("message","");
					System.out.println("????ng nh???p th??nh c??ng!");
					Cookie u = new Cookie("userID", acc.getAccountID());
					Cookie p = new Cookie("pass", acc.getPassword());
					u.setMaxAge(60*60);
					//L??u ????ng nh???p
					if(remember !=null) {					
						p.setMaxAge(60*60);
					}
					else {
						p.setMaxAge(0); 
					}
					response.addCookie(u);
					response.addCookie(p);
					//load gi??? h??ng
					Customer customer = customerDao.searchById(u.getValue());
					List<Cart> list = cartDao.searchByCustomerId(customer.getCustomerID());
					System.out.println("List ds sp c???a:"+ customer.getAccountID());					
					if(list!=null) {						
						Product product = new Product();
						for(Cart a : list) {
							System.out.println("D??ng 1 trong list cart"+ a.getProductID());
							product = pDao.searchById(a.getProductID());
							product.setAmount(a.getAmount());
							cart.create(product);
						}
					}
					
					System.out.println("S???n ph???m trong cartService: "+ cart.getCount());
					
					return "redirect:user.htm";
				}
			}
		
	}
	@RequestMapping(value = "user-logout")
	public String logout(ModelMap model, HttpServletRequest request) {
		System.out.println();
		//l??u l???i gi??? h??ng
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute("account");
		Customer customer = customerDao.searchById(acc.getAccountID());
		System.out.println("Ki???m tra m???ng null"+cartDao.searchByCustomerId(customer.getCustomerID()));
		if(cartDao.searchByCustomerId(customer.getCustomerID())!=null) {
			System.out.println("X??a sp trong csdl");
			cartDao.delete(customer.getCustomerID());
			System.out.println("Duy???t g??n l???i gio");
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
			model.addAttribute("message", "M???t kh???u kh??ng kh???p");
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
				String subject ="[BOPETS-SHOP] - Y??u c???u k??ch ho???t t??i kho???n c???a b???n!";
				String url = request.getRequestURL().toString().replace("user-register",customer.getAccountID());
				String content ="C???m ??n b???n ???? tin d??ng s???n ph???m c???a BoPets. Click v??o <a href ='"+url+"'>????y</a> ????? k??ch ho???t t??i kho???n v?? ti???p t???c mua s???m. ";
				MailInfo mail = new MailInfo(from, to, subject, content);
				mailer.send(mail);
				
				return "user/index";
			}
			else {
				model.addAttribute("message", "T??n ng?????i d??ng ???? t???n t???i!");
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
				model.addAttribute("message", "Ng?????i d??ng kh??ng t???n t???i!");
				return "user/forgot";
			}
			else if(!email.equals(checkMail)){
				model.addAttribute("message", "Email ch??a ???????c ????ng k??!");
				return "user/forgot";
			}
			else {
				Account account = accDao.searchById(accountId);				
				String from ="cadsv57711@gmail.com";
				String to = checkMail;
				String subject ="[BOPETS-SHOP] - Y??u c???u l???y l???i m???t kh???u.";
				String content ="C???m ??n b???n ???? tin d??ng s???n ph???m c???a BoPets.<br> M???t kh???u c???a b???n l??: "+account.getPassword();
				MailInfo mail = new MailInfo(from, to, subject, content);
				mailer.send(mail);
				model.addAttribute("message","Ki???m tra email ????? nh???n l???i m???t kh???u.");
				return "redirect: user-login.htm";
			}
			
	}
}

package shop.controller;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import shop.bean.MailInfo;
import shop.dao.AccountDao;
import shop.dao.CustomerDao;
import shop.entity.Account;
import shop.entity.Customer;
import shop.service.MailService;

@Controller

public class LoginAdmin {
	@Autowired
	AccountDao accDao;
	@Autowired
	MailService mailer;
	@Autowired
	CustomerDao cusDao;
	
	@RequestMapping(value="myadmin", method = RequestMethod.GET)
	public String login() {
		
		return "admin/login";
	}
	
	@RequestMapping(value = "myadmin", method = RequestMethod.POST)
	public String loginActive(Model model, @RequestParam("accountID") String accountID, @RequestParam("password") String password, 
			HttpServletRequest request, HttpServletResponse response) {
		/*
		 * String accountID = request.getParameter("accountID"); String password =
		 * request.getParameter("password");
		 */
		
		String check = accDao.checkExist(accountID);
		if(check != null) {
			Account acc = accDao.searchById(accountID);
			if(!acc.getPassword().equals(password)) {
				model.addAttribute("message", "Sai mật khẩu");
				return "admin/login";
			}
			else {
				if(!acc.getType().equals("admin")){
					model.addAttribute("message", "Tài khoản đã tồn tại!");
					return "admin/login";
				}
				else {					
					HttpSession session = request.getSession();
					session.setAttribute("admin", acc);
					System.out.println("Kiểu :"+ acc.getType());
					return "admin/index";
				}
			}
		}
		else {
			model.addAttribute("message","Tài khoản không tồn tại");
			return "admin/login";
		}
		
	}
	
	@RequestMapping("admin-logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		return "redirect: myadmin.htm";
	}
	
	@RequestMapping(value="admin-forgot", method = RequestMethod.GET)
	public String forgot() {
		
		return "admin/forgot";
	}
	
	@RequestMapping(value="admin-forgot", method = RequestMethod.POST)
	public String forgotSend(Model model, @RequestParam("email")String email, @RequestParam("accountID")String accountID) throws MessagingException {
		String checkAccID = accDao.checkExist(accountID);
		if(checkAccID==null) {
			model.addAttribute("message", "Tên người dùng không tồn tại.");
			return "admin/forgot";
		}
		else {			
			Account acc = accDao.searchById(accountID);
			Customer customer = cusDao.searchById(acc.getAccountID());
			if(!customer.getEmail().equals(email) && !acc.getType().equals("admin")) {
				model.addAttribute("message", "Email chưa được đăng ký.");
				return "admin/forgot";
			}
			else {
				//gửi mail
				String from ="mannhi6755@gmail.com";
				String to = "n18dccn143@student.ptithcm.edu.vn";
				String subject ="[BOPETS-SHOP] - Yêu cầu lấy lại mật khẩu..";
				String content ="Quản trị viên đã nhận được yêu cầu cấp lại mật khẩu của bạn.<br> Mật khẩu của bạn là : "+acc.getPassword();
				MailInfo mail = new MailInfo(from, to, subject, content);
				mailer.send(mail);
				return "redirect:myadmin.htm";
			}
		}
	}
}

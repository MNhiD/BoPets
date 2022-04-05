package shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.dao.AccountDao;
import shop.dao.CategoryDao;
import shop.dao.CustomerDao;
import shop.dao.ProductDao;
import shop.dao.ProductDetailsDao;
import shop.dao.SellOrderDao;
import shop.entity.Account;
import shop.entity.Category;
import shop.entity.Customer;
import shop.entity.Product;
import shop.entity.ProductDetails;
import shop.entity.SellOrder;
import shop.service.CartService;
@Controller
@Transactional
public class UserController {
	@Autowired
	ProductDao pdDao;
	
	@Autowired
	CategoryDao cateDao;
	
	@Autowired
	ProductDetailsDao dtDao;
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	CartService cart;
	
	@Autowired
	SellOrderDao sellDao;
	
	@Autowired
	AccountDao accDao;
	
	@Autowired
	CustomerDao cusDao;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("user")
	public String showPage(ModelMap model, HttpServletRequest request) {
		List<Product> list = pdDao.selectAll();
		model.addAttribute("listProduct", list);
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		session.setAttribute("amountCart", cart.getCount());
		return "user/index";
	}
	
	@RequestMapping("list-product")
	public String listProduct(HttpServletRequest request, ModelMap model) {
		List<Product> list = pdDao.selectAll();
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		 /*End Show category */
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
	}
	@RequestMapping("search-by-keywords")
	public String searchByKeyWord(HttpServletRequest request, ModelMap model,
			@RequestParam("key") String keywords) {
		List<Product> list = pdDao.searchByKeyWord(keywords);
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		
		 /*End Show category */
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
		
	}
	//click searck by menu
	@RequestMapping("search-menu-dog")
	public String searchMenuDog(HttpServletRequest request, ModelMap model) {
		List<Product> list = pdDao.searchByKeyWord("chó");
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		 /*End Show category */
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
	}
	@RequestMapping("search-dog-corgi")
	public String searchDogCorgi(HttpServletRequest request, ModelMap model) {
		List<Product> list = pdDao.searchByKeyWord("corgi");
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		 /*End Show category */
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
	}
	@RequestMapping("search-dog-bug")
	public String searchDogBug(HttpServletRequest request, ModelMap model) {
		List<Product> list = pdDao.searchByKeyWord("bug");
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		 /*End Show category */
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
	}
	@RequestMapping("search-dog-husky")
	public String searchDogHusky(HttpServletRequest request, ModelMap model) {
		List<Product> list = pdDao.searchByKeyWord("husky");
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		 /*End Show category */
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
	}
	@RequestMapping("search-dog-shiba")
	public String searchDogShiba(HttpServletRequest request, ModelMap model) {
		List<Product> list = pdDao.searchByKeyWord("shiba");
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		 /*End Show category */
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
	}
	@RequestMapping("search-dog-golden")
	public String searchDogGolden(HttpServletRequest request, ModelMap model) {
		List<Product> list = pdDao.searchByKeyWord("golden");
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		 /*End Show category */
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
	}
	@RequestMapping("search-food")
	public String searchFood(HttpServletRequest request, ModelMap model) {
		List<Product> list = pdDao.searchByKeyWord("thức ăn");
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		 /*End Show category */
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
	}
	@RequestMapping("search-cat")
	public String searchCat(HttpServletRequest request, ModelMap model) {
		List<Product> list = pdDao.searchByKeyWord("mèo");
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		 /*End Show category */
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
	}
	@RequestMapping("search-cat-british")
	public String searchCatBritish(HttpServletRequest request, ModelMap model) {
		List<Product> list = pdDao.searchByKeyWord("mèo anh");
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		 /*End Show category */
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
	}
	@RequestMapping("search-cat-ragdoll")
	public String searchCatRagdoll(HttpServletRequest request, ModelMap model) {
		List<Product> list = pdDao.searchByKeyWord("ragdoll");
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		 /*End Show category */
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
	}
	@RequestMapping("search-cat-sphynx")
	public String searchCatSphynx(HttpServletRequest request, ModelMap model) {
		List<Product> list = pdDao.searchByKeyWord("mèo sphynx");
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		 /*End Show category */
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
	}
	@RequestMapping("search-cat-munchkin")
	public String searchCatMunchkin(HttpServletRequest request, ModelMap model) {
		List<Product> list = pdDao.searchByKeyWord("mèo munchkin");
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		 /*End Show category */
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
	}
	@RequestMapping("search-cat-food")
	public String searchCatFood(HttpServletRequest request, ModelMap model) {
		List<Product> list = pdDao.searchByKeyWord("thức ăn cho mèo");
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		 /*End Show category */
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
	}
	@RequestMapping("search-phukien")
	public String searchPhuKien(HttpServletRequest request, ModelMap model) {
		List<Product> list = pdDao.searchByKeyWord("phụ kiện");
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		 /*End Show category */
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
	}
	//end
	
	//filter
	@RequestMapping("product/filterASC")
	public String filterASC(HttpServletRequest request, ModelMap model) {
		List<Product> list = pdDao.filterByPriceASC();
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		 /*End Show category */
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
	}
	@RequestMapping("product/filterDESC")
	public String filterDESC(HttpServletRequest request, ModelMap model) {
		List<Product> list = pdDao.filterByPriceDESC();
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		 /*End Show category */
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
	}
	//end
	@RequestMapping("search-by-category/{cateID}")
	public String searchByCategory(HttpServletRequest request,ModelMap model ,@PathVariable(value="cateID") String categoryId) {
		Category cate = cateDao.searchById(categoryId);
		List<Product> list = cate.getPd();
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(9);
		model.addAttribute("pagedListHolder", pagedListHolder);
		/* Show category */
		List<Category> listCategories = cateDao.selectAll();
		model.addAttribute("cates", listCategories);
		session.setAttribute("amountCart", cart.getCount());
		return "user/list-product";
		
	}
	@RequestMapping("details-product")
	public String detailsProduct() {
		return "user/details-product";
	} 
	@RequestMapping("details/{id}")
	public String details(ModelMap model,
			@PathVariable("id") String productId) {
		Product prod = pdDao.searchById(productId);
		ProductDetails dt = dtDao.searchById(productId);
		model.addAttribute("prod", prod);		
		model.addAttribute("dt", dt);
		Category category = prod.getCategories();
		List<Product> listPd = pdDao.searchByCategoryId(category.getCategoryId());
		model.addAttribute("list", listPd);
		session.setAttribute("amountCart", cart.getCount());
		return "user/details-product";
	}
	@RequestMapping("contact")
	public String contactPage() {
		
		return "user/contact";
	}
	@RequestMapping("purchase")
	public String showPurchase(HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute("account");
		if(acc != null) {			
			Customer customer = cusDao.searchById(acc.getAccountID());
			List<SellOrder> listAll = sellDao.searchByCustomerId(customer.getCustomerID());
			model.addAttribute("listAll", listAll);
			List<SellOrder> listStatus = sellDao.searchByStatus(customer.getCustomerID(),"pending");
			model.addAttribute("listStatus", listStatus);
			List<SellOrder> listShipping = sellDao.searchByStatus(customer.getCustomerID(),"delivery");
			model.addAttribute("listShipping", listShipping);
			List<SellOrder> listCancel = sellDao.searchByStatus(customer.getCustomerID(),"cancel");
			model.addAttribute("listCancel", listCancel);
		}
		else {
			model.addAttribute("message", "Yêu cầu đăng nhập");
		}
		//end
		return "user/purchase";
	}
	//details SellID
	
	//end
	@RequestMapping(value="account", method = RequestMethod.GET)
	public String accountPg(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute("account");
		Customer customer = cusDao.searchById(acc.getAccountID());
		model.addAttribute("customer", customer);
		return "user/account";
	}
	@RequestMapping(value="account", method = RequestMethod.POST)
	public String changePassword(Model model, HttpServletRequest request) {
		String oldPass = request.getParameter("old-pass");
		System.out.println("Pass cũ: "+ oldPass);
		String newPass = request.getParameter("new-pass");
		System.out.println("Pass mới: "+ newPass);
		String rePass = request.getParameter("confirm-pass");
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute("account");
		System.out.println("Tên đăng nhập: "+ acc.getAccountID());
		if(!newPass.equals(rePass)) {
			model.addAttribute("mesage", "Mật khẩu không khớp!");
		}
		else if(!oldPass.equals(acc.getPassword())) {
			model.addAttribute("message", "Sai mật khẩu");
		}
		else {
			acc.setPassword(newPass);
			System.out.println("Đã set lại");
			accDao.update(acc);
			model.addAttribute("message", "");
			
		}
		session.setAttribute("amountCart", cart.getCount());
		return "user/account";
	}
}

package shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.mail.search.IntegerComparisonTerm;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javassist.compiler.ast.DoubleConst;
import shop.dao.CategoryDao;
import shop.dao.ProductDao;
import shop.dao.ProductDetailsDao;
import shop.dao.ReportDao;
import shop.dao.SellDetailsDao;
import shop.dao.SellOrderDao;
import shop.entity.Category;
import shop.entity.Product;
import shop.entity.ProductDetails;
import shop.entity.SellDetails;
import shop.entity.SellOrder;

@Controller
@Transactional
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	ServletContext app;
	
	@Autowired
	ProductDao pdao;
	
	@Autowired
	ProductDetailsDao pdDao;
	
	@Autowired
	CategoryDao cdao;
	
	@Autowired
	SellOrderDao sdao;
	
	@Autowired
	SellDetailsDao ddao;
	
	@Autowired
	ReportDao rdao;
	
/* Index page */
	/* Hien thi page index */
	
	@RequestMapping()
	public String showPage(ModelMap model) {
		
		List<Object[]> dataC = rdao.revenueByCategory();
		model.addAttribute("dataC", dataC);
		
		List<Object[]> dataM = rdao.revenueByMonth();
		model.addAttribute("dataM", dataM);
	 
		return "admin/index"; 
	}
/* End of Index page */  
	
	
/* Order page */
	/* Hien thi page order */
	@RequestMapping("order")
	public String listOrder(ModelMap model) {
		
		model.addAttribute("list", sdao.selectAll());
		
		model.addAttribute("listPending", sdao.selectPending());
		model.addAttribute("listShipping", sdao.selectShipping());
		model.addAttribute("listSuccess", sdao.selectSuccess());
		model.addAttribute("listCancel", sdao.selectCancel());
		
		return "admin/order";
	}

	@RequestMapping(value="{id}.htm",params="linkConfirm")
	public String confirmSellOrder(ModelMap model, @PathVariable("id") String id) {
		
		SellOrder sellOrder = sdao.searchById(id);
		if(sellOrder.getStatus().equals("pending")) {
			sellOrder.setStatus("delivery");
			sdao.update(sellOrder);
			return "admin/order";
		}
		else {
			return "redirect: order.htm";
		}
	
	}
	
	@RequestMapping(value = "{id}.htm",params="linkCancel")
	public String createProduct(ModelMap model,@PathVariable("id") String id) {
		SellOrder sellOrder = sdao.searchById(id);
		if(sellOrder.getStatus().equals("pending")) {
			sellOrder.setStatus("cancel");
			sdao.update(sellOrder);
			return "admin/order";
		}
		else {
			return "redirect: order.htm";
		}
	}
	
/* End of Order page */
	
	
/* Prouct page */
	/* Hien thi page product */
	@RequestMapping(value="product", method = RequestMethod.GET)
	public String listProduct(ModelMap model,HttpServletRequest request) {
		
		List<Product> list = pdao.selectAll();
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(20);
		model.addAttribute("pagedListHolder", pagedListHolder);
		 
		List<Category> listCategories = cdao.selectAll();
		model.addAttribute("cates", listCategories);
		model.addAttribute("pid", pdao.getNewId());
		
		return "admin/product";
	}
	
	@RequestMapping(value="product",method = RequestMethod.POST)
	public String addProduct(ModelMap model, HttpServletRequest request) throws ParseException {
		String productID = pdao.getNewId();
		System.out.println("ID:"+ pdao.getNewId());
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String cost = request.getParameter("cost");
		String amount = request.getParameter("amount");
		String category = request.getParameter("categories");
		Category cate = cdao.searchById(category);
		String image = request.getParameter("image");
		String desc = request.getParameter("desc");
		String brand = request.getParameter("brand");
		String weight = request.getParameter("weight");
		String expDate = request.getParameter("expDate");
		System.out.println("chuỗi ngày: "+expDate);
		
		String fabric = request.getParameter("fabric");
		String volume = request.getParameter("volume");
		String classify = request.getParameter("classify");
		
		Product newProduct = new Product(productID,image,name,Integer.parseInt(amount),cate,desc,Integer.parseInt(price),Integer.parseInt(cost),"Còn hàng");
		pdao.create(newProduct);
		ProductDetails newpd = new ProductDetails();
		newpd.setProductID(productID);
		newpd.setBrand(brand);
		newpd.setWeight(Double.parseDouble(weight));
		if(fabric.length()==0) {
			newpd.setMaterial(null);
		}
		else {
			newpd.setMaterial(fabric);
		}
		if(volume.length()==0) {
			newpd.setVolume(null);
		}
		else {
			newpd.setVolume(Integer.parseInt(volume));
		}
		if(classify.length()==0) {
			newpd.setClassify(null);
		}
		else {
			newpd.setClassify(classify);
		}
		if(expDate.length()==0) {
			
			//ProductDetails newpd = new ProductDetails(brand,Double.parseDouble(weight),fabric,Integer.parseInt(volume),classify,productID);
			
			
			newpd.setExpDate(null);
			pdDao.create(newpd);
		}
		else {
			SimpleDateFormat inDateFmt = new SimpleDateFormat("yyyy-MM-dd");
			Date date = inDateFmt.parse(expDate);
			ProductDetails pd = new ProductDetails(brand,Double.parseDouble(weight),fabric,Integer.parseInt(volume),classify,date,productID);
			pdDao.create(newpd);
		}
		
		return "redirect:product.htm";
	}
	
	@RequestMapping(value = "{id}.htm",params = "linkEdit")
	public String editProduct(HttpServletRequest request, ModelMap model, @PathVariable("id") String id) {
		model.addAttribute("pid", id);
		Product pd = pdao.searchById(id);

		model.addAttribute("listP", pd);
		
		ProductDetails pDetails = pdDao.searchById(id);
		model.addAttribute("proDetails", pDetails);
		List<Category> listCategories = cdao.selectAll();
		model.addAttribute("cates", listCategories);
		//show table
		List<Product> list = pdao.selectAll();
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(20);
		model.addAttribute("pagedListHolder", pagedListHolder);
		
		return "admin/product";
	}
	
	@RequestMapping(value="product", params="btnEdit")
	public String edit_Product (HttpServletRequest request, ModelMap model) throws ParseException {
		ProductDetails newpd = new ProductDetails();
		String productId = request.getParameter("productId"); 
		System.out.println("ID update:"+ productId);
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		System.out.println("price: "+ price);
		String cost = request.getParameter("cost");
		String amount = request.getParameter("amount");
		String category = request.getParameter("categories");
		Category cate = cdao.searchById(category);
		String image = request.getParameter("image");
		String desc = request.getParameter("desc");
		//
		String brand = request.getParameter("brand");
		String status = request.getParameter("status");
		System.out.println("stt: "+status);
		String weight = request.getParameter("weight");
		String expDate = request.getParameter("expDate");
		String fabric = request.getParameter("fabric");
		String volume = request.getParameter("volume");
		String classify = request.getParameter("classify");
		if(!status.equals("Ngừng bán")) {
			
		
		if(image==null) {
			image = pdao.searchById(productId).getImage();
			
		}
		
		
		newpd.setBrand(brand);
		
		if(weight.length()==0) {
			newpd.setWeight(null);
		}
		else {
			newpd.setWeight(Double.parseDouble(weight));
		}
		
		if(expDate.length()==0) {
			newpd.setExpDate(null);
			System.out.println("Ngày rỗng");
		}
		else {
			SimpleDateFormat inDateFmt = new SimpleDateFormat("yyyy-MM-dd");
			Date date = inDateFmt.parse(expDate);
			System.out.println("Ngày:"+ date);
			newpd.setExpDate(date);
		}
		
		if(fabric.length()==0) {
			newpd.setMaterial(null);
		}
		else {
			newpd.setMaterial(fabric);
		}
		
		if(volume.length()==0) {
			newpd.setVolume(null);
		}
		else {
			newpd.setVolume(Integer.parseInt(volume));
		}
		
		if(classify.length()==0) {
			newpd.setClassify(null);
		}
		else {
			newpd.setClassify(classify);
		}
		Product newProduct = new Product(productId,image,name,Integer.parseInt(amount),cate,desc,Integer.parseInt(price),Integer.parseInt(cost),status);
		pdao.update(newProduct);		
		
		newpd.setProductID(productId);
		pdDao.update(newpd); 
		
			//show table                   
				List<Product> list = pdao.selectAll();
				PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
				int page = ServletRequestUtils.getIntParameter(request,"p",0);
				pagedListHolder.setPage(page);
				pagedListHolder.setMaxLinkedPages(3);
				pagedListHolder.setPageSize(20);
				model.addAttribute("pagedListHolder", pagedListHolder);

		return "admin/product";
		}
		else {
			return "redirect: product.htm";
		}
	}
	
	@RequestMapping(value = "{id}.htm",params = "linkDel")
	public String delProduct(ModelMap model, @PathVariable("id")String id, HttpServletRequest request) {
		Product product = pdao.searchById(id);
		product.setStatus("Ngừng bán");
		pdao.update(product);
		//show table                   
		List<Product> list = pdao.selectAll();
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(20);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/product";
	}
	
	@RequestMapping("filter-by-keyword.htm")
	public String filterByKeyWord(HttpServletRequest request, ModelMap model,
			@RequestParam("key") String key) {
		List<Product> list = pdao.filterByKey(key);
		PagedListHolder pagedListHolder = new PagedListHolder<Product>(list);
		int page = ServletRequestUtils.getIntParameter(request,"p",0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(3);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/product"; 
	}
/* End of Product page */
}

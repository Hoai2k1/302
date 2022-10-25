package ps17203.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;

import ps17203.entity.*;
import ps17203.entity.Product;
import ps17203.dao.*;
import ps17203.service.CookieService;
import ps17203.service.ParamService;
import ps17203.service.SessionService;

@Controller
@RequestMapping("/asm")
public class home {
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	JavaMailSender mailer;
	
	@Autowired
	ProductDAO dao;
	
	@Autowired
	GiohangDAO dao2;
	
	@Autowired
	CategoryDAO dao3;
	
	@Autowired
	AccountDAO dao4;
	
	@Autowired
	OrderDAO dao5;
	
	@Autowired
	OrderDetailDAO dao6;
	
	@Autowired
	SessionService session;
	
	@Autowired
	ServletContext context;
	
	@Autowired
	ParamService paramService;
	@Autowired
	CookieService cookieService;
	
	@RequestMapping("/dangky")
	public String dangky() {	
		return "dangky";
	}
	
	
// -----	home    -----
	@RequestMapping("/home")
	public String sort(Model model) {		
		List<Product> items = dao.findAll(); // truy van tat ca				
		model.addAttribute("items", items);
		List<Category> listsp = dao3.findAll();
		model.addAttribute("listsp", listsp);
		List<Giohang> listgh = dao2.findAll();
		var slgiohang = listgh.size();
		model.addAttribute("slgiohang", slgiohang);
 		return "index";		
	}
	// --------------------------------------------------------------------------------------
	// tim kiếm
	
	@RequestMapping("/home/name")
	public String name(Model model, @RequestParam("timname")String timname) {					
		//List<Product> items = dao.findByKeyword("%"+name+"%");
		List<Product> items = dao.findByKeyword("%"+timname+"%");
		model.addAttribute("items", items);			
		return "index";	
	}
	
	@RequestMapping("/sanpham/loai/{id}")
	public String loaisp(Model model,  @PathVariable("id") String id) {	
		var a = id;
		List<Product> items = dao.findByCategoryId(a);
		model.addAttribute("items", items);	
		List<Category> listsp = dao3.findAll();
		model.addAttribute("listsp", listsp);		
		return "index";	
	}
	
	@RequestMapping("/home/sanpham")
	public String listsp(Model model, @RequestParam("timname")String timname) {	
		List<Product> items = dao.findByKeyword("%"+timname+"%");
		model.addAttribute("items", items);			
		return "index";	
	}
	
	
	@RequestMapping("/quanly/item/index")
	public String itemindex(Model model) {
		List<Product> items = dao.findAll(); // truy van tat ca				
		model.addAttribute("items", items);
		return "index";
	}
	
	
	// --------------------------------------------------------------------------------------
	//   danh mục sản phẩm
	 @RequestMapping("/quanly")
	 public String quanly(Model model) {
			List<Product> items = dao.findAll(); // truy van tat ca				
			model.addAttribute("items", items);
			Product item = new Product();
			model.addAttribute("item", item);
		return "data/listsp";
	 }

		@ModelAttribute("faculties")
		public Map<String, String> getHobbies(){
			Map<String, String> map = new HashMap<>();
			map.put("1000", "samsung");
			map.put("1001", "iphone");
			map.put("1002", "oppo");
			map.put("1003", "xiaomi");
			map.put("1004", "realme");
			return map;
		}
		
		@RequestMapping("/quanly/delete/{id}")
		public String create(@PathVariable("id") int id) {
			dao.deleteById(id);
			return "redirect:/asm/quanly";
		}
	 
	 @RequestMapping("/quanly/edit/{id}")
	 public String edit(Model model, @PathVariable("id") int id) {
	 	Product item = dao.findById(id).get();
	 	model.addAttribute("item", item);
	 	List<Product> items = dao.findAll(); // truy van tat ca				
		model.addAttribute("items", items);
	 	return "data/listsp";
	 }
	 

	@RequestMapping("/quanly/create/{id}")
	public String create(Product item) {
		dao.save(item);
		return "redirect:/asm/quanly";
	}
	
	
	@RequestMapping("/quanly/new")
	public String loadnew(Model model) {
		Product item = new Product();
		model.addAttribute("item", item);
		return "redirect:/asm/quanly";
	}
	
	
	
	@RequestMapping("/quanly/loadhinh")
	public String upload(ModelMap model, 
			@RequestParam("image") MultipartFile image) {
		if(image.isEmpty()){
			model.addAttribute("message", "Vui lòng chọn file !");
		}
		else{
			try {
				String filename = image.getOriginalFilename();
				//String path = app.getRealPath("/images/"+filename);
				File file = new File(context.getRealPath("/images/"+filename));
				image.transferTo(file);
				model.addAttribute("name", image.getOriginalFilename());
				return "redirect:/asm/quanly";
			} 
			catch (Exception e) {
				model.addAttribute("message", "Lỗi lưu file !");
			}
		}
		return "data/listsp";
	}
	
	
	// --------------------------------------------------------------------------------------
	// cart
	
	int giamgia = 0;
	@RequestMapping("/cart")
	public String cart(Model model) {	
		List<Category> listsp = dao3.findAll();
		model.addAttribute("listsp", listsp);
		List<Giohang> items = dao2.findAll();
		model.addAttribute("items", items);
		var slgiohang = items.size();
		model.addAttribute("slgiohang", slgiohang);
		double tong = 0;
		for (int i = 0; i < items.size(); i++) {
			tong += items.get(i).getPrice2();
		}
		model.addAttribute("tong", tong);
		double tongtien = tong - giamgia;
		model.addAttribute("tongtien", tongtien);
		model.addAttribute("giamgia", giamgia);
		return "giohang";
	}

	ArrayList<Product> pro = new ArrayList<Product>();
	
	@RequestMapping("/home/add/{id}")
	public String cartadd(@PathVariable("id") int id) {
		Product item = dao.findById(id).get();
		List<Giohang> items = dao2.findAll();
		Giohang itemnew = new Giohang();
		itemnew.setId(id);
		itemnew.setName(item.getName());
		itemnew.setPrice(item.getPrice());
		itemnew.setImage(item.getImage());
		itemnew.setCategory(item.getCategory());
		if(items.size()>0) {
			
			for (int i = 0; i < items.size(); i++) {
				if(items.get(i).getName().equals(itemnew.getName()) && items.size()>0) {
					itemnew.setSoluong(items.get(i).getSoluong()+1.0);
					itemnew.setPrice2(itemnew.getPrice()*itemnew.getSoluong());
					dao2.deleteById(items.get(i).getId());
					break;
				}else {
					itemnew.setSoluong(1.0);
				}
			}
		}else {
			itemnew.setSoluong(1.0);
			
		}
		itemnew.setPrice2(itemnew.getPrice()*itemnew.getSoluong());
		dao2.save(itemnew);
		
		return "redirect:/asm/cart";
	}
	
	@RequestMapping("/cart/delete/{id}")
	public String deletecart(@PathVariable("id") int id) {
		dao2.deleteById(id);
		return "redirect:/asm/cart";
	}
	
	@RequestMapping("/cart/+/{id}")
	public String congsp(@PathVariable("id") int id) {
		Giohang item = dao2.findById(id).get();
		item.setSoluong(item.getSoluong()+1.0);
		item.setPrice2(item.getPrice()*item.getSoluong());
		dao2.save(item);
		return "redirect:/asm/cart";
	}
	
	@RequestMapping("/cart/-/{id}")
	public String trusp(@PathVariable("id") int id) {
		Giohang item = dao2.findById(id).get();
		if(item.getSoluong()>1) {
			item.setSoluong(item.getSoluong()-1.0);
			item.setPrice2(item.getPrice()*item.getSoluong());
			dao2.save(item);
		}
		return "redirect:/asm/cart";
	}
	
	@RequestMapping("/cart/thanhtoan")
	public String thanhtoan(Model model, Giohang items) {
		Order neworder = new Order();
		OrderDetail hdct = new OrderDetail();
//		int id = session.get("id");
//		Account ac = dao4.findById(id).get();
//		neworder.setAccount(ac);
//		String time =String.valueOf(java.time.LocalDate.now()) ;
		neworder.setCreateDate("2022-06-20");
		
//		dao5.save(neworder);
		dao2.deleteAll();
		return "redirect:/asm/cart";
	}
	
	
	// --------------------------------------------------------------------------------------
	// tk
	
	@RequestMapping("/tk/login")
	public String login() {
		String un = session.get("username");
		if(un==null) {	
			List<Account> tk = dao4.findAll();
			return "login";
		}else {
			return "redirect:/asm/home";
		}
		
	}
	
	@RequestMapping("/admin")
	public String load(Model model) {
		List<Product> items = dao.findAll(); // truy van tat ca				
		model.addAttribute("items", items);
		Product item = new Product();
		model.addAttribute("item", item);
		return "admin";
	}
	
	@PostMapping("/tk/login")
	public String checklogin(Model model) {
		String un = paramService.getString("username", "");
		String pw = paramService.getString("password", "");
		List<Account> tk = dao4.findAll();
		boolean rm = paramService.getBoolean("remember", false);
		for (int i = 0; i < tk.size(); i++) {
			if(un.equals(tk.get(i).getUsername()) && pw.equals(tk.get(i).getPassword())) {
				session.set("username", un);
				session.set("password", pw);
				session.set("id", tk.get(i).getId());
				if(rm==true) {
					cookieService.add("user", un, 10);
				}else {
					cookieService.remove("user");
				}
				if(tk.get(i).getAdmin()==true) {
					return "redirect:/asm/admin";
				}else {
					return "redirect:/asm/home";
				}
			}else {
				model.addAttribute("message", "Đăng nhập thất bại!");
			}
		}
		return "login";
	}
	
	@RequestMapping("/tk/dangxuat")
	public String dangxuat() {
		session.remove("username");
		return "redirect:/asm/tk/login";
	}
	
	@RequestMapping("/tk/index")
	public String indexdk(Model model) {
		Account item = new Account();
		model.addAttribute("item", item);
		return "dangky";
	}
	
	@RequestMapping("/tk/dk")
	public String dk(Account item,Model model) {
		String pass2 = paramService.getString("pass2", "");
		if(item.getUsername().equals("") || item.getPassword().equals("") 
				|| item.getPassword().equals(pass2)==false || item.getEmail().equals("")) {
			model.addAttribute("message", "Đăng ký thất bại!");
			Account items = new Account();
			model.addAttribute("item", items);
			return "dangky";
		}else {
		dao4.save(item);
		return "redirect:/asm/tk/login";
		}
	}
	
	
	
	@RequestMapping("/tk/dmk")
	public String dmk(Model model) {
		String un = session.get("username");
		String pw = session.get("password");
		System.out.println(un);
		System.out.println(pw);
		if(un==null) {
			return "redirect:/asm/tk/login";
		}else {
			Account item = new Account();
			model.addAttribute("item", item);
			return "tk/dmk";
		}
	}
	
	@PostMapping("/tk/dmk")
	public String dmk1(Model model,Account item) {
		String pass1 = paramService.getString("pass1", "");
		String pass2 = paramService.getString("pass2", "");
		String un = session.get("username");
		String pw = session.get("password");
		System.out.println(un);
		List<Account> list = dao4.findAll();
		if(item.getPassword().equals("")|| item.getPassword().equals(pw)==false || pass1.equals(pass2)==false) {
			model.addAttribute("message", "Đổi mật khẩu thất bại!");
			Account itemm = new Account();
			model.addAttribute("item", itemm);
			return "tk/dmk";
		}else {
			for (int i = 0; i < list.size(); i++) {
				if(list.get(i).getUsername().equals(un)) {
					list.get(i).setPassword(pass1);
					session.set("password", pass1);
					dao4.save(list.get(i));
				}
			}
		}
		return "redirect:/asm/home";
		
	}
	
	@RequestMapping("/tk/quenmk")
	public String quenmk() {
		return "tk/quenmk";
	}
	
	

	@PostMapping("/tk/quenmk")
	public String send(ModelMap model) {
		try{
			String to = paramService.getString("email", "");
			System.out.println(to);
			String from = "hoaihvps17203.fpt.edu.vn";
			String subject = "Lấy lại mật khẩu";
			List<Account> list = dao4.findAll();
			String body = "Thông tin tài khoan mật khẩu của bạn là: \n";
			String tk;
			String mk;
			for (int i = 0; i < list.size(); i++) {
				if(list.get(i).getEmail().equals(to)) {
					tk = list.get(i).getUsername();
					mk = list.get(i).getPassword();
					body += "Tk: " + tk + "\nMk: " + mk;
				}
			}
			// Tạo mail
			MimeMessage mail =mailer.createMimeMessage();
			// Sử dụng lớp trợ giúp
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			helper.setFrom(from, from);
			helper.setTo(to);
			helper.setReplyTo(from, from);
			helper.setSubject(subject);
			helper.setText(body, true);

			// Gửi mail
			mailer.send(mail);
			
			model.addAttribute("message", "Gửi email thành công !");
		}
		catch(Exception ex){
			model.addAttribute("message", "Gửi email thất bại !");
		}
		return "tk/quenmk";
	}
	
//	@RequestMapping("/tk/delete/{id}")
//	public String createtk(@PathVariable("id") int id) {
//		dao.deleteById(id);
//		return "redirect:/asm/quanly";
//	}
//	
	@RequestMapping("/tk/edit")
	public String edit(Model model) {
		Account item = new Account();
		item.setId(0);
		model.addAttribute("item", item);
		List<Account> items = dao4.findAll();
		model.addAttribute("items", items);
		return "tk/edit";
	}
	
	
	@RequestMapping("/tk/dk2/{id}")
	public String dk2(Account item,@PathVariable("id") int id) {
		System.out.println(id);
		dao4.save(item);
		return "redirect:/asm/tk/edit";
			
	}	
	
	
 @RequestMapping("/tk/edit/{id}")
 public String edittk(Model model, @PathVariable("id") int id) {
	 List<Account> items = dao4.findAll(); // truy van tat ca	
	for (int i = 0; i < items.size(); i++) {
		if(items.get(i).getId() == id) {
			model.addAttribute("item", items.get(i));
		}
	}
	model.addAttribute("items", items);
 	return "tk/edit";
 }
 
 @RequestMapping("/tk/delete/{id}")
 public String deletetk(@PathVariable("id") int id) {
	 dao4.deleteById(id);
 	return "redirect:/asm/tk/edit";
 }
	
	
}

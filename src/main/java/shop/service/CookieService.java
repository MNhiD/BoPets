//package shop.service;
//
//
//import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//@Service
//public class CookieService {
//	@Autowired
//	HttpServletRequest request;
//	
//	@Autowired
//	HttpServletResponse response;
//	
//	public Cookie create(String name, String value, int days) {
//		Cookie cookie = new Cookie(name, value);
//		cookie.setMaxAge(days*24*60*60);
//		cookie.setPath("/");
//		response.addCookie(cookie);
//		return cookie;
//	}
//	public Cookie read(String name) {
//		
//		Cookie[] cookies = request.getCookies();
//		if(cookies != null) {
//			for(Cookie cookie : cookies) {
//				if(cookie.getName().equalsIgnoreCase(name)) {
//					String value = cookie.getValue();
//					cookie.setValue(value);
//					return cookie;
//				}
//			}
//		}
//		return null;
//	}
//	public void delete(String name) {
//		this.create(name, "", 0);
//		
//	}
//}

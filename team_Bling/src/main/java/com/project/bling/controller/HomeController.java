package com.project.bling.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.domain.Criteria;
import com.project.bling.domain.PageMaker;
import com.project.bling.service.BasketService;
import com.project.bling.service.EventService;
import com.project.bling.service.NoticeService;
import com.project.bling.service.ProductService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	ProductService productService;
	@Autowired
	NoticeService noticeService;
	@Autowired
	BasketService basketService;
	@Autowired
	EventService eventService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		PageMaker pm = new PageMaker();
		Criteria sc = new Criteria();
		
		/**제품 사진 - 판매량순**/
		sc.setPerPageNum(3);
		pm.setScri(sc);
		pm.setStartPost(1);
		model.addAttribute("best", productService.prodBest(pm));
		
		/**제품 사진 - 신상품**/
		model.addAttribute("newProd", productService.prodNew(pm));
		
		/**제품 사진 - 반지**/
		String kind = "R";
		pm.setKind(kind);
		model.addAttribute("ring", productService.scrollnew(pm));
		
		/**제품 사진 - 목걸이**/
		kind = "N";
		pm.setKind(kind);
		model.addAttribute("neck", productService.scrollnew(pm));
		
		/**제품 사진 - 귀걸이**/
		kind = "E";
		pm.setKind(kind);
		model.addAttribute("ear", productService.scrollnew(pm));
		
		/**제품 사진 - 팔찌**/
		kind = "B";
		pm.setKind(kind);
		model.addAttribute("brac", productService.scrollnew(pm));
		
		
		// 공지사항
		int count = noticeService.listcount();
		sc.setPerPageNum(5);
		sc.setPage(1);
		pm.setScri(sc);	
		pm.setTotalCount(count);
		model.addAttribute("notice",noticeService.totalList(pm));
		
		// 이벤트
		model.addAttribute("event",eventService.eventlist());

		return "home";
	}
	
	//회원 로그인시 장바구니 갯수 가져오기
	@RequestMapping(value="/Header_cart.do")
	@ResponseBody
	public int cart_count(Locale locale, Model model, int midx) throws Exception{
		return basketService.cart_count(midx);
	}
	
	
	
}

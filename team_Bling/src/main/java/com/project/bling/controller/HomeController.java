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

import com.project.bling.domain.PageMaker;
import com.project.bling.service.ProductService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	ProductService productService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		PageMaker pm = new PageMaker();
		
		
		/**제품 사진 - 판매량순**/
		pm.setEnd(3);
		pm.setStart(1);
		model.addAttribute("best", productService.prodBest(pm));
		
		/**제품 사진 - 신상품**/
		pm.setEnd(3);
		pm.setStart(1);
		model.addAttribute("newProd", productService.prodNew(pm));
		
		/**제품 사진 - 반지**/
		String kind = "R";
		pm.setKind(kind);
		pm.setEnd(3);
		pm.setStart(1);
		model.addAttribute("ring", productService.scrollnew(pm));
		
		/**제품 사진 - 목걸이**/
		kind = "N";
		pm.setKind(kind);
		pm.setEnd(3);
		pm.setStart(1);
		model.addAttribute("neck", productService.scrollnew(pm));
		
		/**제품 사진 - 귀걸이**/
		kind = "E";
		pm.setKind(kind);
		pm.setEnd(3);
		pm.setStart(1);
		model.addAttribute("ear", productService.scrollnew(pm));
		
		/**제품 사진 - 팔찌**/
		kind = "B";
		pm.setKind(kind);
		pm.setEnd(3);
		pm.setStart(1);
		model.addAttribute("brac", productService.scrollnew(pm));
		
		return "home";
	}
	
	
	
	
	
}

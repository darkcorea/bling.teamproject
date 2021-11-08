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
		
		/**제품 사진 - 판매량순**/
		model.addAttribute("best", productService.prodBest());
		
		/**제품 사진 - 신상품**/
		model.addAttribute("newProd", productService.prodNew());
		
		/**제품 사진 - 반지**/
		String kind = "R";
		model.addAttribute("ring", productService.newList(kind));
		
		/**제품 사진 - 목걸이**/
		kind = "N";
		model.addAttribute("neck", productService.newList(kind));
		
		/**제품 사진 - 귀걸이**/
		kind = "E";
		model.addAttribute("ear", productService.newList(kind));
		
		/**제품 사진 - 팔찌**/
		kind = "B";
		model.addAttribute("brac", productService.newList(kind));
		
		return "home";
	}
	
	
	
	
	
}

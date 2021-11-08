package com.project.bling.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bling.service.BasketService;
import com.project.bling.vo.LikeVO;

@RequestMapping(value="/Basket")
@Controller
public class BasketController {

	@Autowired
	BasketService basketService;
	
	@RequestMapping(value="/cart.do")
	public String cart(Locale locale, Model model) {
		return "basket/cart";
	}
	
	@RequestMapping(value="/like.do") 
	public void like(LikeVO vo, HttpSession session, int yn, int pidx) { 
		int likeyn = yn; 
		int pidxx = pidx;
		
		if(likeyn == 0) {
			
		}else {
			
		}
	}
	 
}

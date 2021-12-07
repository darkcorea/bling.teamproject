package com.project.bling.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.service.DeliveryService;
import com.project.bling.vo.Product_QuestionVO;
import com.project.bling.vo.UserVO;

@RequestMapping(value="/Delivery")
@Controller
public class DeliveryController {

	@Autowired
	DeliveryService deliveryService;
	
	@RequestMapping(value="/main.do")
	public String cart(Locale locale, Model model, HttpSession session) throws Exception {
		
		// 로그인이 풀렸을 떄 대비해서 넣음
		if ( session.getAttribute("UserVO") == null) {return "redirect:/Login/main.do";}
		
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		int midx = uv.getMidx();
		
		model.addAttribute("list", deliveryService.deivery_list(midx));
		return "delivery/main";
	}
	
	
	// order_idx로 구매확정 하기
	@RequestMapping(value="/confirm_fn.do")
	@ResponseBody
	public int confirm_fn(int order_idx) throws Exception {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>"+order_idx);
		deliveryService.confirm_fn(order_idx);
		return 1;
	}

	
	
	
	
}

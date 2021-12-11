package com.project.bling.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.service.DeliveryService;
import com.project.bling.vo.CombineVO;
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
	
	
	// order_idx로 구매확정 하고 addmilege가 있으면 milege에 추가
	@RequestMapping(value="/confirm_fn.do")
	@ResponseBody
	public int confirm_fn(int order_idx, HttpSession session) throws Exception {
		
		// 회원정보 불러오기, 회원정보 담을 VO물러오기
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		CombineVO cv = new CombineVO();
		
		// 구매확정하기
		deliveryService.confirm_fn(order_idx);
		
		// 적립금 불러오기
		int ad_mile = deliveryService.addmileage_check(order_idx);
		
		// aaddmileage가 0 이 아니라면 
		if (ad_mile != 0) {
			
			// 유저 마일리지에 적립금 추가
			cv.setMileage(ad_mile);
			cv.setMidx(uv.getMidx());
			deliveryService.addmileage_user(cv);
			
			// 로그인 세션에 마일리지 추가
			uv.setMileage(uv.getMileage()+ad_mile);
			
			// order_idx로 적립금 0원으로 만들기
			deliveryService.addmileage_zero(order_idx);
			
			return ad_mile;
		}
		return 0;
	}

	
	// order_idx로 구매한 상품 정보 불러와서 뿌려 주기
	@RequestMapping(value="/order_list.do")
	@ResponseBody
	public List<CombineVO> order_list(int order_idx) throws Exception {
		return deliveryService.order_list(order_idx);
	}
	
	
}

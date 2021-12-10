package com.project.bling.ad_controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.ad_service.Ad_Order_deliveryService;
import com.project.bling.vo.CombineVO;

@RequestMapping(value="/Ad_order_delivery")
@Controller
public class Ad_Order_deliveryController {
	
	@Autowired
	Ad_Order_deliveryService ad_order_deliveryService;
	
	
	@RequestMapping(value="/order.do")
	public String orderListPage() throws Exception {
		
		return "admin/Order_delivery/order";
	}
	
	@ResponseBody
	@RequestMapping(value="/orderList.do")
	public List<CombineVO> orderList(Model model) throws Exception {
		System.out.println("관리자 주문리스트 컨트롤러 : orderlist 실행");
		return ad_order_deliveryService.orderList();
	}
	
	@ResponseBody
	@RequestMapping(value="/deliveryYN.do", produces = "text/html; charset=utf-8")
	public String deliveryYN(@RequestBody CombineVO vo) throws Exception {
		System.out.println("관리자 주문리스트 컨트롤러 : deliveryYN 실행");
		System.out.println("출고버튼으로 받은 order_idx : "+vo.getOrder_idx());
		System.out.println("출고버튼으로 받은 delivery_yn : "+vo.getDelivery_yn());
				
		
		ad_order_deliveryService.deliveryYN(vo);
		
		return "출고상태 변경";
	}

}

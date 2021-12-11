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
		
		//ajax로 화면 로딩시 출력할 데이터들을 return
		return ad_order_deliveryService.orderList();
	}
	
	@ResponseBody
	@RequestMapping(value="/prodStat.do")
	public String prodStat(@RequestBody CombineVO vo) throws Exception {
		System.out.println("관리자 주문리스트 컨트롤러 : prodStat 실행");
		System.out.println("주문상태 버튼으로 받은 kind : "+vo.getKind());
		System.out.println("주문상태 버튼으로 받은 order_idx : "+vo.getOrder_idx());
		
		
		//주문상태 변경
		ad_order_deliveryService.prodStat(vo);
		
		return "주문상태 변경";
	}

}

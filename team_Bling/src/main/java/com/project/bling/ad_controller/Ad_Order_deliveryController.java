package com.project.bling.ad_controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.ad_service.Ad_Order_deliveryService;
import com.project.bling.domain.Criteria;
import com.project.bling.domain.PageMaker;
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
	public Map<String, Object> orderList(@RequestBody Map<String,String> map) throws Exception {
		System.out.println("관리자 주문리스트 컨트롤러 : orderlist 실행");
		
		//System.out.println("관리자 주문 컨트롤러-page : "+sc.getPage());
		System.out.println("관리자 주문 컨트롤러-page : "+map.get("page"));
		System.out.println("관리자 주문 컨트롤러-kind : "+map.get("kind"));
		
		Criteria sc = new Criteria();
		PageMaker pm = new PageMaker();
		
		int page = Integer.parseInt(map.get("page"));
		sc.setPage(page);
		pm.setKind(map.get("kind"));;
		
		
		// 주문 개수
		int orderCnt = ad_order_deliveryService.orderCnt(pm);
		System.out.println("관리자 주문 컨트롤러-주문개수 : "+orderCnt);
		
		//페이징 정보1(page 정보는 매개변수 sc에 담겨있다)
		sc.setPerPageNum(10);
		
		//페이징 정보2
		pm.setScri(sc);
		pm.setStart(0);
		pm.setTotalCount(orderCnt);
		
		System.out.println("관리자 주문 컨트롤러-page : "+pm.getScri().getPage());
		System.out.println("관리자 주문 컨트롤러-perPageNum : "+pm.getScri().getPerPageNum());
		System.out.println("관리자 주문 컨트롤러-startPage : "+pm.getStartPage());
		System.out.println("관리자 주문 컨트롤러-endPage : "+pm.getEndPage());
		
		
		//"orderList" key에 주문 리스트들(List<CombineVO>), "pm" key에 페이징 정보들을 Map에 담는다.
		Map<String, Object> order = new HashMap<String, Object>();
		order.put("orderList", ad_order_deliveryService.orderList(pm));
		order.put("pm", pm);
		order.put("totalCnt",orderCnt);
		
		//ajax로 화면 로딩시 출력할 데이터들을 return
		return order;
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

	
	
	@RequestMapping(value="/delivery.do")
	public String deiListPage() throws Exception {
		
		return "admin/Order_delivery/delivery";
	}
}

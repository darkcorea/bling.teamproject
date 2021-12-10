package com.project.bling.ad_controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bling.ad_service.Ad_Order_deliveryService;

@RequestMapping(value="/Ad_order_delivery")
@Controller
public class Ad_Order_deliveryController {
	
	@Autowired
	Ad_Order_deliveryService ad_order_deliveryService;
	
	
	@RequestMapping(value="/order.do")
	public String order_list(Model model) throws Exception {
		model.addAttribute("orderList", ad_order_deliveryService.orderList());
		
		return "admin/Order_delivery/order";
	}

}

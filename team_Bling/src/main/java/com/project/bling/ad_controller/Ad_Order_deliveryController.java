package com.project.bling.ad_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value="/Ad_order_delivery")
@Controller
public class Ad_Order_deliveryController {
	
	@RequestMapping(value="/order.do")
	public String order_list() throws Exception {
		
		return "admin/Order_delivery/order";
	}

}

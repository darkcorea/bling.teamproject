package com.project.bling.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bling.service.DeliveryService;

@RequestMapping(value="/Delivery")
@Controller
public class DeliveryController {

	@Autowired
	DeliveryService deliveryService;
	
	@RequestMapping(value="/main.do")
	public String cart(Locale locale, Model model) {
		return "delivery/main";
	}
}

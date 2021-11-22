package com.project.bling.controller;


import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.service.OrderService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;



@RequestMapping(value="/Order")
@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	private IamportClient api;
	
	public OrderController() {
		this.api = new IamportClient("3564254598075286",
		"09b4251227197946b347a4966d32fff1025810b851cff06cae0cb25a423d4bca7eeb91cac31e6a2a");
	}
	
	@RequestMapping(value="/nonorder.do",method = RequestMethod.POST)
	public String nonorder(Model model,HttpServletRequest request) throws Exception {
		
		String jsonData = request.getParameter("jsonData");
		System.out.println(jsonData);


		int tot_price = Integer.parseInt(request.getParameter("tot_price"));
		String productname = request.getParameter("productname");
		System.out.println(tot_price);
		System.out.println(productname);
		model.addAttribute("jsonData", jsonData);
		model.addAttribute("tot_price", tot_price);
		model.addAttribute("productname",productname);
		return "order/nonorder";
		
	}
	@RequestMapping(value="/memberorder.do",method = RequestMethod.POST)
	public String memberorder(Model model,HttpServletRequest request) throws Exception {
		
		String jsonData = request.getParameter("jsonData");
		System.out.println(jsonData);
		int midx =  Integer.parseInt(request.getParameter("midx"));
		int tot_price = Integer.parseInt(request.getParameter("tot_price"));
		System.out.println(tot_price);
		System.out.println(midx);
		model.addAttribute("jsonData", jsonData);
		model.addAttribute("tot_price", tot_price);
		model.addAttribute("midx",midx);
		return "order/memberorder";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
	{	
			return api.paymentByImpUid(imp_uid);
	}
}

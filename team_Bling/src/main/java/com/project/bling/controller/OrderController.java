package com.project.bling.controller;


import java.io.IOException;
import java.util.List;
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
import com.project.bling.vo.NonorderVO;
import com.project.bling.vo.OrderVO;
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
	@RequestMapping(value="/orderinsert.do",method = RequestMethod.POST)
	@ResponseBody
	public int orderinsert(Model model,NonorderVO vo,HttpServletRequest request) throws Exception {
		String orderid = request.getParameter("orderid");
		System.out.println(orderid);
		model.addAttribute("orderid",orderid);
		orderService.insert(vo);
		return vo.getNonidx();
		
	}
	@RequestMapping(value="/orderdetailinsert.do",method = RequestMethod.POST)
	@ResponseBody
	public void orderdetailinsert(NonorderVO vo) throws Exception {
		orderService.detailInsert(vo);
	}
	
	@RequestMapping(value="/mileageupdate.do",method = RequestMethod.POST)
	@ResponseBody
	public void mileageupdate(OrderVO vo) throws Exception {
		
		System.out.println("마일리지>>>>>>>>>>"+vo.getMileage());
		System.out.println("midx>>>>>>>>>>"+vo.getMidx());
		orderService.mileageupdate(vo);
	}
	
	@RequestMapping(value="/memberorder.do",method = RequestMethod.POST)
	public String memberorder(Model model,HttpServletRequest request) throws Exception {
		String productname = request.getParameter("productname");
		String jsonData = request.getParameter("jsonData");
		System.out.println(jsonData);
		
		int tot_price = Integer.parseInt(request.getParameter("tot_price"));
		
		System.out.println(tot_price);
		
		
		model.addAttribute("productname",productname);
		model.addAttribute("jsonData", jsonData);
		model.addAttribute("tot_price", tot_price);
		
		
		return "order/memberorder";
		
	}
	@RequestMapping(value="/memberorderinsert.do",method = RequestMethod.POST)
	@ResponseBody
	public int memberorderinsert(OrderVO vo) throws Exception {
		
		orderService.memberinsert(vo);
		
		return vo.getOrder_idx();
	}
	@RequestMapping(value="/morderdetailinsert.do",method = RequestMethod.POST)
	@ResponseBody 
	public void morderdetailinsert(OrderVO vo) throws Exception {
		
		orderService.memberdetailInsert(vo);
	}
	@RequestMapping(value="/addr_select.do")
	@ResponseBody
	public List<OrderVO> addr_select(int midx) throws Exception {
		
		System.out.println("midx>>>>>>>>>"+midx);
		return orderService.addr_select(midx);
	}
	
}

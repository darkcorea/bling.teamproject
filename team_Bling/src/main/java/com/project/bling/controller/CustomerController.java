package com.project.bling.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.service.CustomerService;
import com.project.bling.vo.Product_QuestionVO;

@RequestMapping(value="/Customer")
@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;
	
	@RequestMapping(value="/main.do")
	public String main(Locale locale, Model model) {
		return "customer/main";
	}
	
	// 고객센터,마이페이지에서 문의하기 눌렀을 경우
	@RequestMapping(value="/question.do")
	public String Question(Locale locale, Model model) {
		return "customer/question";
	}
	
	// 상품 디테일에서 상문문의하기 버튼을 눌렀을 경우
	@RequestMapping(value="/product.do")
	public String product_Question(Locale locale, Model model, int pidx) {
		model.addAttribute("pidx",pidx);
		return "customer/product_question";
	}
	
	
	// 상품 디테일에서 문의하기를 보고 문의 내용 수정하기 버튼을 눌렀을 경우
	@RequestMapping(value="/product_modify.do")
	public String product_Question_modify(Locale locale, Model model, int pqidx) {
		return "customer/product_question";
	}
	
	
	// 상품 디테일 문의하기 제목을 누르고 비밀번호를 입력 했을 때 에이작스
	@RequestMapping(value="/detail_question.do")
	@ResponseBody
	public Product_QuestionVO product_pqidx(Locale locale, Model model,Product_QuestionVO pq) throws Exception {
		return customerService.product_pqidx(pq);
	}
	
}

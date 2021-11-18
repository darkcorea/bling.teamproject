package com.project.bling.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.domain.Criteria;
import com.project.bling.domain.PageMaker;
import com.project.bling.service.CustomerService;
import com.project.bling.service.NoticeService;
import com.project.bling.vo.Product_QuestionVO;

@RequestMapping(value="/Customer")
@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;
	
	@Autowired
	NoticeService noticeService;
	
	// 고객센터 메인페이지
	@RequestMapping(value="/main.do")
	public String main(Locale locale, Model model, int page) throws Exception{
		
		// 고객센터 문의 총 갯수
		int questionCount = noticeService.Question_Count();
		
		// 필요한 페이지 넘버와 한 페이지당 10개의 리스트 보여주기
		Criteria sc = new Criteria();
		sc.setPage(page);
		sc.setPerPageNum(10);
		
		// 페이징 하기 위해서 필요한 값들 넣음
		PageMaker pm = new PageMaker();
		pm.setScri(sc);
		pm.setTotalCount(questionCount);
		
		// 고객센터에서 필요한  pm과 문의페이징
		model.addAttribute("pm", pm);
		model.addAttribute("question", noticeService.Question_page(pm));
		
		return "customer/main";
	}
	
	// 고객센터,마이페이지에서 문의하기 버튼을 눌렀을 경우 문의 페이지로 이동
	@RequestMapping(value="/question.do")
	public String Question(Locale locale, Model model) {
		return "customer/question";
	}
	
	
	
	
	// 상품 디테일에서 상문문의하기 버튼을 눌렀을 경우에 상품문의하기 페이지로 이동
	@RequestMapping(value="/product.do")
	public String product_Question(Locale locale, Model model, int pidx) {
		model.addAttribute("pidx",pidx);
		return "customer/product_question";
	}
	
	// 상품 문의하기에서 저장 버튼을 눌렀을 경우에 문의내용을 등록하고 상품 디테일 페이지로 이동
	@RequestMapping(value="/product_write.do")
	public String product_write(Locale locale, Model model, Product_QuestionVO pq) throws Exception  {
		customerService.product_write(pq);
		return "redirect:/Product/detail.do?pidx="+pq.getPidx();
	}
	
	// 상품 디테일에서 문의하기를 보고 문의 내용 수정하기 버튼을 눌렀을 때 수정하기 페이지로 이동
	@RequestMapping(value="/product_modify.do",  method = RequestMethod.GET )
	public String product_Question_modify(Locale locale, Model model, int pqidx) throws Exception {
		model.addAttribute("question",customerService.product_question_one(pqidx));
		return "customer/product_question_modify";
	}
	
	// 상품 문의 수정페이지에서 수정하기 버튼을 눌렀을 때 수정완료하고 상품 디테일 페이지로 이동
	@RequestMapping(value="/product_modify.do",  method = RequestMethod.POST )
	public String product_Question_modify(Locale locale, Model model, Product_QuestionVO pq) throws Exception {
		customerService.product_modify(pq);
		return "redirect:/Product/detail.do?pidx="+pq.getPidx();
	}
	
	// 상품 디테일 문의하기 제목을 누르고 비밀번호를 입력 했을 때 에이작스
	@RequestMapping(value="/detail_question.do")
	@ResponseBody
	public Product_QuestionVO product_pqidx(Locale locale, Model model,Product_QuestionVO pq) throws Exception {
		return customerService.product_pqidx(pq);
	}
	
}

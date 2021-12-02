package com.project.bling.controller;



import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.domain.Criteria;
import com.project.bling.domain.PageMaker;
import com.project.bling.service.CustomerService;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.Product_QuestionVO;
import com.project.bling.vo.QuestionVO;

@RequestMapping(value="/Customer")
@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;
	
	// 고객센터 메인페이지
	@RequestMapping(value="/main.do")
	public String main(Locale locale, Model model, Criteria sc) throws Exception{
		
		// 필요한 페이지 넘버와 키워드 그리고 한 페이지당 10개의 리스트 보여주기
		sc.setPage(sc.getPage());
		sc.setPerPageNum(10);
		sc.setKeyword(sc.getKeyword());
		String type = "Q";
		
		// 페이징 하기 위해서 필요한 값들 넣음
		PageMaker pm = new PageMaker();
		pm.setScri(sc);
		pm.setType(type);
		
		// 고객센터 문의 총 갯수, 키워드(검색 기능) 넣음
		int questionCount = customerService.Question_Count(pm);
				
		pm.setTotalCount(questionCount);
		
		// 고객센터에서 필요한  pm과 문의페이징
		model.addAttribute("pm", pm);
		model.addAttribute("question", customerService.Question_page(pm));
		
		return "customer/main";
	}
	
	// 고객센터,마이페이지에서 문의하기 버튼을 눌렀을 경우 문의 페이지로 이동
	@RequestMapping(value="/question.do")
	public String Question(Locale locale, Model model) {
		return "customer/question";
	}
	
	
	// 문의 페이지에서 상품선택 버튼을 클릭 했을때 AJAX
	@RequestMapping(value="/product_select.do")
	@ResponseBody
	public List<CombineVO> product_select(Locale locale, Model model, int midx) throws Exception {
		return customerService.product_select(midx);
	}
	
	// 문의 페이지에서 상품 선택 버튼을 클릭하고 모달창에 나와 있는 상품들을 선택 했을 때 AJAX
	@RequestMapping(value="/detail_idx_select.do")
	@ResponseBody
	public List<CombineVO> detail_idx_select(Locale locale, Model model,
			@RequestParam("list[]") List<Integer> list) throws Exception {	
		//System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>"+list);
		return customerService.detail_idx_select(list);
	}
	
	// 고객센터, 마이페이지에서  문의하기를 등록 할 때
	@RequestMapping(value="/question_write.do")
	public String question_write(Locale locale, Model model, QuestionVO qv) throws Exception {
			customerService.question_write(qv);
		return "redirect:/Customer/main.do?page=1";
	}
	
	
	// 상품 디테일에서 상문문의하기 버튼을 눌렀을 경우에 상품문의하기 페이지로 이동
	@RequestMapping(value="/product.do")
	public String product_Question(Locale locale, Model model, int pidx) {
		model.addAttribute("pidx",pidx);
		return "customer/product_question";
	}
	
	// 상품 문의하기에서 저장 버튼을 눌렀을 경우에 문의내용을 등록하고 상품 디테일 페이지로 이동
	@RequestMapping(value="/product_write.do")
	public String product_write(Locale locale, Model model, Product_QuestionVO pq) throws Exception {
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
	
	// 나의 문의 내역 페이지 이동
	@RequestMapping(value="/my_qestion.do")
	public String my_qestion(Locale locale, Model model) {
		return "customer/my_qestion";
	}
	
}

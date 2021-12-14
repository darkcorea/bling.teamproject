package com.project.bling.controller;



import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.domain.Criteria;
import com.project.bling.domain.PageMaker;
import com.project.bling.service.CustomerService;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.Product_QuestionVO;
import com.project.bling.vo.QuestionVO;
import com.project.bling.vo.UserVO;

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
	public String Question(Locale locale, Model model, HttpSession session) {
		// 로그인이 풀렸을 떄 대비해서 넣음
		if ( session.getAttribute("UserVO") == null) {return "redirect:/Login/main.do";}
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
	public String product_Question(Locale locale, Model model, int pidx, HttpSession session) {
		
		// 로그인이 풀렸을 떄 대비해서 넣음
		if(session.getAttribute("UserVO") == null) {
			return "redirect:/Login/main.do";
		}
		
		model.addAttribute("pidx",pidx);
		return "customer/product_question";
	}
	
	// 상품 문의하기에서 저장 버튼을 눌렀을 경우에 문의내용을 등록하고 상품 디테일 페이지로 이동
	@RequestMapping(value="/product_write.do")
	public String product_write(Locale locale, Model model, Product_QuestionVO pq, HttpSession session) throws Exception {
		
		// 로그인이 풀렸을 떄 대비해서 넣음
		if(session.getAttribute("UserVO") == null) {
			return "redirect:/Login/main.do";
		}
				
		customerService.product_write(pq);
		return "redirect:/Product/detail.do?pidx="+pq.getPidx()+"#move_question";
	}
	
	// 로그인을 한  후에 보여주기를 N한 문의들을 자신은 볼 수 있게 바꿔주기
	@RequestMapping(value="/show_check.do")
	@ResponseBody
	public List<Product_QuestionVO> show_check(Locale locale, Model model,Product_QuestionVO pq, HttpSession session) throws Exception {
		
		// 로그인이 풀렸을 떄 대비해서 넣음
		if(session.getAttribute("UserVO") == null) {
			return null;
		}
		
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		//회원정보에서 회원번호만 선택
		int midx = uv.getMidx();
		pq.setMidx(midx);
		return customerService.show_check(pq);
	}
	
	// 나의 문의 내역 페이지 이동
	@RequestMapping(value="/my_qestion.do")
	public String my_qestion(Locale locale, Model model, HttpSession session,int page) throws Exception {
		
		// 로그인이 풀렸을 떄 대비해서 넣음
		if(session.getAttribute("UserVO") == null) {
			return "redirect:/Login/main.do";
		}
				
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		int midx = uv.getMidx();
		
		int questionCount = customerService.questionCount(midx);
		// 가져오는 페이지 수 5
		Criteria sc = new Criteria();
		sc.setPerPageNum(8);
		sc.setPage(page);
		
		// 페이징 하기 위해서 필요한 값들 넣음
		PageMaker pm = new PageMaker();
		pm.setScri(sc);
		pm.setMidx(midx);
		pm.setTotalCount(questionCount);
	
		model.addAttribute("pm", pm);
		model.addAttribute("list", customerService.question_list(pm));
		return "customer/my_qestion";
	}
	//나의 문의내역 상세보기
	@RequestMapping(value="/myquestion_detail.do")
	@ResponseBody
	public QuestionVO myquestion_detail(int qidx) throws Exception {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>"+customerService.myquestion_detail(qidx));
		return customerService.myquestion_detail(qidx);
	}
	//나의문의내역 삭제
	@RequestMapping(value="/myquestion_delete.do")
	@ResponseBody
	public int myquestion_delete(int qidx) throws Exception {
		
		customerService.myquestion_delete(qidx);
		return 1;
	}
	//나의 제품문의 리스트 가기
	@RequestMapping(value="/myquestion_product.do")
	public String myquestion_product(Locale locale, Model model, HttpSession session,int page) throws Exception {
		// 로그인이 풀렸을 떄 대비해서 넣음
				if(session.getAttribute("UserVO") == null) {
					return "redirect:/Login/main.do";
				}
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		int midx = uv.getMidx();
		
		int p_questionCount = customerService.product_questionCount(midx);
		
		Criteria sc = new Criteria();
		sc.setPerPageNum(8);
		sc.setPage(page);
		
		PageMaker pm = new PageMaker();
		pm.setScri(sc);
		pm.setMidx(midx);
		pm.setTotalCount(p_questionCount);
		
		model.addAttribute("pm", pm);
		model.addAttribute("list", customerService.product_question_list(pm));
		
		return "customer/my_qestion_product";
	}
	//나의 제품문의 상세보기
	@RequestMapping(value="/product_myquestion_detail.do")
	@ResponseBody
	public QuestionVO product_myquestion_detail(int pqidx) throws Exception {
		
		return customerService.product_myquestion_detail(pqidx);
	}
	//나의 제품문의 삭제
		@RequestMapping(value="/product_myquestion_delete.do")
		@ResponseBody
		public int product_myquestion_delete(int pqidx) throws Exception {
			
			customerService.product_myquestion_delete(pqidx);
			return 1;
		}
}

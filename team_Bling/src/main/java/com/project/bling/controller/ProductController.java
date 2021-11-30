package com.project.bling.controller;


import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.domain.Criteria;
import com.project.bling.domain.PageMaker;
import com.project.bling.service.CustomerService;
import com.project.bling.service.ProductService;
import com.project.bling.service.ReviewService;


@RequestMapping(value="/Product")
@Controller
public class ProductController {
	
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	CustomerService customerService;
	
	// 베스트와 new 상품
	@RequestMapping(value="/best_new.do")
	public String bestNew(Model model,String kind)throws Exception{
		model.addAttribute("kind",kind);
		return "product/best_new_list";
	}
	
	
	//헤더에서 누르고 들어갈때 맨 처음 화면
	@RequestMapping(value="sroll.do")
	public String scroll(Model model,char kind,PageMaker param)throws Exception{
		String kind1 = null;
		int orderBy = 1;
		model.addAttribute("page",1);
		param.setEnd(3);
		param.setStart(1);
		if(kind=='R') {
			kind1 = "R";
			param.setKind(kind1);
			model.addAttribute("best", productService.scrollbest(param));
			model.addAttribute("kind", kind1 );
			model.addAttribute("orderBy",orderBy);
		}else if(kind=='N'){
			kind1 = "N";
			param.setKind(kind1);
			model.addAttribute("best", productService.scrollbest(param));
			model.addAttribute("kind", kind1 );
			model.addAttribute("orderBy",orderBy);
		}else if(kind=='E'){
			kind1 = "E";
			param.setKind(kind1);
			model.addAttribute("best", productService.scrollbest(param));
			model.addAttribute("kind", kind1 );
			model.addAttribute("orderBy",orderBy);
		}else if(kind=='B'){
			kind1 = "B";
			param.setKind(kind1);
			model.addAttribute("best", productService.scrollbest(param));
			model.addAttribute("kind", kind1 );
			model.addAttribute("orderBy",orderBy);
		}
		
		return "product/list";
	}
	
	//처음화면에서 스크롤 에이작스 작동
	@RequestMapping(value="/product_scroll.do")
	@ResponseBody   
	public Map<String,Object> getList(int page, PageMaker param, int orderBy, String kind) throws Exception{
	    
		
		param.setKind(kind);
		
		int startnum = page+(8*(page-1));
		int endnum = page*9;
		int totalCnt = 0;
		
		if(kind.equals("best")){
			totalCnt = 99;
		}else if(kind.equals("new")){
			totalCnt = 18;
		}else {
			totalCnt = productService.productCount(kind); 
		}
		
		if(page==1) {
			param.setStart(1);
			param.setEnd(9); 
		}else {
			param.setStart(startnum);
			param.setEnd(endnum);
		}
		
		Map<String,Object> scroll_list = new HashMap<String, Object>();
		
		scroll_list.put("kind", kind);
		scroll_list.put("startnum",startnum);
		scroll_list.put("totalCnt",totalCnt);
		
		
		if(orderBy == 1) {
			scroll_list.put("scroll", productService.scrollnew(param));
		}else if(orderBy == 2) {
			scroll_list.put("scroll", productService.scrollbest(param));
		}else if(orderBy == 3) {
			scroll_list.put("scroll", productService.scrollhigh(param));
		}else if(orderBy == 4) {
			scroll_list.put("scroll", productService.scrollrow(param));
		}else if(orderBy == 5) {
			scroll_list.put("scroll", productService.prodBest(param));
		}else if(orderBy == 6) {
			scroll_list.put("scroll", productService.prodNew(param));
		}
		
	    return scroll_list;
	}
	
	/* 상세페이지 */
	// 상세페이지
	@RequestMapping(value="/detail.do")
	public String detail(Locale locale, Model model, int pidx) throws Exception {
		
		// 상품 정보
		model.addAttribute("detail", productService.detail(pidx));
		// 상품의 옵션 정보
		model.addAttribute("options", productService.options(pidx));
		
		// 상품의 이미지들
		model.addAttribute("image", productService.image(pidx));
		
		// 상품 리뷰의 이미지와 평점
		model.addAttribute("review", reviewService.Product_review_count(pidx));
		
		
		return "/product/detail";
			
	}
	
	
	// 리뷰 뿌려주기 에이작스
	@RequestMapping(value="/detail_review.do" )
	@ResponseBody
	public  Map<String, Object> detail_review(int pidx, int page, String type) throws Exception  {	
		
		// pidx에 대한 리뷰 갯수
		int reviewCount = reviewService.reviewCount(pidx);
		// 가져오는 페이지 수 3
		int pageNum = 3;
		Criteria sc = new Criteria();
		sc.setPerPageNum(pageNum);
		sc.setPage(page);
		
		// 페이징 하기 위해서 필요한 값들 넣음
		PageMaker pm = new PageMaker();
		pm.setScri(sc);
		pm.setPidx(pidx);
		pm.setTotalCount(reviewCount);
  
		// 페이징 된 리뷰와 페이징에 필요한 값 넣음
		Map<String, Object> review_1 = new HashMap<String, Object>();
		review_1.put("pm", pm);
		
		// 타입이 R이면 최신순을 보내고,  타입이 G면 평점순을 보내준다.
		if (type.equals("R")) {
		review_1.put("reviewProduct", reviewService.reviewProduct_1(pm));
		}else if (type.equals("G")) {
		review_1.put("reviewProduct", reviewService.reviewProduct_2(pm));	
		}
		
		return review_1;
	}
	
	// 문의하기 뿌려주기 에이작스
	@RequestMapping(value="/detail_question.do" )
	@ResponseBody
	public  Map<String, Object> detail_question(int pidx, int page) throws Exception  {	
		
	
		// pidx에 대한 문의 갯수
		int questionCount = customerService.Product_Question_Count(pidx);
		// 가져오는 페이지 수 
		int pageNum = 10;
		Criteria sc = new Criteria();
		sc.setPerPageNum(pageNum);
		sc.setPage(page);
		
		// 페이징 하기 위해서 필요한 값들 넣음
		PageMaker pm = new PageMaker();
		pm.setScri(sc);
		pm.setPidx(pidx);
		pm.setTotalCount(questionCount);

		
		// 페이징 된 리뷰와 페이징에 필요한 값 넣음
		Map<String, Object> question = new HashMap<String, Object>();
		question.put("pm", pm);
		question.put("questionProduct", customerService.Product_Question(pm));

		return question;
	}
		
	// 헤더 검색 기능
	@RequestMapping(value="/search.do" )
	public String search_Product(Locale locale, Model model, Criteria sc) throws Exception{
		
		// 페이지 메이커에 검색에 필요한 값들을 넣어 줌
		PageMaker pm = new PageMaker();
		pm.setScri(sc);
		
		model.addAttribute("list", productService.search_Product(pm));
		model.addAttribute("pm", pm);
		
		return "product/search";
	}

	
}

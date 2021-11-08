package com.project.bling.controller;


import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bling.service.ProductService;
import com.project.bling.service.ReviewService;



@RequestMapping(value="/Product")
@Controller
public class ProductController {
	
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ReviewService reviewService;
	
	/* 상품 리스트 페이지 */
	// 상품 리스트에서 신상품,판매순,높은가격순,낮은가격순 을 선택 했을 경우 여기로 이동해서
	// 반지,귀걸이,목걸이,팔찌에 아래에 있는 model을 추가해 준다.
	// 그리고 메인에서 넘어 올 때 신상품리스트로 화면에 뿌려준다.
	// 처음부터 넘어 올 때, kind값과 orderby의 값을 가지고 넘어온다.
	public Model order_by(Locale locale, Model model, int orderBy, String kind) throws Exception{
		int orderby = orderBy;
		String kind1 = kind;
		
		if(orderby==1) {
			//신상품순리스트
			model.addAttribute("viewAll", productService.newList(kind1));
		}else if(orderby==2) {
			//판매순위순
			model.addAttribute("viewAll",productService.bestList(kind1));
		}else if(orderby==3) {
			//높은가격순
			model.addAttribute("viewAll",productService.highPrice(kind1));
		}else if(orderby==4) {
			//낮은가격순
			model.addAttribute("viewAll",productService.rowPrice(kind1));
		}
		return model;
	}

	// 베스트 상품
	@RequestMapping(value="/best.do")
	public String bestList(Locale locale,Model model) throws Exception {
		
		/**제품 사진 - 판매량순**/
		model.addAttribute("list", productService.prodBest());
		String kind = "best";
		model.addAttribute("kind", kind );
		
		return "product/best_new_list";
	}
	
	// 새로운 상품
	@RequestMapping(value="/new.do")
	public String newList(Locale locale,Model model) throws Exception {
		
		/**제품 사진 - 신상품**/
		model.addAttribute("list", productService.prodNew());
		String kind = "new";
		model.addAttribute("kind", kind );
		
		return "product/best_new_list";
	}
	
	// 반지
	@RequestMapping(value="/ring.do")
	public String ringList(Locale locale,Model model,int orderBy) throws Exception {
		
		int orderby = orderBy;
		String kind = "R";
		
		// 리스트 페이지에 보이는 상품명과 판매량이 높은 상품 3개	
		model.addAttribute("kind", kind );
		model.addAttribute("best", productService.bestList(kind));
		
		// 메인에서 타고 넘어 오거나 상품 리스트 페이지에서 신상품,최신,높은가격,낮은가격순을 선택했을 경우 model이 나온다.
		order_by(locale, model, orderby, kind);
		
		return "product/list";
	}
	
	// 목걸이
	@RequestMapping(value="/necklace.do")
	public String neckList(Locale locale,Model model,int orderBy) throws Exception {
		
		int orderby = orderBy;
		String kind = "N";
		
		
		// 리스트 페이지에 보이는 상품명과 판매량이 높은 상품 3개
		model.addAttribute("kind", kind );
		model.addAttribute("best", productService.bestList(kind));
		
		// 메인에서 타고 넘어 오거나 상품 리스트 페이지에서 신상품,최신,높은가격,낮은가격순을 선택했을 경우 model이 나온다.
		order_by(locale, model, orderby, kind);
		
		return "product/list";
	}
	
	// 귀걸이
	@RequestMapping(value="/earring.do")
	public String earList(Locale locale,Model model,int orderBy) throws Exception {
		
		int orderby = orderBy;
		String kind = "E";
		
		// 리스트 페이지에 보이는 상품명과 판매량이 높은 상품 3개
		model.addAttribute("kind", kind );
		model.addAttribute("best", productService.bestList(kind));
		
		// 메인에서 타고 넘어 오거나 상품 리스트 페이지에서 신상품,최신,높은가격,낮은가격순을 선택했을 경우 model이 나온다.
		order_by(locale, model, orderby, kind);
		
		return "product/list";
	}
	
	// 팔찌
	@RequestMapping(value="/braclet.do")
	public String bracList(Locale locale,Model model,int orderBy) throws Exception {
		
		int orderby = orderBy;
		String kind = "B";

		model.addAttribute("kind", kind );
		model.addAttribute("best", productService.bestList(kind));

		// 메인에서 타고 넘어 오거나 상품 리스트 페이지에서 신상품,최신,높은가격,낮은가격순을 선택했을 경우 model이 나온다.
		order_by(locale, model, orderby, kind);
		
		return "product/list";
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

}
package com.project.bling.controller;
/* 전부 주석 처리함 
 
package bling.com.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bling.com.service.ProductService;
import bling.com.vo.JoinVO;
import bling.com.vo.PagingVO;


@RequestMapping(value="/Product")
@Controller
public class ProductController_주희 {
	
	@Autowired
	ProductService productService;
	
	//옵션 선택시 나오는 리스트 메소드
	public Model order_by(Model model,int orderby,String kind) throws Exception{
		int orderBy = orderby;
		String kind1 = kind;
		
		if(orderBy==1) {
			//신상품순리스트
			model.addAttribute("viewAll", productService.selectList(kind1));
		}else if(orderBy==2) {
			//판매순위순
			model.addAttribute("viewAll",productService.bestList(kind1));
		}else if(orderBy==3) {
			//높은가격순
			model.addAttribute("viewAll",productService.highPrice(kind1));
		}else if(orderBy==4) {
			//낮은가격순
			model.addAttribute("viewAll",productService.rowPrice(kind1));
		}
		return model;
	}
	
	//반지 리스트
	@RequestMapping(value="/ring.do")
	public String list_ring(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)int nowPage
			, @RequestParam(value="cntPerPage", required=false)int cntPerPage
			, int orderby)throws Exception {
		
		int orderBy = orderby;
		String kind1 ="R";
		//페이징
		int total = productService.countList(kind1);
		vo = new PagingVO(total, nowPage, cntPerPage);
		model.addAttribute("paging", vo);
		//종류
		model.addAttribute("kind",kind1);
		//베스트3개
		model.addAttribute("bestList",productService.bestList(kind1));
		//옵션 선택시 나오는 리스트
		order_by(model, orderBy, kind1);
		
		return "product/list";
	}
	
	//목걸이 리스트
	@RequestMapping(value="/necklace.do")
	public String list_necklace(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)int nowPage
			, @RequestParam(value="cntPerPage", required=false)int cntPerPage
			, int orderby)throws Exception {
		
		int orderBy = orderby;
		String kind1 ="N";
		//페이징
		int total = productService.countList(kind1);
		vo = new PagingVO(total, nowPage, cntPerPage);
		model.addAttribute("paging", vo);
		//종류
		model.addAttribute("kind",kind1);
		//베스트3개
		model.addAttribute("bestList",productService.bestList(kind1));
		
		//옵션 선택시 나오는 리스트
		order_by(model, orderBy, kind1);
		
		return "product/list";
	}
	
	//귀걸이 리스트
	@RequestMapping(value="/earring.do")
	public String list_earring(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)int nowPage
			, @RequestParam(value="cntPerPage", required=false)int cntPerPage
			, int orderby) throws Exception {
		
		int orderBy = orderby;
		String kind1 ="E";
		//페이징
		int total = productService.countList(kind1);
		vo = new PagingVO(total, nowPage, cntPerPage);
		model.addAttribute("paging", vo);
		//종류
		model.addAttribute("kind",kind1);
		//베스트3개
		model.addAttribute("bestList",productService.bestList(kind1));
		
		//옵션 선택시 나오는 리스트
		order_by(model, orderBy, kind1);
		
		return "product/list";
	}
	
	//팔찌 리스트
	@RequestMapping(value="/braclet.do")
	public String list_braclet(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)int nowPage
			, @RequestParam(value="cntPerPage", required=false)int cntPerPage
			, int orderby) throws Exception {
		
		int orderBy = orderby;
		String kind1 ="B";
		//페이징
		int total = productService.countList(kind1);
		vo = new PagingVO(total, nowPage, cntPerPage);
		model.addAttribute("paging", vo);
		//종류
		model.addAttribute("kind",kind1);
		//베스트3개
		model.addAttribute("bestList",productService.bestList(kind1));

		//옵션 선택시 나오는 리스트
		order_by(model, orderBy, kind1);
		
		return "product/list";
	}
	
	//리뷰 총합 나오는 메소드
	@RequestMapping(value="review.do")
	@ResponseBody
	public JoinVO review(Locale locale,Model model
			,@RequestParam(value="pidx",required=false)int pidx)throws Exception{
		System.out.println(">>>>>>>>>>>>>>"+pidx);
		return productService.countReview(pidx);
	}
	
	//best 리스트
	@RequestMapping(value="/bestlist.do")
	public String bestlist(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)int nowPage
			, @RequestParam(value="cntPerPage", required=false)int cntPerPage) throws Exception {
		
		//페이징
		int total = productService.countListTop();
		String kind = "B";
		model.addAttribute("kind",kind);
		vo = new PagingVO(total, nowPage, cntPerPage);
		model.addAttribute("paging", vo);

		model.addAttribute("viewAll", productService.bestListTop());
		
		
		return "product/best_new_list";
	}
	
	//new 리스트
	@RequestMapping(value="/newlist.do")
	public String newlist(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)int nowPage
			, @RequestParam(value="cntPerPage", required=false)int cntPerPage) throws Exception {
		
		//페이징
		int total = productService.countListTop();
		String kind = "N";
		model.addAttribute("kind",kind);
		vo = new PagingVO(total, nowPage, cntPerPage);
		model.addAttribute("paging", vo);

		model.addAttribute("viewAll", productService.newList());
		
		
		return "product/best_new_list";
	}
}


*/
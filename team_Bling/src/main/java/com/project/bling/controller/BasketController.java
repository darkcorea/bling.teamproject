package com.project.bling.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.service.BasketService;
import com.project.bling.vo.CartVO;
import com.project.bling.vo.LikeVO;
import com.project.bling.vo.OrderVO;
import com.project.bling.vo.UserVO;

@RequestMapping(value="/Basket")
@Controller
public class BasketController {

	@Autowired
	BasketService basketService;
	
	@RequestMapping(value="/cart.do")
	public String cart(Locale locale, Model model) {
		return "basket/cart";
	}
	
	@RequestMapping(value="/cartlist.do")
	@ResponseBody
	public List <CartVO> cartlist(int midx) throws Exception {
		
		List <CartVO> vo = basketService.cartlist(midx);
		
		return vo;
	}
	@RequestMapping(value="/cartupdate.do")
	@ResponseBody
	public int cart_update(CartVO vo) throws Exception {
		
		return basketService.cart_update(vo);
	}
	@RequestMapping(value="/cartdelete.do")
	@ResponseBody
	public int cart_delete(int cart_idx) throws Exception{
		System.out.println("cart_idx>>>>>>>>>>"+cart_idx);
		basketService.cart_delete(cart_idx);
		return 1;
	}
	
	
	
	@RequestMapping(value="/cartinsert.do",method = RequestMethod.POST, produces = "application/test;charset=utf8")
	@ResponseBody
	public String orderinsert(Model model,OrderVO vo) throws Exception {
		
		
		String abc = null;
		System.out.println("midx>>>>>>>>"+vo.getMidx());
		int count = basketService.cartdouble_check(vo);
		System.out.println("count>>>>>>>>>"+count);
		String oname = vo.getOname();
		System.out.println(oname);
		if(count == 0) {
			basketService.cartinsert(vo);
			abc = "save";
		}else {
			abc = oname;
		}
		return abc;
	}
	
	//관심상품 존재여부확인
	@RequestMapping(value="/checklike.do")
	@ResponseBody
	public Integer checklike(LikeVO lvo,HttpSession session, int pidx) {
		
		Integer yn = 0;
		
		if(session.getAttribute("UserVO") == null ) {
			yn = 0;
		}else {
			UserVO vo = (UserVO)session.getAttribute("UserVO");
			int midx = vo.getMidx();
			lvo.setMidx(midx);
			lvo.setPidx(pidx);
			
			yn = basketService.likeyn(lvo);
		}
		
		return yn;
	}
	
	
	//관심상품 등록 및 삭제
	@RequestMapping(value="/like.do")
	@ResponseBody
	public void like(LikeVO lvo, HttpSession session, int yn, int pidx) { 
		
		int likeyn = yn; 
		UserVO vo = (UserVO)session.getAttribute("UserVO");
		int midx = vo.getMidx();
		
		lvo.setMidx(midx);
		lvo.setPidx(pidx);
		
		if(likeyn == 0) {
			//관심상품 삭제
			basketService.likeDelete(lvo);
		}else {
			//관심상품 등록
			basketService.likeInsert(lvo);
		}
	}
	
	//관심상풍 페이지로 이동
	@RequestMapping(value="/like1.do")
	public String like(Locale locale, Model model) { 
		return "basket/like";
	}
	
	
}

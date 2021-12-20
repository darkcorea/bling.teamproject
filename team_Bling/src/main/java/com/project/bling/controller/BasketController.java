package com.project.bling.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.service.BasketService;
import com.project.bling.vo.CartVO;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.LikeVO;
import com.project.bling.vo.OrderVO;
import com.project.bling.vo.UserVO;

@RequestMapping(value="/Basket")
@Controller
public class BasketController {

	@Autowired
	BasketService basketService;
	
	@RequestMapping(value="/cart.do")
	public String cart(Locale locale, Model model, HttpSession session) {
		// 로그인이 풀렸을 떄 대비해서 넣음
		if ( session.getAttribute("UserVO") == null) {return "redirect:/Login/main.do";}
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
	

	@RequestMapping(value="/order_after_del.do")
	@ResponseBody
	public int order_after_del(CartVO vo) throws Exception{
		System.out.println("oidx>>>>>>>>>>"+vo.getOidx());
		basketService.order_after_del(vo);
		return 1;
	}
	
	@RequestMapping(value="/cartinsert.do",method = RequestMethod.POST, produces = "application/test;charset=utf8")
	@ResponseBody
	public String orderinsert(Model model,OrderVO vo) throws Exception {
		
		
		String abc = null;
		int count = basketService.cartdouble_check(vo);
		String oname = vo.getOname().trim();
		if(count == 0) {
			basketService.cartinsert(vo);
			abc = "save";
		}else {
			abc = oname;
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>"+abc);
		}
		return abc;
	}
	
	@RequestMapping(value="/check_delete.do",  method = RequestMethod.POST)
	@ResponseBody
	public int cartcheck_del(	@RequestParam("list[]") List<Integer> list) throws Exception { 
		basketService.cartcheck_del(list);
		return 1;
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
	public String like(Locale locale, Model model, HttpSession session, String kind) throws Exception{
		// 로그인이 풀렸을 떄 대비해서 넣음
		if ( session.getAttribute("UserVO") == null) {return "redirect:/Login/main.do";}
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		
		int midx = uv.getMidx();
		CombineVO cv = new CombineVO();
		cv.setMidx(midx);
		cv.setKind(kind);
		
		model.addAttribute("list", basketService.like_list(cv));
		model.addAttribute("kind", kind);
		
		return "basket/like";
	}
	
	//관심상품  삭제
	@RequestMapping(value="/like_del.do",  method = RequestMethod.POST)
	@ResponseBody
	public int like_del(LikeVO lvo) throws Exception { 
		//관심상품 삭제
		basketService.likeDel(lvo);
		return 1;
	}
	
	//관심상품  한 번에 여러개 삭제
	@RequestMapping(value="/like_del_ch.do",  method = RequestMethod.POST)
	@ResponseBody
	public int like_del_ch(	@RequestParam("list[]") List<Integer> list) throws Exception { 
		basketService.like_del_ch(list);
		return 1;
	}
	
	
	// midx가 선택한 관심상품 들
	@RequestMapping(value="/checklike1.do")
	@ResponseBody
	public List<LikeVO> checklike1(HttpSession session) throws Exception { 
		UserVO vo = (UserVO)session.getAttribute("UserVO");
		int midx = vo.getMidx();
		return basketService.checklike1(midx);
	}
	
	
}

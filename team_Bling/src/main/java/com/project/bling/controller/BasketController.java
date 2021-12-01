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
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.LikeVO;
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
		UserVO vo = (UserVO)session.getAttribute("UserVO");
		int midx = vo.getMidx();
		
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
}

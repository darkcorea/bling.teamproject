package com.project.bling.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.domain.Criteria;
import com.project.bling.domain.PageMaker;
import com.project.bling.service.DeliveryService;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.NonorderVO;
import com.project.bling.vo.QuestionVO;
import com.project.bling.vo.UserVO;

@RequestMapping(value="/Delivery")
@Controller
public class DeliveryController {

	@Autowired
	DeliveryService deliveryService;
	
	// 마이페이지 주문내역 조회  메인 페이지
	@RequestMapping(value="/main.do")
	public String delivery(Locale locale, Model model, HttpSession session, Criteria cs) throws Exception {
		
		// 로그인이 풀렸을 떄 대비해서 넣음
		if ( session.getAttribute("UserVO") == null) {return "redirect:/Login/main.do";}
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		int midx = uv.getMidx();
		
		cs.setPerPageNum(10);
		
		PageMaker pm = new PageMaker();
		pm.setMidx(midx);
		pm.setScri(cs);
		
		//midx와 pm에 따른 오더 총 갯수
		int setTotalCount = deliveryService.delivery_count(pm);
		pm.setTotalCount(setTotalCount);

		model.addAttribute("pm",pm);
		model.addAttribute("list", deliveryService.deivery_list(pm));
		return "delivery/main";
	}
	
	
	// order_idx로 구매확정 하고 addmilege가 있으면 milege에 추가
	@RequestMapping(value="/confirm_fn.do")
	@ResponseBody
	public int confirm_fn(int order_idx, HttpSession session) throws Exception {
		
		// 회원정보 불러오기, 회원정보 담을 VO물러오기
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		CombineVO cv = new CombineVO();
		
		// 구매확정하기
		deliveryService.confirm_fn(order_idx);
		
		// 적립금 불러오기
		int ad_mile = deliveryService.addmileage_check(order_idx);
		
		// aaddmileage가 0 이 아니라면 
		if (ad_mile != 0) {
			
			// 유저 마일리지에 적립금 추가
			cv.setMileage(ad_mile);
			cv.setMidx(uv.getMidx());
			deliveryService.addmileage_user(cv);
			
			// 로그인 세션에 마일리지 추가
			uv.setMileage(uv.getMileage()+ad_mile);
			
			// order_idx로 적립금 0원으로 만들기
			deliveryService.addmileage_zero(order_idx);
			
			return ad_mile;
		}
		return 0;
	}

	// order_idx로 구매한 상품 정보 불러와서 뿌려 주기
	@RequestMapping(value="/order_list.do")
	@ResponseBody
	public List<CombineVO> order_list(int order_idx) throws Exception {
		return deliveryService.order_list(order_idx);
	}
	
	
	// 상품에 대한 구매,취소,반품 등록
	@RequestMapping(value="/return_delivery.do")
	@ResponseBody
	public int return_delivery(QuestionVO qv, HttpSession session) throws Exception {
		
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		// 회원 midx에 대한 값 넣기
		qv.setMidx(uv.getMidx());
		
		// 배송 정보에 대한 정보 변경
		CombineVO cv = new CombineVO();
		cv.setOrder_idx(qv.getOrder_idx());
		
		// 제품에 대한 교환,환불,취소 문의등록, 배송 정보 변경
		if(qv.getCategory().equals("D")) {
			qv.setTitle("교환 신청 합니디");
			cv.setKind("D");
		}
		if(qv.getCategory().equals("E")) {
			qv.setTitle("환불 신청 합니디");
			cv.setKind("E");
		}
		if(qv.getCategory().equals("F")) {
			qv.setTitle("취소 신청 합니디"); 
			cv.setKind("F");
		}
		
		// 제품에 대한 교환,환불,취소 문의에 등록
		deliveryService.return_delivery_question(qv);
		// 배송 정보에 대한 정보 변경
		deliveryService.return_delivery(cv);
		
		return 1;
	}
	
	// 마이페이지 주문내역 중에 취소반푼교환내역
	@RequestMapping(value="/main1.do")
	public String delivery1(Locale locale, Model model, HttpSession session, Criteria cs) throws Exception {
		
		// 로그인이 풀렸을 떄 대비해서 넣음
		if ( session.getAttribute("UserVO") == null) {return "redirect:/Login/main.do";}
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		int midx = uv.getMidx();
		
		cs.setPerPageNum(10);
		
		PageMaker pm = new PageMaker();
		pm.setMidx(midx);
		pm.setScri(cs);
		
		//midx와 pm에 따른 오더 총 갯수
		int setTotalCount = deliveryService.re_delivery_count(pm);
		pm.setTotalCount(setTotalCount);

		model.addAttribute("pm",pm);
		model.addAttribute("list", deliveryService.re_deivery_list(pm));
		return "delivery/main1";
	}
	
	// 비회원 주문조회
	@RequestMapping(value="/nonDelivery.do")
	public String nonDelivey(Locale locale, Model model) throws Exception {	
		return "delivery/nonDelivery";
	}
		
	// 이름과 주문번호로 비회원 주문이 있는지 조회
	@RequestMapping(value="/nonDel_check.do")
	@ResponseBody
	public String nonDel_check(NonorderVO nv) throws Exception {
		return deliveryService.nonDel_check(nv);	
	}
	
	// 비회원 주문조회 디테일 페이지
	@RequestMapping(value="/non_main.do")
	public String non_main(Locale locale, Model model,NonorderVO nv) throws Exception {
		model.addAttribute("list", deliveryService.nonDel_list(nv.getOrderid()));
		return "delivery/non_main";
	}
	
}

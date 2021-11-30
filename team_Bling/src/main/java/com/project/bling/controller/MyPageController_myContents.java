package com.project.bling.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bling.service.MyPage_myReviewService;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.UserVO;


@RequestMapping(value="/MyPageR")
@Controller
public class MyPageController_myContents {

	@Autowired
	MyPage_myReviewService myPage_myReviewService;
	
	@Autowired
    String uploadPath;
	
	
	@RequestMapping(value="/myReview.do")
	public String reviewList(Model model, CombineVO vo, HttpSession session) throws Exception {
		
		String pattern = "yyyy/MM/dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

		String date = simpleDateFormat.format(new Date());
		System.out.println("마이페이지 컨트롤러2-오늘날짜 : "+date);
		
		vo.setRdate1("2021/07/01");
		vo.setRdate2(date);
		
		
		//session의 midx를 CombineVO에 저장
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		int midx = uv.getMidx();
		vo.setMidx(midx);
		
		
		
		model.addAttribute("reviewList", myPage_myReviewService.reviewList(vo));
		System.out.println("마이페이지 컨트롤러-DB>리뷰리스트(index 1)-main 사진 : "+myPage_myReviewService.reviewList(vo).get(1).getMain());
		System.out.println("마이페이지 컨트롤러-DB>리뷰리스트(index 0)-image1 사진 : "+myPage_myReviewService.reviewList(vo).get(0).getImage1());
		
		return "myPage/myReview";
	}
	
	
	
	
}

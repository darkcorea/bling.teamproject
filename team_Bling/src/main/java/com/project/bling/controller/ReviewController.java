package com.project.bling.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bling.domain.Criteria;
import com.project.bling.domain.PageMaker;
import com.project.bling.service.ReviewService;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.UserVO;




@RequestMapping(value="/Review")
@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	@Autowired
    String uploadPath;
	
	
	
	@RequestMapping(value="/main.do")
	public String main(Locale locale, Model model) {
		return "review/main";
	}
	
	
	@RequestMapping(value="/list.do")
	public String list(Locale locale, Model model, Criteria sc ) throws Exception {
		
		/* 
		- 매퍼에서 if절 사용할 예정, 또는 VO에 추가 할 수도 있음
		String searchType = sc.getSearchType();
		if (searchType == null) searchType="subject";
		String keyword = sc.getKeyword();
		if (keyword == null) keyword=""; */
		
		// 총 리뷰 갯수 가져오기 pix3에 해당하는 리뷰만가져옴
		int pidx = 3;
		int reviewCount = reviewService.reviewCount(pidx);

		// 자동으로 페이징 계산해주는 VO에 필요한 값 넣기, 디폴트 값으로 한페이지당 9개의 리뷰와 10개의 페이지를 보여주게 설정되어 있음
		// sc로 넘어오는건 page정보 나머지는 여기서 입력해줘야함.
		// 나머지 정보는 여기서 입력 하는게 좋음 안 그러면 페이지 갯수와 보여줄 리뷰 갯수를 변경할 수 있는데 그러면 기존에 있던 CSS가 깨짐
		
		
		// 가져오는 페이지수 변경 가능한지 확인 -> 변경 가능
		int pageNum = 10;
		sc.setPerPageNum(pageNum);
		
		// 페이징 하기 위해서 필요한 값들 넣음
		PageMaker pm = new PageMaker();
		pm.setPidx(pidx);
		pm.setScri(sc);
		pm.setTotalCount(reviewCount);
		
		
		/*
		 * System.out.println("페이지 번호>>>>"+sc.getPage());
		 * System.out.println("StartPage>>>>>>>>>>>"+pm.getStartPage());
		 * System.out.println("EndPage>>>>>>>>>>>>>>"+pm.getEndPage());
		 * System.out.println("시작하는 페이지 번호>>>>>>>>>>"+pm.getStartPost());
		 * System.out.println("마지막 페이지 번호>>>>>>>>>>"+pm.getLastPost());
		 */
		 
		 
		// 페이징 된 리뷰들 
		model.addAttribute("page", reviewService.reviewProduct_1(pm));
		// 페이징에 필요한 값과 게시판 아래 숫자 나오는것에 필요함
		model.addAttribute("pm", pm);
		
		return "review/list";
	}
	
	
	/* ---------------------------myPage reviewList--------------------------- */
	@RequestMapping(value="/myReview.do")
	public String reviewList(Model model, CombineVO vo, HttpSession session) throws Exception {
		
		//session의 midx를 CombineVO에 저장
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		int midx = uv.getMidx();
		vo.setMidx(midx);
		
		CombineVO vo2 = new CombineVO();
		
		/* LocalDate now = LocalDate.now(); */
		
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

		//오늘 날짜
		String today = simpleDateFormat.format(new Date());
		//현재시간
		Calendar cal = Calendar.getInstance();
		
		//System.out.println("마이페이지 컨트롤러2- kind 값 : "+vo.getKind());
		
		if("A".equals(vo.getKind())) {
			System.out.println("A실행");
			System.out.println("마이페이지 컨트롤러2- 오늘 : "+today);
			vo2.setRdate1(today);
			vo2.setRdate2(today);
		}else if("B".equals(vo.getKind())) {
			System.out.println("B실행");
			//한달 전
			cal.roll(Calendar.MONTH , -1);
		    String beforeMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
		    System.out.println("마이페이지 컨트롤러2- 1달 전 : "+beforeMonth);
			vo2.setRdate1(beforeMonth);
			vo2.setRdate2(today);
		}else if("C".equals(vo.getKind())) {
			System.out.println("C실행");
			//3달 전
		    cal.roll(Calendar.MONTH , -3);
		    String before3Month = new java.text.SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
		    System.out.println("마이페이지 컨트롤러2- 3달 전 : "+before3Month);
			vo2.setRdate1(before3Month);
			vo2.setRdate2(today);
		}else if("D".equals(vo.getKind())) {
			System.out.println("D실행");
			//6달 전
		    cal.roll(Calendar.MONTH , -6);
		    String before6Month = new java.text.SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
		    System.out.println("마이페이지 컨트롤러2- 6달 전 : "+before6Month);
			vo2.setRdate1(before6Month);
			vo2.setRdate2(today);
		}else if("E".equals(vo.getKind())) {
			System.out.println("E실행");
			//1년 전
		    cal.roll(Calendar.YEAR , -1);
		    String before1Year = new java.text.SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
		    System.out.println("마이페이지 컨트롤러2- 1년 전 : "+before1Year);
			vo2.setRdate1(before1Year);
			vo2.setRdate2(today);
		}else if("F".equals(vo.getKind())) {
			System.out.println("F실행");
			//3년 전
		    cal.roll(Calendar.YEAR , -3);
		    String before3Year = new java.text.SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
		    System.out.println("마이페이지 컨트롤러2- 3년 전 : "+before3Year);
			vo2.setRdate1(before3Year);
			vo2.setRdate2(today);
		}else if("G".equals(vo.getKind())) {
			System.out.println("F실행");
			//3년 전
			vo2.setRdate1(vo.getRdate1());
			vo2.setRdate2(vo.getRdate2());
		}
		
		model.addAttribute("reviewList", reviewService.reviewList(vo));
		//System.out.println("마이페이지 컨트롤러-DB>리뷰리스트 : "+myPage_myReviewService.reviewList(vo));
		//System.out.println("마이페이지 컨트롤러-DB>리뷰리스트>index 0 : "+myPage_myReviewService.reviewList(vo).get(0));
		//System.out.println("마이페이지 컨트롤러-DB>리뷰리스트(index 1)-main 사진 : "+myPage_myReviewService.reviewList(vo).get(1).getMain());
		//System.out.println("마이페이지 컨트롤러-DB>리뷰리스트(index 0)-image1 사진 : "+myPage_myReviewService.reviewList(vo).get(0).getImage1());
		
		//새로 vo2에 넣지 않고 위의 vo(=CombineVO)에 데이터를 넣으면 리턴값이 List이기 때문에 원하는 값을 화면에 출력할 수 없다.
		//따라서 새로 vo2를 만들어서 List<CombineVO>가 아닌 그냥 CombineVO의 필드값으로 저장해야 원하는 값을 화면에 출력할 수 있다.
		model.addAttribute("date", vo2);
		
		return "myPage/myReview";
	}
	
	
}

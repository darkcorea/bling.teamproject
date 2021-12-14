package com.project.bling.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
    String uploadPath = "D:\\bling\\bling.teamproject\\team_Bling\\src\\main\\webapp\\resources\\review_img";
	
	
	
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
		
		 
		// 페이징 된 리뷰들 
		model.addAttribute("page", reviewService.reviewProduct_1(pm));
		// 페이징에 필요한 값과 게시판 아래 숫자 나오는것에 필요함
		model.addAttribute("pm", pm);
		
		return "review/list";
	}
	
	
	/* ---------------------------myPage reviewList--------------------------- */
	@RequestMapping(value="/myReview.do")
	public String reviewList(HttpSession session) throws Exception {
		if(session.getAttribute("UserVO") == null) {
			return "redirect:/Login/main.do";
		}
		return "myPage/myReview";
	}
	
	@RequestMapping(value="/reviewlist.do")
	@ResponseBody
	public Map<String, Object> reviewlist(CombineVO vo, int page, HttpSession session,String type,String date1,String date2) throws Exception {
		
		// 로그인이 풀렸을 떄 대비해서 넣음
				
			
			//session의 midx를 CombineVO에 저장
			UserVO uv = (UserVO)session.getAttribute("UserVO");
			int midx = uv.getMidx();
			vo.setMidx(midx);
			
			// midx에 대한 리뷰 개수
			int reviewCount = reviewService.reviewCnt(midx);
			// 가져오는 페이지 수 5
			Criteria sc = new Criteria();
			sc.setPerPageNum(5);
			sc.setPage(page);
			
			// 페이징 하기 위해서 필요한 값들 넣음
			PageMaker pm = new PageMaker();
			pm.setScri(sc);
			pm.setMidx(midx);	//PageMaker 필드 수정 안 하려고 pidx필드에 그냥 midx setter주입
			pm.setTotalCount(reviewCount);
			pm.setType(type);
			pm.setKind(type);
			sc.setRdate1(date1);
			sc.setRdate2(date2);
			
			Map<String, Object> review_list = new HashMap<String, Object>();
			
			review_list.put("reviewList", reviewService.reviewPaging(pm));
			review_list.put("pm", pm);
			review_list.put("page",page);
			
			System.out.println(">>>>page : "+page);
			System.out.println(">>>>pagenum : "+sc.getPerPageNum());
			System.out.println(">>>>+pm.startPost : "+pm.getStartPost());
			System.out.println(">>>>+pm.lastPost : "+pm.getLastPost());
			
			return review_list;
	}
	
	@ResponseBody
	@RequestMapping(value="/type.do")
	public Map<String,Object> type(CombineVO vo, PageMaker pm, HttpSession session,String type,String date1,String date2) throws Exception {
		
		CombineVO vo2 = new CombineVO();
		vo.setKind(type);
		/* LocalDate now = LocalDate.now(); */
		
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

		
		//오늘 날짜
		String today = simpleDateFormat.format(new Date());
		//현재시간
		Calendar cal = Calendar.getInstance();
		
		Criteria cri = new Criteria();
		
		System.out.println("마이페이지 컨트롤러2- kind 값 : "+vo.getKind());
		
		
		System.out.println("date1 : "+date1);
		System.out.println("date2 : "+date2);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
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
			
			cri.setRdate1(date1);
			cri.setRdate2(date2);
			
			
		}
		
		//새로 vo2에 넣지 않고 위의 vo(=CombineVO)에 데이터를 넣으면 리턴값이 List이기 때문에 원하는 값을 화면에 출력할 수 없다.
		//따라서 새로 vo2를 만들어서 List<CombineVO>가 아닌 그냥 CombineVO의 필드값으로 저장해야 원하는 값을 화면에 출력할 수 있다.
		
		if("G".equals(vo.getKind())) {
			map.put("date1", cri.getRdate1() );
			map.put("date2", cri.getRdate2());
		}else {
			map.put("date1", vo2.getRdate1() );
			map.put("date2", vo2.getRdate2());
		}
		
		
		System.out.println("cri.getRdate1() : "+cri.getRdate1());
		
		return map;
		
	}
	
}

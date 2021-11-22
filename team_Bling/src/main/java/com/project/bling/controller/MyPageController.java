package com.project.bling.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.bling.reviewImage.UploadFileUtils;
import com.project.bling.service.MyPageService;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.UserVO;

@RequestMapping(value="/MyPage")
@Controller
public class MyPageController {

	@Autowired
	MyPageService myPageService;
	
    @Autowired
    String uploadPath;
	
	//MyPage 메인페이지 -> 실행시 바로 화면에 최근 주문 정보 출력
	@RequestMapping(value="/main.do")
	public String main(Locale locale, Model model, CombineVO vo, HttpSession session) throws Exception {
		
		//로그인시 세션에 저장된 회원정보 불러오기
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		//회원정보에서 회원번호만 선택
		int midx = uv.getMidx();
		//선택한 회원번호를 CombineVO 객체의 midx 필드에 저장
		vo.setMidx(midx);
		
		//회원번호(midx)에 따른 결제완료 건수
		//아직 미사용
		myPageService.orderComp(vo);
		
		//회원번호(midx)에 따른 배송상태(n:결제미완료,y:결제완료,a:상품준비중,b:배송중,c:배송완료)
		String stat = "Y";
		vo.setDeli_stat(stat);
		model.addAttribute("statY", myPageService.deliveryStat(vo));
		
		stat = "A";
		vo.setDeli_stat(stat);
		model.addAttribute("statA", myPageService.deliveryStat(vo));
		
		stat = "B";
		vo.setDeli_stat(stat);
		model.addAttribute("statB", myPageService.deliveryStat(vo));
		
		stat = "C";
		vo.setDeli_stat(stat);
		model.addAttribute("statC", myPageService.deliveryStat(vo));
		
		
		
		//최근 주문 정보(product,option,order,order_detail,delivery 5개 테이블 join)
		model.addAttribute("recentOrder", myPageService.recentOrder(vo));
				
		
		return "myPage/main";
	}
	
	//리뷰작성 버튼 클릭하면 해당 주문정보에서 detail_idx 데이터 받아오기
	@ResponseBody
	@RequestMapping(value="/detailIdx.do")
	public void detailIdx(CombineVO vo, HttpSession session) throws Exception {
		System.out.println("마이페이지 컨트롤러>>>>>detail_idx : "+vo.getDetail_idx());
		//CombineVO로 받아온 detail_idx를 아래의 reviewWrite 메소드에서 사용하기 위해 session에 담는다.
		session.setAttribute("detailIdx", vo.getDetail_idx());
	}
	
	// 업로드 흐름 : 업로드 버튼클릭 => 임시디렉토리에 업로드=> 지정된 디렉토리에 저장 => 파일정보가 file에 저장
	/*
	 * @RequestMapping(value="/upload.do") public void upload(CombineVO vo,
	 * MultipartFile file) throws Exception {
	 * System.out.println("마이페이지 컨트롤러>>>>>image1 : "+vo.getImage1());
	 * System.out.println("마이페이지 컨트롤러>>>>>image2 : "+vo.getImage2());
	 * 
	 * String savedName = file.getOriginalFilename();
	 * 
	 * File target = new File(uploadPath, savedName);
	 * 
	 * // 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사 // FileCopyUtils.copy(바이트배열, 파일객체)
	 * FileCopyUtils.copy(file.getBytes(), target); }
	 */
		
	
	// produces="text/plain;charset=utf-8" : 파일 한글처리
    @ResponseBody
    @RequestMapping(value="/upload.do", method=RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
    	System.out.println("마이페이지 컨트롤러>>>>>파일 업로드 실행됨");
        return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
    }
	
	
	//리뷰작성 모달창에서 ajax로 데이터 받아와서 DB에 review 저장하기
	@ResponseBody
	@RequestMapping(value="/reviewWrite.do")
	public void reviewWrite(CombineVO vo, HttpSession session) throws Exception {
		System.out.println("마이페이지 컨트롤러>>>>>리뷰작성 실행됨");
		System.out.println("마이페이지 컨트롤러>>>>>contents : "+vo.getContents());
		System.out.println("마이페이지 컨트롤러>>>>>grade : "+vo.getGrade());
		//System.out.println("마이페이지 컨트롤러>>>>>detail_idx : "+vo.getDetail_idx());
		//System.out.println("마이페이지 컨트롤러>>>>>image1 : "+vo.getImage1());
		//System.out.println("마이페이지 컨트롤러>>>>>image2 : "+vo.getImage2());
		
		
		//위의 detailIdx 메소드에서 session에 저장한 detail_idx를 불러와서 CombineVo에 저장한다.
		int detail_idx = (Integer)session.getAttribute("detailIdx");
		vo.setDetail_idx(detail_idx);
		
		//로그인시 세션에 저장된 회원정보 불러오기
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		//회원정보에서 회원번호만 선택
		int midx = uv.getMidx();
		//선택한 회원번호를 CombineVO 객체의 midx 필드에 저장
		vo.setMidx(midx);
		
		//최근 주문 정보를 가져오는 쿼리에 detail_idx가 포함되어 있으므로 이를 다른 값들과 같이 CombineVO에 다시 저장한다.
		//List<CombineVO> vo2 = (List<CombineVO>)myPageService.recentOrder(vo);
		//List에 담겨있어서 빼내기 실패...
		
		
		myPageService.reviewWrite(vo);
	}
	
	
}

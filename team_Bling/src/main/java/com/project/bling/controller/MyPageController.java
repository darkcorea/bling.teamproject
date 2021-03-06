package com.project.bling.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Base64;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.Base64.Decoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.bling.domain.Criteria;
import com.project.bling.domain.PageMaker;
import com.project.bling.service.JoinService;
import com.project.bling.service.LoginService;
import com.project.bling.service.MyPageService;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.UserVO;

@RequestMapping(value="/MyPage")
@Controller
public class MyPageController {

	@Autowired
	MyPageService myPageService;
	
	@Autowired
	JoinService joinService;
	
	@Autowired
	LoginService  loginService;
	
	// 학원
	//String uploadPath = "C:\\bling\\bling.teamproject\\team_Bling\\src\\main\\webapp\\resources\\review_img";
	
	// 서버 올리는 용
	String uploadPath = "C:\\tomcat\\webapps\\team_Bling\\resources\\review_img";
    
	
	// 폴더 생성
	public void makeDir() {

        File makeFolder = new File(uploadPath);
        // folderPath의 디렉토리가 존재하지 않을경우 디렉토리 생성.
        if(!makeFolder.exists()) {
            // 폴더를 생성합니다.
            makeFolder.mkdirs(); 
            System.out.println("폴더를 생성합니다.");
            // 정성적으로 폴더 생성시 true를 반환합니다.
            System.out.println("폴더가 존재하는지 체크 true/false : "+makeFolder.exists());  
        } else {
            System.out.println("이미 해당 폴더가 존재합니다.");
        }
    }
	
	//MyPage 메인페이지 -> 실행시 바로 화면에 최근 주문 정보 출력
	@RequestMapping(value="/main.do")
	public String main(Model model, CombineVO vo, HttpSession session, int page) throws Exception {
		
		// 로그인이 풀렸을 떄 대비해서 넣음
		if(session.getAttribute("UserVO") == null) {
			return "redirect:/Login/main.do";
		}
		//로그인시 세션에 저장된 회원정보 불러오기
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		//회원정보에서 회원번호만 선택
		int midx = uv.getMidx();
		//선택한 회원번호를 CombineVO 객체의 midx 필드에 저장
		vo.setMidx(midx);
		
		
		//회원번호(midx)에 따른 배송상태(n:결제미완료,y:결제완료,a:상품준비중,b:배송중,c:배송완료)
		String stat = "N";
		vo.setDeli_stat(stat);
		model.addAttribute("statN", myPageService.deliveryStat(vo));
		
		stat = "Y";
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
		
		
		//최근 주문 정보(product,option,order,order_detail,delivery,review 6개 테이블 join)
		Criteria sc = new Criteria();
		sc.setPage(page);
		sc.setPerPageNum(20);

		PageMaker pm = new PageMaker();
		pm.setScri(sc);
		pm.setMidx(midx);
		int orderCount = myPageService.orderCount(midx);

		pm.setTotalCount(orderCount);

		model.addAttribute("pm", pm);
		model.addAttribute("recentOrder", myPageService.recentOrder(pm));
		
		System.out.println("Page>>>>>>>>>>>>>>>>>"+sc.getPage());
		System.out.println("orderCount>>>>>>>>>>>>>>>>>"+orderCount);
		System.out.println("StartPage>>>>>>>>>>>>>>>>>"+pm.getStartPage());
		System.out.println("EndPage>>>>>>>>>>>>>>>>>"+pm.getEndPage());
		System.out.println("StartPost>>>>>>>>>>>>>>>>>"+pm.getStartPost());
		System.out.println("LastPost>>>>>>>>>>>>>>>>>"+pm.getLastPost());


				
		
		return "myPage/main";
	}
	
	//리뷰작성 버튼 클릭하면 해당 주문정보에서 detail_idx 데이터 받아오기
	@ResponseBody
	@RequestMapping(value="/detailIdx.do", method=RequestMethod.POST)
	public void detailIdx(CombineVO vo, HttpSession session) throws Exception {
		System.out.println("마이페이지 컨트롤러>>>>>detail_idx : "+vo.getDetail_idx());
		//CombineVO로 받아온 detail_idx를 아래의 reviewWrite 메소드에서 사용하기 위해 session에 담는다.
		session.setAttribute("detailIdx", vo.getDetail_idx());
	}
	
	

	public boolean extensionCheck(String type) throws Exception {
		String type1 = "jpg";
		String type2 = "jpeg";
		String type3 = "png";
		boolean result = true;
		
		System.out.println("확인하려는 확장자 : "+type);
		
		if(type.equals(type1) || type.equals(type2) || type.equals(type3)) {
			result = true;
		}
		else {
			result = false;
		}
		
		System.out.println("확장자 체크에서 반환되는 값은 true/false : "+result);
		
		return result;
	}
	
	
	
	//	@RequestMapping(produces = "text/html; charset=utf-8") : ajax 리턴받고 alert 창에서 한글 ???로 깨질 때 사용
	@ResponseBody
	@RequestMapping(value="/upload.do", method=RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE, produces = "text/html; charset=utf-8")
	public String upload(MultipartHttpServletRequest request, HttpSession session) throws Exception {
		
		
		String result = "";
		MultipartFile image1 = null;
		MultipartFile image2 = null;
		
		String sessionImageName1 = (String)session.getAttribute("imageName1");
		System.out.println("세션 imageName1 확인 : "+sessionImageName1);
		
		if(sessionImageName1 == null) {
			image1 = request.getFile("image1");
			image2 = request.getFile("image2");
			System.out.println("sessionImageName1 == null일 때 실행");
			System.out.println("마이페이지 컨트롤러-upload.do-image1 : "+image1);
			System.out.println("마이페이지 컨트롤러-upload.do-image2 : "+image2);
		}else if(sessionImageName1 != null) {
			image2 = request.getFile("image1");
			System.out.println("sessionImageName1 != null일 때 실행");
			System.out.println("마이페이지 컨트롤러-upload.do-image1 : "+image1);
			System.out.println("마이페이지 컨트롤러-upload.do-image2 : "+image2);
		}
		
		

		
		if(image1 != null && image2 != null) {
			String imageName1 = image1.getOriginalFilename();
			String imageName2 = image2.getOriginalFilename();
			System.out.println("마이페이지 컨트롤러-upload.do-imageName1 : "+imageName1);
			System.out.println("마이페이지 컨트롤러-upload.do-imageName2 : "+imageName2);
			
			String formatName1 = imageName1.substring(imageName1.lastIndexOf(".")+1);
			String formatName2 = imageName2.substring(imageName2.lastIndexOf(".")+1);
			System.out.println("자른 확장자 1 : "+formatName1);
			System.out.println("자른 확장자 2 : "+formatName2);
			boolean fileExtension1 = extensionCheck(formatName1);
			boolean fileExtension2 = extensionCheck(formatName2);
			
				//업로드 파일 2개 중 1개라도 불일치하면
				if(fileExtension1 == false || fileExtension2 == false) {
					result = "false";
				}
				else{
					byte[] imageData1 = image1.getBytes();
					byte[] imageData2 = image2.getBytes();
					System.out.println("마이페이지 컨트롤러-upload.do-imageData1 : "+imageData1);
					System.out.println("마이페이지 컨트롤러-upload.do-imageData2 : "+imageData2);
					
					session.setAttribute("imageName1", imageName1);
					session.setAttribute("imageName2", imageName2);
					session.setAttribute("imageData1", imageData1);
					session.setAttribute("imageData2", imageData2);
					
					result = "true";
				}
			
			
		}
		else if(image1 != null && image2 == null) {
			String imageName1 = image1.getOriginalFilename();
			System.out.println("마이페이지 컨트롤러-upload.do-imageName1 : "+imageName1);
			
			String formatName1 = imageName1.substring(imageName1.lastIndexOf(".")+1);
			System.out.println("자른 확장자 1 : "+formatName1);
			boolean fileExtension1 = extensionCheck(formatName1);
			
				if(fileExtension1 == false) {
					result = "false";
				}
				else{
					byte[] imageData1 = image1.getBytes();
					System.out.println("마이페이지 컨트롤러-upload.do-imageData1 : "+imageData1);
					
					session.setAttribute("imageName1", imageName1);
					session.setAttribute("imageData1", imageData1);
					
					result = "true";
				}
		}else if(image1 == null && image2 != null) {
			String imageName2 = image2.getOriginalFilename();
			System.out.println("마이페이지 컨트롤러-upload.do-imageName2 : "+imageName2);
			
			String formatName2 = imageName2.substring(imageName2.lastIndexOf(".")+1);
			System.out.println("자른 확장자 2 : "+formatName2);
			boolean fileExtension2 = extensionCheck(formatName2);
			
				if(fileExtension2 == false) {
					result = "false";
				}
				else{
					byte[] imageData2 = image2.getBytes();
					System.out.println("마이페이지 컨트롤러-upload.do-imageData2 : "+imageData2);
					
					session.setAttribute("imageName2", imageName2);
					session.setAttribute("imageData2", imageData2);
					
					result = "true";
				}
		}
				
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/cancel.do")
	public String uploadCancel(int num, HttpSession session) throws Exception {
		String result = "";
		
		// 세션 변수 개별 삭제
		// 다른 리뷰 작성 시 사진 없이 작성할 수 있기 때문에 세션에 image 정보를 지워줘야 한다.
		if(num==1) {
			session.removeAttribute("imageName1");
			session.removeAttribute("imageData1");
			result="pic1";
			System.out.println("마이페이지 컨트롤러-session.getAttribute(\"imageData1\") 삭제 확인 : "+session.getAttribute("imageData1"));
			System.out.println("마이페이지 컨트롤러-session.getAttribute(\"imageData2\") 삭제 확인 : "+session.getAttribute("imageData2"));
		}else if(num==2) {
			session.removeAttribute("imageName2");
			session.removeAttribute("imageData2");
			result="pic2";
			System.out.println("마이페이지 컨트롤러-session.getAttribute(\"imageData1\") 삭제 확인 : "+session.getAttribute("imageData1"));
			System.out.println("마이페이지 컨트롤러-session.getAttribute(\"imageData2\") 삭제 확인 : "+session.getAttribute("imageData2"));
		}else if(num==0) {
			session.removeAttribute("imageName1");
			session.removeAttribute("imageData1");
			session.removeAttribute("imageName2");
			session.removeAttribute("imageData2");
			result="all";
			System.out.println("마이페이지 컨트롤러-session.getAttribute(\"imageData1\") 삭제 확인 : "+session.getAttribute("imageData1"));
			System.out.println("마이페이지 컨트롤러-session.getAttribute(\"imageData2\") 삭제 확인: "+session.getAttribute("imageData2"));
		}
		
		
		return result;
	}
	
	
	//리뷰작성 모달창에서 ajax로 데이터 받아와서 DB에 review 저장하기
	@ResponseBody
	@RequestMapping(value="/reviewWrite.do")
	public void reviewWrite(CombineVO vo, HttpSession session) throws Exception {
		//bg_review에 필요한 데이터들
		//ridx는 mapper에서 자동으로 카운트 한다
		//contents, grade는 해당 reviewWrite 메소드의 매개변수 CombineVO를 통해서 넘어온다
		//rdate는 sysdate로 자동 입력한다
		//나머지 image1,image2,midx,detail_idx는 아래에서 해당 컨트롤러의 다른 메소드들과 세션에서 데이터를 가져와서 CombineVO에 저장한다
		
		
		System.out.println("마이페이지 컨트롤러>>>>>리뷰작성 실행됨");
		System.out.println("마이페이지 컨트롤러>>>>>contents : "+vo.getContents());
		System.out.println("마이페이지 컨트롤러>>>>>grade : "+vo.getGrade());
		//System.out.println("마이페이지 컨트롤러>>>>>detail_idx : "+vo.getDetail_idx());
		//System.out.println("마이페이지 컨트롤러>>>>>image1 : "+vo.getImage1());
		//System.out.println("마이페이지 컨트롤러>>>>>image2 : "+vo.getImage2());
		
		
		// 폴더생성
		makeDir();
		
		//위의 detailIdx 메소드에서 session에 저장한 detail_idx를 불러와서 CombineVo에 저장한다.
		int detail_idx = (Integer)session.getAttribute("detailIdx");
		vo.setDetail_idx(detail_idx);
		
		
		//로그인시 세션에 저장된 회원정보 불러오기
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		//회원정보에서 회원번호만 선택
		int midx = uv.getMidx();
		//선택한 회원번호를 CombineVO 객체의 midx 필드에 저장
		vo.setMidx(midx);
		
		
		String imageName1 = (String)session.getAttribute("imageName1");
		String imageName2 = (String)session.getAttribute("imageName2");
		byte[] imageData1 = (byte[])session.getAttribute("imageData1");
		byte[] imageData2 = (byte[])session.getAttribute("imageData2");
		
		
		// UUID 발급
        UUID uuid = UUID.randomUUID();
        // 저장할 파일명 = UUID + 원본이름
        String savedName1 = uuid.toString() + "_" + imageName1;
        String savedName2 = uuid.toString() + "_" + imageName2;
        System.out.println("마이페이지 컨트롤러-UUID를 적용한 savedName1 : "+savedName1);
        System.out.println("마이페이지 컨트롤러-UUID를 적용한 savedName2 : "+savedName2);
        
        
        
        if(imageName1 != null && imageName2 != null) {
        	System.out.println("저장할 이미지 파일은 2개입니다.");
        	// 파일 경로(servlet-context에 지정된 업로드경로), 변형한 파일명을 받아 파일 객체 생성
            File target1 = new File(uploadPath, savedName1);
            File target2 = new File(uploadPath, savedName2);
            System.out.println("마이페이지 컨트롤러-저장할 파일경로 target1 : "+target1);
            System.out.println("마이페이지 컨트롤러-저장할 파일경로 target2 : "+target2);
        	// 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
    		FileCopyUtils.copy(imageData1, target1);
    		FileCopyUtils.copy(imageData2, target2);
    		// 저장한 image 파일명을 CombineVo에 저장
    		vo.setImage1(savedName1);
    		vo.setImage2(savedName2);
    		//DB의 bg_review 테이블에 데이터 저장하기
    		myPageService.reviewWrite(vo);
        }
        else if(imageName1 != null && imageName2 == null) {
        	System.out.println("저장할 이미지 파일은 1개입니다.");
        	// 파일 경로(servlet-context에 지정된 업로드경로), 변형한 파일명을 받아 파일 객체 생성
            File target1 = new File(uploadPath, savedName1);
            System.out.println("마이페이지 컨트롤러-저장할 파일경로 target1 : "+target1);
        	FileCopyUtils.copy(imageData1, target1);
        	vo.setImage1(savedName1);
			myPageService.reviewWrite1(vo);
		}else if(imageName1 == null && imageName2 != null) {
        	System.out.println("저장할 이미지 파일은 1개입니다.");
        	// 파일 경로(servlet-context에 지정된 업로드경로), 변형한 파일명을 받아 파일 객체 생성
            File target2 = new File(uploadPath, savedName2);
            System.out.println("마이페이지 컨트롤러-저장할 파일경로 target1 : "+target2);
        	FileCopyUtils.copy(imageData2, target2);
        	vo.setImage1(savedName2);
			myPageService.reviewWrite1(vo);
		}
		else if(imageName1 == null && imageName2 == null) {
			System.out.println("저장할 이미지 파일이 없습니다.");
			myPageService.reviewWrite2(vo);
		}
		
		//최근 주문 정보를 가져오는 쿼리에 detail_idx가 포함되어 있으므로 이를 다른 값들과 같이 CombineVO에 다시 저장한다.
		//List<CombineVO> vo2 = (List<CombineVO>)myPageService.recentOrder(vo);
		//List에 담겨있어서 빼내기 실패...
		
		
		// 세션 변수 개별 삭제
		// 다른 리뷰 작성 시 사진 없이 작성할 수 있기 때문에 세션에 image 정보를 지워줘야 한다.
		session.removeAttribute("imageName1");
		session.removeAttribute("imageName2");
		session.removeAttribute("imageData1");
		session.removeAttribute("imageData2");
		
		System.out.println("마이페이지 컨트롤러-session.getAttribute(\"imageData1\") 삭제 확인 : "+session.getAttribute("imageData1"));
		System.out.println("마이페이지 컨트롤러-session.getAttribute(\"imageData2\") 삭제 확인: "+session.getAttribute("imageData2"));
		
	}
	
	@ResponseBody
	@RequestMapping(value="/reviewDetail.do")
	public Map<String, Object> reviewDetail(int ridx, HttpSession session) throws Exception {
		System.out.println("마이페이지 컨트롤러-ridx : "+ridx);
		
		String prodImg = "/team_Bling/resources/image/";
		String rvImg = "/team_Bling/resources/review_img/";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rvData", myPageService.reviewDetail(ridx));
		map.put("path", rvImg);
		map.put("imgPath",prodImg);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/delete.do")
	public void reviewDelete(int ridx) throws Exception {
		System.out.println("마이페이지 delete 메소드 실행");
		System.out.println("마이페이지 컨트롤러-reviewDelete-ridx : "+ridx);
		
		CombineVO rvData = myPageService.reviewDetail(ridx);
		String delRvImg1 = rvData.getImage1();
		String delRvImg2 = rvData.getImage2();
		System.out.println("마이페이지 컨트롤러-삭제할 리뷰이미지1-imgName1 : "+delRvImg1);
		System.out.println("마이페이지 컨트롤러-삭제할 리뷰이미지1-imgName2 : "+delRvImg2);
		
		//파일이름를 입력하면 파일을 삭제하는 메소드 -> review_img 폴더
		String path = uploadPath;
		
		
		if(delRvImg1 != null && delRvImg2 != null) {
			File delTarget1 = new File(path,delRvImg1);
			File delTarget2 = new File(path,delRvImg2);
			// 파일을 삭제합니다.
			delTarget1.delete(); 
			delTarget2.delete();
			System.out.println("파일을 2개 삭제하였습니다.");
        }else if(delRvImg1 != null && delRvImg2 == null) {
        	File delTarget1 = new File(path,delRvImg1);
			// 파일을 삭제합니다.
			delTarget1.delete(); 
			System.out.println("파일을 1개 삭제하였습니다.");
        }else if(delRvImg1 == null && delRvImg2 == null) {
        	System.out.println("파일이 존재하지 않습니다.");
        }
		
		myPageService.reviewDelete(ridx);
	}
	
/* 마이페이지 나의 정보 수정 페이지로 이동 */
	
	//회원정보수정 첫번째 비밀번호 확인시 갖고오는 이름정보
	@RequestMapping(value="/modify.do")
	public String modify(Model model,HttpSession session)throws Exception{
		//로그인시 세션에 저장된 회원정보 불러오기
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		//회원정보에서 회원번호만 선택
		int midx = uv.getMidx();
		
		model.addAttribute("data",myPageService.confirm(midx));
				
		return "myPage/modify";
	}
	
	//비번확인
	@RequestMapping(value="/confirmpwd.do")
	@ResponseBody
	public boolean confirmpwd(String pass, HttpSession session)throws Exception{
		boolean value = false;
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		//회원정보에서 회원번호만 선택
		int midx = uv.getMidx();
		String getpwd = myPageService.delconfirm(midx);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(encoder.matches(pass, getpwd)) {
			//넘겨받은 비밀번호와 user객체에 암호화된 비밀번호와 비교
			value=true;
		}
		return value;
	}
	
	//회원정보 수정 페이지
	@RequestMapping(value="/modifyInformation.do")
	public String modifyInf(Model model,HttpSession session)throws Exception{
		//로그인시 세션에 저장된 회원정보 불러오기
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		//회원정보에서 회원번호만 선택
		int midx = uv.getMidx();
		
		model.addAttribute("data",myPageService.confirm(midx));
				
		return "myPage/modifyInformation";
	}
	
	//비밀번호 변경 jsp
	@RequestMapping(value="/modifypwd.do")
	public String modifypwd()throws Exception{
		return "myPage/modifypwd";
	}
	
	//비밀번호 변경
	@RequestMapping(value="/remodifypwd.do")
	public String remodifypwd(Model model,String pwd,HttpSession session, HttpServletRequest request, HttpServletResponse response)throws Exception{
		UserVO vo = (UserVO)session.getAttribute("UserVO");
		//비밀번호 인코딩
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(pwd);
		vo.setPwd(securePw);
		myPageService.modifypwd(vo);
		
		loginService.logout(session,request,response);
		return "redirect:/Login/main.do";
	}
	
	//이메일 중복확인
	@RequestMapping(value="/confirmemail.do")
	@ResponseBody
	public String confirmemail(Model model,String emaildata)throws Exception{
		String data = null;
		
		data = joinService.confirmemail(emaildata);
		
		if(data==null) {
			data="yes";
		}else {
			data="no";
		}
		return data;
	}
	
	//수정완료
	@RequestMapping(value="/remodify.do", method = RequestMethod.POST)
	public String normal(Locale locale,Model model,UserVO uv)throws Exception {
		myPageService.remodify(uv);
		return "myPage/modify_fin";
	}
	
	/* 회원 탈퇴 */
	//회원탈퇴
	@RequestMapping(value="/deletemain.do")
	public String delmain(Model model, HttpSession session)throws Exception{
		//로그인시 세션에 저장된 회원정보 불러오기
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		//회원정보에서 회원번호만 선택
		int midx = uv.getMidx();
		model.addAttribute("data",myPageService.confirm(midx));
		return "myPage/delete";
	}
	
	@RequestMapping(value="/deletequit.do")
	@ResponseBody
	public int del(HttpSession session,String pass)throws Exception{
		
		int confirm = 0;
		//로그인시 세션에 저장된 회원정보 불러오기
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		//회원정보에서 회원번호만 선택
		int midx = uv.getMidx();

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String realpass = myPageService.delconfirm(midx);
		
		if(encoder.matches(pass, realpass)) {
			confirm = 1; //비번틀림
		}else {
			confirm = 0; //비번 맞음
		}
				
		return confirm;
	}
	
	@RequestMapping(value="/deletefin.do")
	@ResponseBody
	public int delfin(HttpSession session, String quitval, HttpServletRequest request, HttpServletResponse response)throws Exception{
		//로그인시 세션에 저장된 회원정보 불러오기
		UserVO uv = (UserVO)session.getAttribute("UserVO");
		//회원정보에서 회원번호만 선택
		int midx = uv.getMidx();
		CombineVO vo = new CombineVO();
		vo.setMidx(midx);
		vo.setComments(quitval);
		loginService.logout(session,request,response);
		myPageService.del(vo);
		return 0;
	}
	
	@ResponseBody
	@RequestMapping(value = { "ImgSaveTest" }, method = RequestMethod.POST)
	public ModelMap ImgSaveTest(@RequestParam HashMap<Object, Object> param, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
		ModelMap map = new ModelMap();
		
		String binaryData = request.getParameter("imgSrc");
		FileOutputStream stream = null;
		try{
			System.out.println("binary file   "  + binaryData);
			if(binaryData == null || binaryData.trim().equals("")) {
			    throw new Exception();
			}
			binaryData = binaryData.replaceAll("data:image/png;base64,", "");
			Decoder decoder = Base64.getDecoder();
			byte[] file = decoder.decode(binaryData);
			String fileName=  UUID.randomUUID().toString();
			
			stream = new FileOutputStream("E:/test2/"+fileName+".png");
			stream.write(file);
			stream.close();
			System.out.println("캡처 저장");
		    
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("에러 발생");
		}finally{
			if(stream != null) {
				stream.close();
			}
		}
		
		map.addAttribute("resultMap", "");
		return map;
	}
}

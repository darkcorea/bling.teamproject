package com.project.bling.ad_controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.bling.ad_service.Ad_RegistService;
import com.project.bling.vo.ImageVO;
import com.project.bling.vo.OptionVO;
import com.project.bling.vo.ProductVO;

@RequestMapping(value="/Ad_regist")
@Controller
public class Ad_RegistController {
	
	@Autowired
	Ad_RegistService ad_registService;
	
	// 리스트 페이지 이동
	@RequestMapping(value = "/list.do")
	public String list(Locale locale, Model model) throws Exception {
		
		List<ProductVO> list = ad_registService.list();
		
		model.addAttribute("list", list);
		return "admin/Regist/list";
	}
	
	
	@RequestMapping(value = "/view.do")
	public String detail(Locale locale, Model model) throws Exception {
		
		return "admin/Regist/view";
	}

	// 제품 등록페이지 이동
	@RequestMapping(value = "/regist.do", method = RequestMethod.GET)
	public String resist(Locale locale, Model model) throws Exception {
		
		return "admin/Regist/regist";
	}
	
	// 제품 등록하기
	@RequestMapping(value = "/registPro.do", method = RequestMethod.POST)
	@ResponseBody
	public int insert(ProductVO vo) throws Exception {
		ad_registService.insert(vo);
		return vo.getPidx();
	}
	
	// 옵션등록
	@RequestMapping(value = "/insertOpt.do", method = RequestMethod.POST)
	@ResponseBody
	public void insertOpt(OptionVO vo) throws Exception {
		ad_registService.insertOpt(vo);
	}

	// 제품 이미지 등록
	@RequestMapping(value = "/insertImg.do", method = RequestMethod.POST)
	public String uploadFile(MultipartHttpServletRequest request) throws Exception {
		
		// 제품 이미지 절대경로 위치, 각 검퓨터 마다 다름
		String path = "C:\\Users\\MYCOM\\git\\bling.teamproject\\team_Bling\\src\\main\\webapp\\resources\\image\\";
		String spath = "C:\\Users\\MYCOM\\git\\bling.teamproject\\team_Bling\\src\\main\\webapp\\resources\\simage\\";

		// 기본적으로 들어오는 이미지 3개
		MultipartFile f_main = request.getFile("main");
		MultipartFile f_detail1 = request.getFile("detail1");
		MultipartFile f_showing1 = request.getFile("showing1");

		String main=null;
		String detail1=null;
		String showing1= null;

		
		// 제품번호
		int pidx = Integer.parseInt(request.getParameter("pidx"));
		
		// 제품 이미지 업로드 
		 if( f_main != null) {
		
			// 기존 파일 이름을 받고 확장자 저장
			String orifileName = f_main.getOriginalFilename();
			String ext = orifileName.substring(orifileName.lastIndexOf("."));
			
			// 이름 값 변경을 위한 설정 
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmssSSS");
			int rand = (int)(Math.random()*1000);
			
			// 파일 이름 변경
			main = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
			
			// 파일 저장
			f_main.transferTo(new File(path + main));
			
			}
		 
		 if(f_detail1 != null) {
				
			String orifileName = f_detail1.getOriginalFilename();
			String ext = orifileName.substring(orifileName.lastIndexOf("."));
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmss");
			int rand = (int)(Math.random()*1000);
			detail1 = sdf.format(System.currentTimeMillis()) + "_" + rand +"_d"+ ext;
			f_detail1.transferTo(new File(path + detail1));
				
			}
		 
		 if(f_showing1 != null) {
		
			String orifileName = f_showing1.getOriginalFilename();
			String ext = orifileName.substring(orifileName.lastIndexOf("."));
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmss");
			int rand = (int)(Math.random()*1000);
			showing1 = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
			f_showing1.transferTo(new File(spath + showing1));
			}
		
		// 이미지 이름들과 pidx를 vo에 담음
		ImageVO vo = new ImageVO();
		vo.setPidx(pidx);
		vo.setMain(main);
		vo.setDetail1(detail1);
		vo.setShowing1(showing1);
		
		

		// 추가로 들어 올 수도 있는 이미지 들
		// 오류가 난 이유
		// 이미지를 추가하지 않아도 폼에 name이 있으면 파일을 올리지 않아도 파일이 들어 있다고  판단을 해서
		// .isEmpty()함수를 사용하면 true를 반환한다. null도 아니게 된다.
		// 파일을 올리지 않았을 경우 이름은 null값이 나옴
		// request.getFile("이름")이 null 값이면 오류가 발생한다.
		
		if(request.getFile("detail2") != null) {
			MultipartFile f_detail2 = request.getFile("detail2");
			if(f_detail2.getOriginalFilename() != null && f_detail2.getOriginalFilename() != "") {
				String d2name = f_detail2.getOriginalFilename();
				String ext = d2name.substring(d2name.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmss");
				int rand = (int)(Math.random()*1000);
				String detail2 = sdf.format(System.currentTimeMillis()) + "_" + rand +"_d"+ ext;
				f_detail2.transferTo(new File(path + detail2));
				vo.setDetail2(detail2);
			}		
		}
		
		if(request.getFile("detail3") != null) {
			MultipartFile f_detail3 = request.getFile("detail3");
			if(f_detail3.getOriginalFilename() != null && f_detail3.getOriginalFilename() != "") {
				String d3name = f_detail3.getOriginalFilename();
				String ext = d3name.substring(d3name.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmss");
				int rand = (int)(Math.random()*1000);
				String detail3 = sdf.format(System.currentTimeMillis()) + "_" + rand +"_d"+ ext;
				f_detail3.transferTo(new File(path + detail3));
				vo.setDetail3(detail3);
			}
		}	
		
		if(request.getFile("showing2") != null) {
			MultipartFile f_showing2 = request.getFile("showing2");
			if(f_showing2.getOriginalFilename() != null && f_showing2.getOriginalFilename() != "") {
				String s2name = f_showing2.getOriginalFilename();
				String ext = s2name.substring(s2name.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmss");
				int rand = (int)(Math.random()*1000);
				String showing2 = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
				f_showing2.transferTo(new File(spath + showing2));
				vo.setShowing2(showing2);
			}
		}
		
		if(request.getFile("showing3") != null) {
			MultipartFile f_showing3 = request.getFile("showing3");
			if(f_showing3.getOriginalFilename() != null && f_showing3.getOriginalFilename() != "") {
				String s3name = f_showing3.getOriginalFilename();
				String ext = s3name.substring(s3name.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmss");
				int rand = (int)(Math.random()*1000);
				String showing3 = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
				f_showing3.transferTo(new File(spath + showing3));
				vo.setShowing3(showing3);
			}
			
		}
		
		if (request.getFile("showing4") != null) {
			MultipartFile f_showing4 = request.getFile("showing4");
			if(f_showing4.getOriginalFilename() != null && f_showing4.getOriginalFilename() != "") {
				String s4name = f_showing4.getOriginalFilename();
				String ext = s4name.substring(s4name.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmss");
				int rand = (int)(Math.random()*1000);
				String showing4 = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
				f_showing4.transferTo(new File(spath + showing4));
				vo.setShowing4(showing4);
			}
		}
		
		if(request.getFile("showing5") != null) {
			MultipartFile f_showing5 = request.getFile("showing5");
			if(f_showing5.getOriginalFilename() != null && f_showing5.getOriginalFilename() != "") {
				String s5name = f_showing5.getOriginalFilename();
				String ext = s5name.substring(s5name.lastIndexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmss");
				int rand = (int)(Math.random()*1000);
				String showing5 = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
				f_showing5.transferTo(new File(spath + showing5));
			}	
		}
	
		
		// 이미지 이름들읗 널어서 보냄
		ad_registService.insertImg(vo);

		return "redirect:/Ad_regist/list.do";
		}
	
	
	
}

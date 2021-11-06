package com.project.bling.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.bling.service.AdminService;
import com.project.bling.vo.ImageVO;
import com.project.bling.vo.OptionVO;
import com.project.bling.vo.ProductVO;

@RequestMapping(value="/Admin")
@Controller
public class AdminController {

	@Autowired
	AdminService adminService;
	
	// 메인페이지 이동
	@RequestMapping(value="/main.do")
	public String main(Locale locale, Model model) {
		return "admin/main";
	}
	
	// 리스트 페이지 이동
	@RequestMapping(value = "/list.do")
	public String list(Locale locale, Model model) throws Exception {
		
		return "admin/list";
	}
	
	// 제품 등록페이지 이동
	@RequestMapping(value = "/regist.do", method = RequestMethod.GET)
	public String resist(Locale locale, Model model) throws Exception {
		
		return "admin/regist";
	}
	
	// 제품 등록하기
	@RequestMapping(value = "/registPro.do", method = RequestMethod.POST)
	@ResponseBody
	public void insert(ProductVO vo) throws Exception {
		adminService.insert(vo);
	}
	
	// 옵션등록
	@RequestMapping(value = "/insertOpt.do", method = RequestMethod.POST)
	@ResponseBody
	public void insertOpt(OptionVO vo) throws Exception {
		adminService.insertOpt(vo);
	}

	@RequestMapping(value = "/insertImg.do", method = RequestMethod.POST)
	public String uploadFile(MultipartHttpServletRequest request) throws Exception {

		String path = "D:\\dev_ajax\\spring\\team\\src\\main\\webapp\\resources\\image\\";
		String spath = "D:\\dev_ajax\\spring\\team\\src\\main\\webapp\\resources\\simage\\";
		MultipartFile f_main = request.getFile("main");
		MultipartFile f_detail1 = request.getFile("detail1");
		MultipartFile f_detail2 = request.getFile("detail2");
		MultipartFile f_showing1 = request.getFile("showing1");
		MultipartFile f_showing2 = request.getFile("showing2");

		String main=null;
		String detail1=null;
		String detail2=null;	
		String showing1= null;
		String showing2= null;
		
		int pidx = Integer.parseInt(request.getParameter("pidx"));
		
		
		// 파일 업로드 
		 if(!f_main.isEmpty()) {
		
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
		 if(!f_detail1.isEmpty()) {
				
				// 기존 파일 이름을 받고 확장자 저장
				String orifileName = f_detail1.getOriginalFilename();
				String ext = orifileName.substring(orifileName.lastIndexOf("."));
				
				// 이름 값 변경을 위한 설정 
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmss");
				int rand = (int)(Math.random()*1000);
				
				// 파일 이름 변경
				detail1 = sdf.format(System.currentTimeMillis()) + "_" + rand +"_d"+ ext;
				
				// 파일 저장
				f_detail1.transferTo(new File(path + detail1));
				
			}
		 if(!f_detail2.isEmpty()) {
					
				// 기존 파일 이름을 받고 확장자 저장
				String orifileName = f_detail2.getOriginalFilename();
				String ext = orifileName.substring(orifileName.lastIndexOf("."));
					
				// 이름 값 변경을 위한 설정 
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmss");
				int rand = (int)(Math.random()*1000);
					
				// 파일 이름 변경
				detail2 = sdf.format(System.currentTimeMillis()) + "_" + rand +"_d"+ ext;
					
				// 파일 저장
				f_detail2.transferTo(new File(path + detail2));
				
			}
		 if(!f_showing1.isEmpty()) {
		
			String orifileName = f_showing1.getOriginalFilename();
			String ext = orifileName.substring(orifileName.lastIndexOf("."));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmss");
			int rand = (int)(Math.random()*1000);
			
			showing1 = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
			
			f_showing1.transferTo(new File(spath + showing1));
			}
		 if(!f_showing2.isEmpty()) {
				
				String orifileName = f_showing2.getOriginalFilename();
				String ext = orifileName.substring(orifileName.lastIndexOf("."));
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmss");
				int rand = (int)(Math.random()*1000);
				
				showing2 = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
				
				f_showing2.transferTo(new File(spath + showing2));
				}
		
			ImageVO vo = new ImageVO();
			vo.setPidx(pidx);
			vo.setMain(main);
			vo.setDetail1(detail1);
			vo.setDetail2(detail2);
			vo.setShowing1(showing1);
			vo.setShowing2(showing2);
			adminService.insertImg(vo);

		return "admin/view";
		}


}

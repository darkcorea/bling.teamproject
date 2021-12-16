package com.project.bling.ad_controller;

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

import com.project.bling.ad_service.Ad_RegistService;
import com.project.bling.domain.Criteria;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.ImageVO;
import com.project.bling.vo.OptionVO;
import com.project.bling.vo.ProductVO;

@RequestMapping(value="/Ad_regist")
@Controller
public class Ad_RegistController {
	
	@Autowired
	Ad_RegistService ad_registService;
	
	String path = "C:\\bling\\bling.teamproject\\team_Bling\\src\\main\\webapp\\resources\\image\\";
	String spath = "C:\\bling\\bling.teamproject\\team_Bling\\src\\main\\webapp\\resources\\simage\\";
	
	/* 파일이름를 입력하면 파일을 삭제하는 메소드 image폴더*/
	public void imageDel(String name) {
		 File deleteFile = new File(path+name);
		 if(deleteFile.exists()) {   
	            // 파일을 삭제합니다.
	            deleteFile.delete(); 
	            System.out.println("파일을 삭제하였습니다.");
	        } else {
	            System.out.println("파일이 존재하지 않습니다.");
	        }
	}
	
	/* 파일이름를 입력하면 파일을 삭제하는 메소드 simage폴더*/
	public void simageDel(String name) {
		 File deleteFile = new File(spath+name);
		 if(deleteFile.exists()) {   
	            // 파일을 삭제합니다.
	            deleteFile.delete(); 
	            System.out.println("파일을 삭제하였습니다.");
	        } else {
	            System.out.println("파일이 존재하지 않습니다.");
	        }
	}
	
	/* 이름을 입력하면 이름을 변경해 주는 메소드 */
	public String imgName1(String name) {
		String ext = name.substring(name.lastIndexOf("."));
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmss");
		int rand = (int)(Math.random()*1000);
		String imgName = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
		return imgName;
	}
	
	/* 이름을 입력하면 이름을 변경해 주는 메소드(디테일전용) */
	public String imgName2(String name) {
		String ext = name.substring(name.lastIndexOf("."));
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-HHmmss");
		int rand = (int)(Math.random()*1000);
		String imgName = sdf.format(System.currentTimeMillis()) + "_" + rand +"_d"+ ext;
		return imgName;
	}

	
	// 리스트 페이지 이동
	@RequestMapping(value = "/list.do")
	public String list(Locale locale, Model model, int page, String kind) throws Exception {
		
		// 페이징에 필요한 값 넣기
		Criteria sc = new Criteria();
		sc.setPage(page);
		sc.setPerPageNum(10);
		
		PageMaker pm = new PageMaker();
		pm.setScri(sc);
		pm.setKind(kind);
		
		// 물건 총 갯수 구하기
		int product_count = ad_registService.product_count(kind);
		pm.setTotalCount(product_count);
		
		// 페이징된 리스트와 필요한 값 페이지로 보내기
		model.addAttribute("pm", pm);
		model.addAttribute("list", ad_registService.list(pm));
		model.addAttribute("count", product_count);
		
		// 옵션 정보 페이지로 보내기
		model.addAttribute("oblist", ad_registService.oblist());
		
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
	
	// 제품 등록하기 에이작스
	@RequestMapping(value = "/registPro.do", method = RequestMethod.POST)
	@ResponseBody
	public int insert(ProductVO vo) throws Exception {
		ad_registService.insert(vo);
		return vo.getPidx();
	}
	
	// 옵션등록 에이작스
	@RequestMapping(value = "/insertOpt.do", method = RequestMethod.POST)
	@ResponseBody
	public void insertOpt(OptionVO vo) throws Exception {
		ad_registService.insertOpt(vo);
	}
	
	// 제품 수정하기 페이지
	@RequestMapping(value = "/modify.do")
	public String modify(Locale locale, Model model, int pidx) throws Exception {
		
		// 제품 , 옵션, 이미지 정보 보내기
		model.addAttribute("product", ad_registService.product(pidx));
		model.addAttribute("oblist", ad_registService.oblist(pidx));
		model.addAttribute("image", ad_registService.image(pidx));
		
		return "admin/Regist/modify";
	}
	
	// 제품 수정하기 에이작스
	@RequestMapping(value = "/updatePro.do", method = RequestMethod.POST)
	@ResponseBody
	public void updatePro(ProductVO vo) throws Exception {
		ad_registService.updatePro(vo);
	}
	
	// 제품 옵션 수정하기 에이작스
	@RequestMapping(value = "/updateOpt.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateOpt(OptionVO ov) throws Exception {
		ad_registService.updateOpt(ov);
	}
	
	// 제품 옵션 삭제하기 에이작스
	@RequestMapping(value = "/deleteOpt.do", method = RequestMethod.POST)
	@ResponseBody
	public void deleteOpt(int oidx) throws Exception {
		ad_registService.deleteOpt(oidx);
	}
	
	// 제품 이미지 삭제하기 에이작스
	// 중복코드가 많다. 리펙토링 해야 한다.
	@RequestMapping(value = "/deleteImg.do", method = RequestMethod.POST)
	@ResponseBody
	public void deleteImg(CombineVO cv, String fileName) throws Exception {
		
		// bg_image의 칼럼에 있는 파일명 없애기
		ad_registService.deleteImg(cv);
		
		// 칼럼 마지막 문자열 자르기  CombineVO를 쓰기 위해서 pidx와 kind라는 값으로 넘겨준다.
		// kind는 bg_image의 칼럼 이름이다.
		String col1 = cv.getKind().substring(0, cv.getKind().length()-1);
		
		// 자른 문자열로 경로 지정과 파일 삭제하기
		// 제품 이미지 절대경로 위치, 각 검퓨터 마다 다름
		if(col1.equals("detail")) {
			// 파일을 삭제하는 메소드
			imageDel(fileName);
		}
		if(col1.equals("showing")) {
			 simageDel(fileName);
		}
	}
	
	
	// 제품 이미지 등록
	// 중복코드가 많다. 리펙토링 해야 한다. (리펙토링 1차 진행)
	@RequestMapping(value = "/insertImg.do", method = RequestMethod.POST)
	public String uploadFile(MultipartHttpServletRequest request) throws Exception {

		// 추가로 들어 올 수도 있는 이미지 들
		// 오류가 난 이유
		// 이미지를 추가하지 않아도 폼에 name이 있으면 파일을 올리지 않아도 파일이 들어 있다고  판단을 해서
		// .isEmpty()함수를 사용하면 true를 반환한다. null도 아니게 된다.
		// 파일을 올리지 않았을 경우 이름은 null값이 나옴
		// request.getFile("이름")이 null 값이면 오류가 발생한다. MultipartFile에 넣을 떄 오류 발생
		// 제품 이미지 절대경로 위치, 각 검퓨터 마다 다름

		// 제품번호
		int pidx = Integer.parseInt(request.getParameter("pidx"));
		// 이름을 바꿔주는 메소드를 사용하기 위해서 필요함
		String imgName = null;
		
		// 이미지 이름들과 pidx를 vo에 담음
		ImageVO vo = new ImageVO();
		vo.setPidx(pidx);

		
		// 넘어온 파일이 null이 아니라면
		 if( request.getFile("main") != null) {
			// 들어온 파일을 MultipartFile로 받아 준다.
			MultipartFile f_main = request.getFile("main");
			// 들어온 파일의 이름이 null이 아니라면 넘어온 파일이 있는지 다시 체크
			if(f_main.getOriginalFilename() != null && f_main.getOriginalFilename() != "") {
				String name = f_main.getOriginalFilename();
				// 파일 이름을 바꿔주는 메소드
				imgName = imgName1(name);
				// 이름을 바꾼 파일을 절대경로에 저장을 함
				f_main.transferTo(new File(path + imgName));
				// 파일 이름을 VO에 담는다.
				vo.setMain(imgName);
				}
			}
		 
		 if(request.getFile("detail1") != null) {
			MultipartFile f_detail1 = request.getFile("detail1");
				if(f_detail1.getOriginalFilename() != null && f_detail1.getOriginalFilename() != "") {
				String name = f_detail1.getOriginalFilename();
				imgName = imgName2(name);
				f_detail1.transferTo(new File(path + imgName));
				vo.setDetail1(imgName);

				}
			}			

		if(request.getFile("detail2") != null) {
			MultipartFile f_detail2 = request.getFile("detail2");
			if(f_detail2.getOriginalFilename() != null && f_detail2.getOriginalFilename() != "") {
				String name = f_detail2.getOriginalFilename();
				imgName = imgName2(name);
				f_detail2.transferTo(new File(path + imgName));
				vo.setDetail2(imgName);
			}		
		}
		
		if(request.getFile("detail3") != null) {
			MultipartFile f_detail3 = request.getFile("detail3");
			if(f_detail3.getOriginalFilename() != null && f_detail3.getOriginalFilename() != "") {
				String name = f_detail3.getOriginalFilename();
				imgName = imgName2(name);
				f_detail3.transferTo(new File(path + imgName));
				vo.setDetail3(imgName);
			}
		}	
		
		if(request.getFile("showing1") != null) {
			MultipartFile f_showing1 = request.getFile("showing1");
				if(f_showing1.getOriginalFilename() != null && f_showing1.getOriginalFilename() != "") {
				String name = f_showing1.getOriginalFilename();
				imgName = imgName1(name);
				f_showing1.transferTo(new File(spath + imgName));
				vo.setShowing1(imgName);
				}
		}
		
		if(request.getFile("showing2") != null) {
			MultipartFile f_showing2 = request.getFile("showing2");
			if(f_showing2.getOriginalFilename() != null && f_showing2.getOriginalFilename() != "") {
				String name = f_showing2.getOriginalFilename();
				imgName = imgName1(name);
				f_showing2.transferTo(new File(spath + imgName));
				vo.setShowing2(imgName);
			}
		}
		
		if(request.getFile("showing3") != null) {
			MultipartFile f_showing3 = request.getFile("showing3");
			if(f_showing3.getOriginalFilename() != null && f_showing3.getOriginalFilename() != "") {
				String name = f_showing3.getOriginalFilename();
				imgName = imgName1(name);
				f_showing3.transferTo(new File(spath + imgName));
				vo.setShowing3(imgName);
			}
			
		}
		
		if (request.getFile("showing4") != null) {
			MultipartFile f_showing4 = request.getFile("showing4");
			if(f_showing4.getOriginalFilename() != null && f_showing4.getOriginalFilename() != "") {
				String name = f_showing4.getOriginalFilename();
				imgName = imgName1(name);
				f_showing4.transferTo(new File(spath + imgName));
				vo.setShowing4(imgName);
			}
		}
		
		if(request.getFile("showing5") != null) {
			MultipartFile f_showing5 = request.getFile("showing5");
			if(f_showing5.getOriginalFilename() != null && f_showing5.getOriginalFilename() != "") {
				String name = f_showing5.getOriginalFilename();
				imgName = imgName1(name);
				f_showing5.transferTo(new File(spath + imgName));
				vo.setShowing5(imgName);
			}	
		}
		
		// 이미지 이름들읗 널어서 보냄
		ad_registService.insertImg(vo);

		return "redirect:/team_Bling/Ad_regist/list.do?page=1";
		}
	
		// 제품 이미지 수정
		// 중복코드가 많다. 리펙토링 해야 한다. (리펙토링 1차 진행)
		@RequestMapping(value = "/modifyImg.do", method = RequestMethod.POST)
		public String modifyImg(MultipartHttpServletRequest request) throws Exception {
			
			// 제품번호
			int pidx = Integer.parseInt(request.getParameter("pidx"));
			//이미지 정보 가져오기
			ImageVO iv = ad_registService.image(pidx);
			// 이름을 바꿔주는 메소드를 사용하기 위해서 필요함
			String imgName = "";
			
			// 이미지 이름들과 pidx를 vo에 담음
			ImageVO vo = new ImageVO();
			vo.setPidx(pidx);


			 if( request.getFile("main") != null) {
				MultipartFile f_main = request.getFile("main");
				if(f_main.getOriginalFilename() != null && f_main.getOriginalFilename() != "") {
					String name = f_main.getOriginalFilename();
					//파일 이름을 바꿔주는 메소드
					imgName = imgName1(name);
					f_main.transferTo(new File(path + imgName));
					vo.setMain(imgName);
					// 파일일 삭제 메소드에 파일 이름 넣기
					imageDel(iv.getMain());
					}
				}
			 
			 if(request.getFile("detail1") != null) {
				MultipartFile f_detail1 = request.getFile("detail1");
					if(f_detail1.getOriginalFilename() != null && f_detail1.getOriginalFilename() != "") {
					String name = f_detail1.getOriginalFilename();
					imgName = imgName2(name);
					f_detail1.transferTo(new File(path + imgName));
					vo.setDetail1(imgName);
					imageDel(iv.getDetail1());
					}
				}			

			if(request.getFile("detail2") != null) {
				MultipartFile f_detail2 = request.getFile("detail2");
				if(f_detail2.getOriginalFilename() != null && f_detail2.getOriginalFilename() != "") {
					String name = f_detail2.getOriginalFilename();
					imgName = imgName2(name);
					f_detail2.transferTo(new File(path + imgName));
					vo.setDetail2(imgName);
					imageDel(iv.getDetail2());
				}		
			}
			
			if(request.getFile("detail3") != null) {
				MultipartFile f_detail3 = request.getFile("detail3");
				if(f_detail3.getOriginalFilename() != null && f_detail3.getOriginalFilename() != "") {
					String name = f_detail3.getOriginalFilename();
					imgName = imgName2(name);
					f_detail3.transferTo(new File(path + imgName));
					vo.setDetail3(imgName);
					imageDel(iv.getDetail3());
				}
			}	
			
			if(request.getFile("showing1") != null) {
				MultipartFile f_showing1 = request.getFile("showing1");
					if(f_showing1.getOriginalFilename() != null && f_showing1.getOriginalFilename() != "") {
					String name = f_showing1.getOriginalFilename();
					imgName = imgName1(name);
					f_showing1.transferTo(new File(spath + imgName));
					vo.setShowing1(imgName);
					simageDel(iv.getShowing1());
					}
			}
			
			if(request.getFile("showing2") != null) {
				MultipartFile f_showing2 = request.getFile("showing2");
				if(f_showing2.getOriginalFilename() != null && f_showing2.getOriginalFilename() != "") {
					String name = f_showing2.getOriginalFilename();
					imgName = imgName1(name);
					f_showing2.transferTo(new File(spath + imgName));
					vo.setShowing2(imgName);
					simageDel(iv.getShowing2());
				}
			}
			
			if(request.getFile("showing3") != null) {
				MultipartFile f_showing3 = request.getFile("showing3");
				if(f_showing3.getOriginalFilename() != null && f_showing3.getOriginalFilename() != "") {
					String name = f_showing3.getOriginalFilename();
					imgName = imgName1(name);
					f_showing3.transferTo(new File(spath + imgName));
					vo.setShowing3(imgName);
					simageDel(iv.getShowing3());
				}
				
			}
			
			if (request.getFile("showing4") != null) {
				MultipartFile f_showing4 = request.getFile("showing4");
				if(f_showing4.getOriginalFilename() != null && f_showing4.getOriginalFilename() != "") {
					String name = f_showing4.getOriginalFilename();
					imgName = imgName1(name);
					f_showing4.transferTo(new File(spath + imgName));
					vo.setShowing4(imgName);
					simageDel(iv.getShowing4());
				}
			}
			
			if(request.getFile("showing5") != null) {
				MultipartFile f_showing5 = request.getFile("showing5");
				if(f_showing5.getOriginalFilename() != null && f_showing5.getOriginalFilename() != "") {
					String name = f_showing5.getOriginalFilename();
					imgName = imgName1(name);
					f_showing5.transferTo(new File(spath + imgName));
					vo.setShowing5(imgName);
					simageDel(iv.getShowing5());
				}	
			}
			
			// 이미지 이름들읗 널어서 보냄
			ad_registService.updateImg(vo);

			return "redirect:/team_Bling/Ad_regist/modify.do?pidx="+pidx;
			}
	
	
}

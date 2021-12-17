package com.project.bling.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.Base64.Decoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.domain.Criteria;
import com.project.bling.domain.PageMaker;
import com.project.bling.service.CustomService;
import com.project.bling.vo.CustomVO;
import com.project.bling.vo.UserVO;

@RequestMapping(value="/Custom")
@Controller
public class CustomController {
	
	private static final String FILE_SERVER_PATH = "C:\\bling\\bling.teamproject\\team_Bling\\src\\main\\webapp\\resources\\usercustomizing\\";
	private static final String FILE_SERVER_PATH1 = "C:\\bling\\bling.teamproject\\team_Bling\\src\\main\\webapp\\resources\\usercustomizing";
	//private static final String FILE_SERVER_PATH = "C:\\tomcat\\webapps\\team_Bling\\resources\\usercustomizing\\";
	//private static final String FILE_SERVER_PATH1 = "C:\\tomcat\\webapps\\team_Bling\\resources\\usercustomizing";
	
	@Autowired
	CustomService customService;
	
	//커스터마이징 리스트
	@RequestMapping(value="/list.do")
	public String customlist()throws Exception{
		return "myPage/customizing_list";
	}
	
	//리스트페이징
	@RequestMapping(value="/listajax.do")
	@ResponseBody
	public Map<String,Object> list(int page, HttpSession session)throws Exception{
		UserVO vo = (UserVO)session.getAttribute("UserVO");
		int midx = vo.getMidx();
		int count = 0;
		count = customService.howmany();
		Criteria sc = new Criteria();
		sc.setPerPageNum(6);
		sc.setPage(page);
		PageMaker pm = new PageMaker();
		pm.setMidx(midx);
		pm.setScri(sc);
		pm.setTotalCount(count);
		Map<String, Object> list = new HashMap<String, Object>();
		list.put("list", customService.listajax(pm));
		list.put("pm", pm);
		
		return list;
	}
	
	//커스터마이징하는 곳
    @RequestMapping(value="/ssss.do")
    public String ssss()throws Exception{
    	return "myPage/customizing";
    }
	
	@RequestMapping(value="/customoption.do")
	@ResponseBody
	public List<CustomVO> customoption(Locale locale,Model model,int type) throws Exception {
		return customService.shape(type);
	}
	
	@RequestMapping(value="/customshape.do")
	@ResponseBody
	public List<CustomVO> customshape(int type,int shape,CustomVO vo) throws Exception {
		vo.setType(type);
		vo.setShape(shape);
		return customService.shapes(vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/scrshot.do", method = RequestMethod.POST)
	public ModelMap ImgSaveTest(@RequestParam HashMap<Object, Object> param, final HttpServletRequest request, final HttpServletResponse response
			,String name, int countval, int total, String totalname, HttpSession session) throws Exception {
		
		makeDir();
		
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
			
			stream = new FileOutputStream(FILE_SERVER_PATH+fileName+".png");
			stream.write(file);
			stream.close();
			System.out.println("캡처 저장");
			
			//로그인시 세션에 저장된 회원정보 불러오기
			UserVO uv = (UserVO)session.getAttribute("UserVO");
			int midx = uv.getMidx();
			
			CustomVO vo = new CustomVO();
			vo.setName(name);
			vo.setCntoption(countval);
			vo.setPrice(total);
			vo.setSumcoidx(totalname);
			vo.setCustomimg(fileName+".png");
			vo.setMidx(midx);
			
			customService.insertdb(vo);
		    
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
	
	
	 public void makeDir() {
        // 폴더를 만들 디렉토리 경로(Window 기반)
        File makeFolder = new File(FILE_SERVER_PATH1);
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
}

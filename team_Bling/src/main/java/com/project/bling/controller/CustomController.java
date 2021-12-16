package com.project.bling.controller;

import java.io.FileOutputStream;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import java.util.Base64.Decoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.service.CustomService;
import com.project.bling.vo.CustomVO;

@RequestMapping(value="/Custom")
@Controller
public class CustomController {
	
	private static final String FILE_SERVER_PATH = "C:\\bling\\bling.teamproject\\team_Bling\\src\\main\\webapp\\resources\\usercustomizing\\";
	
	@Autowired
	CustomService customService;
	
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
			,String name, int countval, int total, String totalname) throws Exception {
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
			
			CustomVO vo = new CustomVO();
			vo.setName(name);
			vo.setCntoption(countval);
			vo.setPrice(total);
			vo.setSumcoidx(totalname);
			vo.setCustomimg(fileName+".png");
			
			
		    
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

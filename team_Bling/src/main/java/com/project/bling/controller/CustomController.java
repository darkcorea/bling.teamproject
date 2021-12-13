package com.project.bling.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bling.service.CustomService;
import com.project.bling.vo.CustomVO;

@RequestMapping(value="/Custom")
@Controller
public class CustomController {
	
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
}

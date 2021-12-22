package com.project.bling.ad_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bling.vo.CustomVO;

@RequestMapping(value="/Ad_custom")
@Controller
public class Ad_CustomController {

	@RequestMapping(value="/doregist.do")
	public String doregist()throws Exception{
		return "admin/Custom/CustomRegist";
	}
	
	@RequestMapping(value="/regist.do")
	public String regist(CustomVO vo)throws Exception{
		
		return "";
	}
}

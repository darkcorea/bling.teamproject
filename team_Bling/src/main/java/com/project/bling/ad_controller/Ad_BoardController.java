package com.project.bling.ad_controller;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bling.vo.ProductVO;

@RequestMapping(value="/Ad_board")
@Controller
public class Ad_BoardController {
	
	@RequestMapping(value = "/board.do")
	public String list(Locale locale, Model model) throws Exception {
		
		return "admin/Board/board";
	}

}

package com.project.bling.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bling.service.VisitCountService;

@RequestMapping(value="/Visit")
@Controller
public class VisitCountController {
	
	@Autowired
	VisitCountService visitcountService;
	
	
}

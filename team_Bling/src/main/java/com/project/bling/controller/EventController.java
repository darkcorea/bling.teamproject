package com.project.bling.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bling.service.EventService;

@RequestMapping(value="/Event")
@Controller
public class EventController {

	@Autowired
	EventService eventService;
	
	@RequestMapping(value="/main.do")
	public String main(Locale locale, Model model) {
		return "event/main";
	}
}

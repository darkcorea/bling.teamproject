package com.project.bling.service;

import java.util.List;

import com.project.bling.vo.EventVO;

public interface EventService {
	
	List<EventVO> eventlist() throws Exception;
}

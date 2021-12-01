package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.EventDAO;
import com.project.bling.vo.EventVO;

@Service("EventService")
public class EventServiceImpl implements EventService {

	@Autowired
	EventDAO eventDAO;

	@Override
	public List<EventVO> eventlist() throws Exception {
		return eventDAO.eventlist();
	}
	
}

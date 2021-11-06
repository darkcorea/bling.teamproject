package com.project.bling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.EventDAO;

@Service("EventService")
public class EventServiceImpl implements EventService {

	@Autowired
	EventDAO eventDAO;
	
	
	
}

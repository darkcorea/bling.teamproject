package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.EventDAO;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.EventVO;

@Service("EventService")
public class EventServiceImpl implements EventService {

	@Autowired
	EventDAO eventDAO;
	
	//홈화면 이벤트 슬라이드
	@Override
	public List<EventVO> eventlist() throws Exception {
		return eventDAO.eventlist();
	}
	
	//리스트 총개수
	@Override
	public int eventCount_tot() throws Exception {
		return eventDAO.eventCount_tot();
	}

	@Override
	public int eventCount_ing() throws Exception {
		return eventDAO.eventCount_ing();
	}

	@Override
	public int eventCount_end() throws Exception {
		return eventDAO.eventCount_end();
	}
	
	//이벤트 리스트
	@Override
	public List<EventVO> eventTotal(PageMaker pm) throws Exception {
		return eventDAO.eventTotal(pm);
	}

	//이벤트 detail
	@Override
	public EventVO detail(int eidx) throws Exception {
		return eventDAO.detail(eidx);
	}
	
	
}

package com.project.bling.service;

import java.util.List;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.EventVO;

public interface EventService {
	
	//홈화면 이벤트 슬라이드
	List<EventVO> eventlist() throws Exception;
	
	//리스트 갯수
	int eventCount_tot() throws Exception;
	int eventCount_ing() throws Exception;
	int eventCount_end() throws Exception;
	
	//이벤트 리스트
	List<EventVO> eventTotal(PageMaker pm) throws Exception;
	
	//이벤트 detail
	EventVO detail(int eidx) throws Exception;
}

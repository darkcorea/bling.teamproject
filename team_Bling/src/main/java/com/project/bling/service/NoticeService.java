package com.project.bling.service;

import java.util.List;


import com.project.bling.domain.PageMaker;
import com.project.bling.vo.NoticeVO;

public interface NoticeService {
	
	//공지사항 총 개수
	int listcount() throws Exception;
	
	//공지사항 검색 총 개수
	int searchcount(String keyword) throws Exception;
		
	//공지사항  총 페이징
	List<NoticeVO> totalList(PageMaker pm)throws Exception;
	
	//공지사항 detail
	NoticeVO detail(int nidx) throws Exception;
}

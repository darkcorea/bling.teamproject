package com.project.bling.service;

import java.util.List;


import com.project.bling.domain.PageMaker;
import com.project.bling.vo.NoticeVO;

public interface NoticeService {
	
	//첫페이지 중요공지(S)3개 리스트
	List<NoticeVO> special() throws Exception;
	
	//첫페이지 S,N섞은 시간순 7개 리스트
	List<NoticeVO> firstpage() throws Exception;
	
	//두번째 페이지부터 쭉
	//공지사항 총 개수
	int listcount() throws Exception;
	
	//공지사항  총 페이징
	List<NoticeVO> totalList(PageMaker pm)throws Exception;
	
	//공지사항 detail
	NoticeVO detail(int nidx) throws Exception;
}

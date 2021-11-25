package com.project.bling.ad_service;

import java.util.List;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.NoticeVO;

public interface Ad_BoardService {
	
	//공지사항 총 개수
	int listcount() throws Exception;
	
	//공지사항 옵션 총 개수
	int listoptioncount(String type) throws Exception;
	
	//공지사항 검색 총 개수
	int searchcount(String keyword) throws Exception;
	
	//공지사항  총 페이징
	List<NoticeVO> totalList(PageMaker pm)throws Exception;
	
	//공지사항 옵션 페이징
	List<NoticeVO> optionList(PageMaker pm)throws Exception;
	
	//공지사항 삭제
	void deleteArr(int nidx)throws Exception;
	
	//공지사항 db에 등록
	void insert(NoticeVO vo) throws Exception;
	
	//공지사항 수정 전 불러오기(detail)
	NoticeVO detail(int nidx) throws Exception;
	
	//공지사항 수정
	void modify(NoticeVO vo) throws Exception;
	
}

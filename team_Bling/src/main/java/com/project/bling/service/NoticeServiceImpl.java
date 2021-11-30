package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.NoticeDAO;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.EventVO;
import com.project.bling.vo.NoticeVO;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDAO noticeDAO;
	
	//첫번째 페이지
	@Override
	public List<NoticeVO> special() throws Exception {
		return noticeDAO.special();
	}

	@Override
	public List<NoticeVO> firstpage() throws Exception {
		return noticeDAO.firstpage();
	}
	
	
	//두번째 페이지부터 쭉
	
	@Override
	public int listcount() throws Exception {
		return noticeDAO.listcount();
	}
	
	@Override
	public int searchcount(String keyword) throws Exception {
		return noticeDAO.searchcount(keyword);
	}
	
	@Override
	public List<NoticeVO> totalList(PageMaker pm) throws Exception {
		return noticeDAO.totalList(pm);
	}
	
	//검색
	@Override
	public List<NoticeVO> searchList(PageMaker pm) throws Exception {
		return noticeDAO.searchList(pm);
	}
	
	//하나 디테일
	@Override
	public NoticeVO detail(int nidx) throws Exception {
		return noticeDAO.detail(nidx);
	}

}

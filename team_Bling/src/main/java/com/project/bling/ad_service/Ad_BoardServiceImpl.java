package com.project.bling.ad_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.ad_dao.Ad_BoardDAO;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.EventVO;
import com.project.bling.vo.NoticeVO;
import com.project.bling.vo.QuestionVO;

@Service("Ad_BoardService")
public class Ad_BoardServiceImpl implements Ad_BoardService{
	@Autowired
	Ad_BoardDAO ad_boardDAO;

	@Override
	public int listcount() throws Exception {
		return ad_boardDAO.listcount();
	}

	@Override
	public int listoptioncount(String type) throws Exception {
		return ad_boardDAO.listoptioncount(type);
	}
	
	@Override
	public int searchcount(String keyword) throws Exception {
		return ad_boardDAO.searchcount(keyword);
	}
	
	@Override
	public List<NoticeVO> totalList(PageMaker pm) throws Exception {
		return ad_boardDAO.totalList(pm);
	}

	@Override
	public List<NoticeVO> optionList(PageMaker pm) throws Exception {
		return ad_boardDAO.optionList(pm);
	}
	
	@Override
	public void deleteArr(int nidx) throws Exception {
		ad_boardDAO.deleteArr(nidx);
	}
	
	@Override
	public void insert(NoticeVO vo) throws Exception {
		ad_boardDAO.insert(vo);
	}

	@Override
	public NoticeVO detail(int nidx) throws Exception {
		return ad_boardDAO.detail(nidx);
	}

	@Override
	public void modify(NoticeVO vo) throws Exception {
		ad_boardDAO.modify(vo);
	}

	@Override
	public void event_insert(EventVO vo) throws Exception {
		ad_boardDAO.event_insert(vo);
	}
	
	// 문의사할 리스트
	@Override
	public List<QuestionVO> question_list() throws Exception {
		return ad_boardDAO.question_list();
	}
	
	
	
}

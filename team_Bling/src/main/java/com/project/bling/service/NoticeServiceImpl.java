package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.NoticeDAO;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.NoticeVO;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDAO noticeDAO;
	
	// 고객센테에서 사용하는 문의 내역 총 갯수
	@Override
	public int Question_Count() throws Exception {
		return noticeDAO.Question_Count();
	}

	// 고객센테에서 사용하는 페이징
	@Override
	public List<NoticeVO> Question_page(PageMaker pm) throws Exception {
		return noticeDAO.Question_page(pm);
	}
	
	
	
}

package com.project.bling.service;

import javax.servlet.http.HttpSessionEvent;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.VisitCountDAO;

@Service
public class VisitCountServiceImpl implements VisitCountService{
	
	//@Autowired
	//VisitCountDAO visitcountDAO;

	@Override
	public void visiter(HttpSessionEvent hse,SqlSession sqlSession) throws Exception {
		VisitCountDAO visitcountDAO = new VisitCountDAO();
		System.out.println("9999999999999999999test"+visitcountDAO);
		visitcountDAO.visiter(hse,sqlSession);
	}

}

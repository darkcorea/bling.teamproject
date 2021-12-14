package com.project.bling.service;

import javax.servlet.http.HttpSessionEvent;

import org.apache.ibatis.session.SqlSession;

public interface VisitCountService {
	
	void visiter(HttpSessionEvent hse,SqlSession sqlSession) throws Exception;
}

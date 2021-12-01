package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.vo.EventVO;

@Repository
public class EventDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String em = "com.project.bling.mapper.eventMapper.";
	
	public List<EventVO> eventlist() throws Exception{
		return sqlSession.selectList(em+"eventlist");
	}
	
}

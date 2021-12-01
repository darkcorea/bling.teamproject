package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.EventVO;

@Repository
public class EventDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String em = "com.project.bling.mapper.eventMapper.";
	
	//홈화면 이벤트 슬라이드
	public List<EventVO> eventlist() throws Exception{
		return sqlSession.selectList(em+"eventlist");
	}
	
	//리스트 갯수
	public int eventCount_tot() throws Exception{
		return sqlSession.selectOne(em+"event_Count_tot");
	}
	public int eventCount_ing() throws Exception{
		return sqlSession.selectOne(em+"event_Count_ing");
	}
	public int eventCount_end() throws Exception{
		return sqlSession.selectOne(em+"event_Count_end");
	}

	//이벤트 리스트
	public List<EventVO> eventTotal(PageMaker pm) throws Exception{
		return sqlSession.selectList(em+"event_Total",pm);
	}
	
	//이벤트 detail
	public EventVO detail(int eidx) throws Exception{
		return sqlSession.selectOne(em+"detail",eidx);
	}
}

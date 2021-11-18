package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.NoticeVO;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String nm = "com.project.bling.mapper.noticeMapper.";

	// 고객센터에 사용하는 문의내역 총 갯수
	public int Question_Count() throws Exception {
		return sqlSession.selectOne(nm +"Question_Count");
	}
	
	// 고객센터에 사용하는 페이징
	public List<NoticeVO> Question_page(PageMaker pm) throws Exception {
		return sqlSession.selectList(nm +"Question_page", pm);
	}
	
}

package com.project.bling.ad_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.UserVO;

@Repository
public class Ad_UserDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String ps = "com.project.bling.mapper.adminmapper.ad_userMapper.";
	
	public int userCount(String grade) throws Exception {
		return sqlSession.selectOne(ps+"userCount",grade);
	}
	
	public List<UserVO> user_list(PageMaker pm) throws Exception {
		
		return sqlSession.selectList(ps+"user_list",pm);
	}
	
	public void update_grade() throws Exception {
		sqlSession.update(ps+"update_grade_G");
		sqlSession.update(ps+"update_grade_S");
		sqlSession.update(ps+"update_grade_B");
	}
}

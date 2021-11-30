package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.vo.CombineVO;

@Repository
public class MyPage_myReviewDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String mmm = "com.project.bling.mapper.myPageReviewMapper.";
	
	
	public List<CombineVO> reviewList(CombineVO vo) throws Exception {
		System.out.println("마이페이지 DAO-reviewList : "+sqlSession.selectList(mmm+"reviewList", vo));
		return sqlSession.selectList(mmm+"reviewList", vo);
	}
	
}

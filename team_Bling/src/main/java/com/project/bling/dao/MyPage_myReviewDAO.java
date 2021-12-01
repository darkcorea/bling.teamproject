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
		//System.out.println("마이페이지 DAO-rdate1 : "+vo.getRdate1());
		//System.out.println("마이페이지 DAO-rdate2 : "+vo.getRdate2());
		
		List<CombineVO> reviewList = sqlSession.selectList(mmm+"reviewList", vo);
		
		//System.out.println("마이페이지 DAO-reviewList : "+reviewList);
		//System.out.println("마이페이지 DAO-인덱스0 제품이름 : "+reviewList.get(0).getPname());
		return reviewList;
	}
	
}

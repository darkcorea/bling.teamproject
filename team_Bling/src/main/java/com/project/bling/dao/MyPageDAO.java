package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.vo.CombineVO;

@Repository
public class MyPageDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String mm = "com.project.bling.mapper.myPageMapper.";
	
	public CombineVO orderComp(CombineVO vo) throws Exception {
		return sqlSession.selectOne(mm+"orderComp",vo);
	}
	
	public CombineVO deliveryStat(CombineVO vo) throws Exception {
		return sqlSession.selectOne(mm+"deliveryStat",vo);
	}
	
	public List<CombineVO> recentOrder(CombineVO vo) throws Exception {
		return sqlSession.selectList(mm+"recentOrder", vo);
	}
	
	public void reviewWrite(CombineVO vo) throws Exception {
		sqlSession.insert(mm+"reviewWrite", vo);
	}
	
	public void reviewWrite1(CombineVO vo) throws Exception {
		sqlSession.insert(mm+"reviewWrite1", vo);
	}
	
	public void reviewWrite2(CombineVO vo) throws Exception {
		sqlSession.insert(mm+"reviewWrite2", vo);
	}
	
}

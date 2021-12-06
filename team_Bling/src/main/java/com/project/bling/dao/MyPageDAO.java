package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.vo.CombineVO;
import com.project.bling.vo.UserVO;

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
	
	//회원정보수정 첫번째 비밀번호 확인시 갖고오는 이름정보
	public UserVO confirm(int midx) throws Exception{
		return sqlSession.selectOne(mm+"confirm",midx);
	}
	
	//회원정보 수정
	public void remodify(UserVO uv) throws Exception{
		sqlSession.update(mm+"remodify",uv);
	}
}

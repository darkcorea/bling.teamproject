package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.domain.PageMaker;
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
	
	public List<CombineVO> recentOrder(PageMaker pm) throws Exception {
		return sqlSession.selectList(mm+"recentOrder", pm);
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
	
	public CombineVO reviewDetail(int ridx) throws Exception {
		return sqlSession.selectOne(mm+"reviewDetail", ridx);
	}
	
	public void reviewDelete(int ridx) throws Exception {
		System.out.println("마이페이지 DAO-delete - ridx : "+ridx);
		sqlSession.delete(mm+"reviewDelete", ridx);
	}
	
	// midx에 따른 리뷰 갯수
	public int orderCount(int midx) throws Exception {
		return sqlSession.selectOne(mm+"orderCount", midx);
	}
	
	
	//회원정보수정 첫번째 비밀번호 확인시 갖고오는 이름정보
	public UserVO confirm(int midx) throws Exception{
		return sqlSession.selectOne(mm+"confirm",midx);
	}
	
	//회원정보 수정
	public void remodify(UserVO uv) throws Exception{
		sqlSession.update(mm+"remodify",uv);
	}
	
	//비밀번호 수정
	public void modifypwd(UserVO uv) throws Exception{
		sqlSession.update(mm+"modifypwd",uv);
	}
	
	//탈퇴비번확인
	public String delconfirm(int midx) throws Exception{
		return sqlSession.selectOne(mm+"delconfirm",midx);
	}
	
	//탈퇴
	public void del(CombineVO vo)throws Exception{
		sqlSession.update(mm+"del",vo);
	}
	
}

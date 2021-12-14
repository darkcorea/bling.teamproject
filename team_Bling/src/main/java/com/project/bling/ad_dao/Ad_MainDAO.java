package com.project.bling.ad_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.vo.CombineVO;
import com.project.bling.vo.DeliveryVO;

@Repository
public class Ad_MainDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private String ps = "com.project.bling.mapper.adminmapper.ad_mainMapper.";
	
	//주문관리
	public DeliveryVO order() throws Exception{
		return sqlSession.selectOne(ps+"order");
	}
	
	//메인화면
	//문의답변
	//상품문의
	public int productq() throws Exception{
		return sqlSession.selectOne(ps+"productq");
	}
	//1:1문의
	public int privateq() throws Exception{
		return sqlSession.selectOne(ps+"privateq");
	}
	
	//버튼1번
	public List<CombineVO> recenttot() throws Exception{
		return sqlSession.selectList(ps+"recenttot");
	}
	public List<CombineVO> recentref() throws Exception{
		return sqlSession.selectList(ps+"recentref");
	}
	
	//버튼2번
	public List<CombineVO> ordertot() throws Exception{
		return sqlSession.selectList(ps+"ordertot");
	}
	public List<CombineVO> ordercount() throws Exception{
		return sqlSession.selectList(ps+"ordercount");
	}
	
	//버튼3번
	public List<CombineVO> visit() throws Exception{
		return sqlSession.selectList(ps+"visit");
	}
	public List<CombineVO> pageview() throws Exception{
		return sqlSession.selectList(ps+"pageview");
	}
	public List<CombineVO> attention() throws Exception{
		return sqlSession.selectList(ps+"attention");
	}
	
	//버튼4번
	public List<CombineVO> recentmem() throws Exception{
		return sqlSession.selectList(ps+"recentmem");
	}
	public List<CombineVO> newmem() throws Exception{
		return sqlSession.selectList(ps+"newmem");
	}
	public List<CombineVO> delmem() throws Exception{
		return sqlSession.selectList(ps+"delmem");
	}
	
	public void pagevisit() throws Exception{
		sqlSession.insert(ps+"visiter");
	}
}

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
	
	//문의답변
	//상품문의
	public int productq() throws Exception{
		return sqlSession.selectOne(ps+"productq");
	}
	//1:1문의
	public int privateq() throws Exception{
		return sqlSession.selectOne(ps+"privateq");
	}
	
	//기간별 매출현황
	//최근 일주일
	public int seventot() throws Exception{
		return sqlSession.selectOne(ps+"7tot");
	}
	//최근 15일
	public int fifteentot() throws Exception{
		return sqlSession.selectOne(ps+"15tot");
	}
	//최근 30일
	public int thirtytot() throws Exception{
		return sqlSession.selectOne(ps+"30tot");
	}
	//오늘 기준 7일간 데이터
	public int recenttot(int day) throws Exception{
		return sqlSession.selectOne(ps+"recenttot",day);
	}
	
	//환불
	//최근 일주일
	public int sevenref() throws Exception{
		return sqlSession.selectOne(ps+"7ref");
	}
	//최근 15일
	public int fifteenref() throws Exception{
		return sqlSession.selectOne(ps+"15ref");
	}
	//최근 30일
	public int thirtyref() throws Exception{
		return sqlSession.selectOne(ps+"30ref");
	}
	//오늘 기준 7일간 데이터
	public int recentref(int day) throws Exception{
		return sqlSession.selectOne(ps+"recentref",day);
	}
}

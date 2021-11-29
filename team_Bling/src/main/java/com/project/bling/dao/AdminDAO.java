package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.vo.AdminVO;
import com.project.bling.vo.ImageVO;
import com.project.bling.vo.OptionVO;
import com.project.bling.vo.ProductVO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String am = "com.project.bling.mapper.adminMapper.";
	
	// 제품 등록하기
		public void insert(ProductVO vo) throws Exception{
			sqlSession.insert(am+"productInsert", vo);
		}
	
	// 옵션 등록	
	public void insertOpt(OptionVO vo) throws Exception{
		sqlSession.insert(am+"optionInsert", vo);
	}
	
	// 제품 이미지 등록
	public void insertImg(ImageVO vo) throws Exception{
		sqlSession.insert(am+"imageInsert", vo);
		 
	}
	
	// 제품 정보 불러오기 
	public List<ProductVO> list() throws Exception{
		return sqlSession.selectList(am+"list");
	}
	
	//관리자 로그인 체크1
	public boolean adminCheck1(AdminVO vo) throws Exception{
		System.out.println("관리자 DAO에서 pwd1 : "+vo.getPwd1());
		System.out.println("관리자 DAO에서 id : "+vo.getId());
		
		String adminId1 = sqlSession.selectOne(am+"adminCheck1", vo);
		System.out.println("관리자 DAO에서 id1 : "+adminId1);
		return (adminId1 == null) ? false : true;
	}
	
	//관리자 로그인 체크2
	public boolean adminCheck2(AdminVO vo) throws Exception{
		String adminId2 = sqlSession.selectOne(am+"adminCheck2", vo);
		
		System.out.println("관리자 DAO에서 pwd2 : "+vo.getPwd2());
		System.out.println("관리자 DAO에서 adminId : "+adminId2);
		
		return (adminId2 == null) ? false : true ;
	}
		
	//관리자 정보
	public AdminVO adminInfo(AdminVO vo) throws Exception{
		
		return sqlSession.selectOne(am+"adminInfo", vo);
	}
	
}

package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
}

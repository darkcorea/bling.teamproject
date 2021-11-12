package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;

@Repository
public class CustomerDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String cm = "com.project.bling.mapper.customerMapper.";
	
	
	// 상품 pidx로 상품에 대한 문의 갯수 가져오기
		public int Product_Question_Count(int pidx) throws Exception{
			return sqlSession.selectOne(cm +"Prduct_Question_Count", pidx);
		}
		
		
		// 상품 pidx로 상품 문의 정보 페이징 가지고 오기
		public List<CombineVO> Product_Question(PageMaker pm) throws Exception{
			return sqlSession.selectList(cm +"Product_Question", pm);
		}
	
}

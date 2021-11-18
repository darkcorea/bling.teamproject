package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.Product_QuestionVO;

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
	
	// 비밀번호와 pqidx로 문의하기 내용 가지고 오기.
	public Product_QuestionVO product_pqidx(Product_QuestionVO pq) throws Exception{
		return sqlSession.selectOne(cm +"product_pqidx", pq);
	}
	
	// 상문문의하기 등록하기
	public void product_write(Product_QuestionVO pq) throws Exception{
		sqlSession.insert(cm +"product_write", pq);
	}
	
	// pqidx로  문의한 내용 가져오기, 수정하기 페이지에 뿌려주기
	public Product_QuestionVO product_question_one(int pqidx) throws Exception{
		return sqlSession.selectOne(cm +"product_question_one", pqidx);
	}
	
	// 상문문의 내역 수정하기
	public void product_modify(Product_QuestionVO pq) throws Exception{
	sqlSession.selectOne(cm +"product_modify", pq);
	}
}

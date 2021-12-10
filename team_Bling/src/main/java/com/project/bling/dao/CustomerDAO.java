package com.project.bling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.NoticeVO;
import com.project.bling.vo.Product_QuestionVO;
import com.project.bling.vo.QuestionVO;

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
	
	// midx와 pqidx로 상품문의 가져오기
	public List<Product_QuestionVO> show_check(Product_QuestionVO pq) throws Exception{
		return sqlSession.selectList(cm +"show_check", pq);
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
	
	// midx로 60일 동안 구매한 제품에 대한 정보 가져오기
	public List<CombineVO> product_select(int midx) throws Exception{
		return sqlSession.selectList(cm +"product_select", midx);
	}
	
	// detail_idx로 상품 이름, 옵션 이름 , detail_idx 값 가져오기
	public List<CombineVO> detail_idx_select(List<Integer> list) throws Exception{	
		return sqlSession.selectList(cm +"detail_idx_select", list);
	}
	
	// 문의 내역 저장하기
	public void question_write(QuestionVO qv) throws Exception{
	sqlSession.insert(cm +"question_write", qv);
	}
	
	// 고객센터에 사용하는 문의내역 총 갯수
	public int Question_Count(PageMaker pm) throws Exception {
		return sqlSession.selectOne(cm +"Question_Count", pm);
	}
	
	// 고객센터에 사용하는 페이징
	public List<NoticeVO> Question_page(PageMaker pm) throws Exception {
		return sqlSession.selectList(cm +"Question_page", pm);
	}
	
	public List<QuestionVO> question_list(int midx) throws Exception {
		return sqlSession.selectList(cm+"question_list",midx);
	}
	
	public QuestionVO myquestion_detail(int qidx) throws Exception {
		
		return sqlSession.selectOne(cm+"myquestion_detail",qidx);
	}
	public void myquestion_delete(int qidx) throws Exception {
		sqlSession.delete(cm+"myquestion_delete",qidx);
	}
	public List<QuestionVO> pruduct_question_list(int midx) throws Exception {
		return sqlSession.selectList(cm+"pruduct_question_list",midx);
	}
}

package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.CustomerDAO;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.NoticeVO;
import com.project.bling.vo.Product_QuestionVO;
import com.project.bling.vo.QuestionVO;


@Service("CustomerService")
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerDAO customerDAO;
	
	// 상품 pidx로 상품 문의 갯수 가져오기
	@Override
	public int Product_Question_Count(int pidx) throws Exception {
		return customerDAO.Product_Question_Count(pidx);
	}
		
	// 상품 pidx로 상품 문의 정보 페이징 가지고 오기
	@Override
	public List<CombineVO> Product_Question(PageMaker pm) throws Exception {
		return customerDAO.Product_Question(pm);
	}
	
	// midx와 pqidx로 상품문의 가져오기
	@Override
	public List<Product_QuestionVO> show_check(Product_QuestionVO pq) throws Exception {
		return customerDAO.show_check(pq);
	}
	
	// 상품문의하기 등록하기
	@Override
	public void product_write(Product_QuestionVO pq) throws Exception {
		customerDAO.product_write(pq);
	}

	// 상품문의 pqidx로 문의 내용 가져오기
	@Override
	public Product_QuestionVO product_question_one(int pqidx) throws Exception {
		return customerDAO.product_question_one(pqidx);
	}
	
	// 상품문의 내역 수정하기
	@Override
	public void product_modify(Product_QuestionVO pq) throws Exception {
		customerDAO.product_modify(pq);
		
	}

	// midx로 상품 문의에서 뿌려주는 구매한 상품 정보
	@Override
	public List<CombineVO> product_select(int midx) throws Exception {
		return customerDAO.product_select(midx);
	}
	
	// detail_idx로 상품 이름, 옵션 이름 , detail_idx 조회하기
	@Override
	public List<CombineVO> detail_idx_select(List<Integer> list) throws Exception {
		return customerDAO.detail_idx_select(list);
	}

	// 문의 내역 저장하기
	@Override
	public void question_write( QuestionVO qv) throws Exception {
		customerDAO.question_write(qv);
	}
	
	// 고객센테에서 사용하는 문의 내역 총 갯수
	@Override
	public int Question_Count( PageMaker pm) throws Exception {
		return customerDAO.Question_Count(pm);
	}

	// 고객센테에서 사용하는 페이징
	@Override
	public List<NoticeVO> Question_page(PageMaker pm) throws Exception {
		return customerDAO.Question_page(pm);
	}

	@Override
	public List<QuestionVO> question_list(int midx) throws Exception {
		
		return customerDAO.question_list(midx);
	}

	@Override
	public QuestionVO myquestion_detail(int qidx) throws Exception {
		
		return customerDAO.myquestion_detail(qidx);
	}

	@Override
	public void myquestion_delete(int qidx) throws Exception {
		customerDAO.myquestion_delete(qidx);
		
	}

	@Override
	public List<QuestionVO> pruduct_question_list(int midx) throws Exception {
		
		return customerDAO.pruduct_question_list(midx);
	}

	
	
}

package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.CustomerDAO;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.Product_QuestionVO;


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
	
	// 비밀번호와 pqidx로 문의하기 내용 가지고 오기.
	@Override
	public Product_QuestionVO product_pqidx(Product_QuestionVO pq) throws Exception {
		return customerDAO.product_pqidx(pq);
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
	
	
	
	
}

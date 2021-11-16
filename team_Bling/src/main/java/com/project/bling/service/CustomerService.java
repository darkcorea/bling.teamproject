package com.project.bling.service;

import java.util.List;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.Product_QuestionVO;

public interface CustomerService {
	
	int Product_Question_Count(int pidx) throws Exception;
	List<CombineVO> Product_Question(PageMaker pm) throws Exception;
	Product_QuestionVO product_pqidx(Product_QuestionVO pq) throws Exception;
	
}

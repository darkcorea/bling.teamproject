package com.project.bling.service;

import java.util.List;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.NoticeVO;
import com.project.bling.vo.Product_QuestionVO;
import com.project.bling.vo.QuestionVO;

public interface CustomerService {
	
	int Product_Question_Count(int pidx) throws Exception;
	List<CombineVO> Product_Question(PageMaker pm) throws Exception;
	Product_QuestionVO product_pqidx(Product_QuestionVO pq) throws Exception;
	void product_write(Product_QuestionVO pq) throws Exception;
	Product_QuestionVO product_question_one(int pqidx) throws Exception;
	void product_modify(Product_QuestionVO pq) throws Exception;
	List<CombineVO> product_select(int midx) throws Exception;
	List<CombineVO> detail_idx_select(List<Integer> list) throws Exception;
	void question_write( QuestionVO qv) throws Exception;
	int Question_Count( PageMaker pm) throws Exception;
	List<NoticeVO> Question_page(PageMaker pm) throws Exception;
}

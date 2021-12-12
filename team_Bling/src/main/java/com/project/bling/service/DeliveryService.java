package com.project.bling.service;

import java.util.List;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.QuestionVO;

public interface DeliveryService {
	
	int delivery_count(PageMaker pm) throws Exception;
	List<CombineVO> deivery_list(PageMaker pm) throws Exception;
	void confirm_fn(int order_idx) throws Exception ;
	List<CombineVO> order_list(int order_idx) throws Exception;
	int addmileage_check(int order_idx) throws Exception;
	void addmileage_user(CombineVO cv) throws Exception;
	void addmileage_zero(int order_idx) throws Exception;
	void return_delivery_question(QuestionVO qv) throws Exception;
	void return_delivery(CombineVO cv) throws Exception;
}

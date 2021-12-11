package com.project.bling.service;

import java.util.List;

import com.project.bling.vo.CombineVO;

public interface DeliveryService {

	List<CombineVO> deivery_list(int midx) throws Exception;
	void confirm_fn(int order_idx) throws Exception ;
	List<CombineVO> order_list(int order_idx) throws Exception;
	int addmileage_check(int order_idx) throws Exception;
	void addmileage_user(CombineVO cv) throws Exception;
	void addmileage_zero(int order_idx) throws Exception;
}

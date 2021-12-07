package com.project.bling.service;

import java.util.List;

import com.project.bling.vo.CombineVO;

public interface DeliveryService {

	List<CombineVO> deivery_list(int midx) throws Exception;
	void confirm_fn(int order_idx) throws Exception ;
}

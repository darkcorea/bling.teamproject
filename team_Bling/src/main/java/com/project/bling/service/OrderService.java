package com.project.bling.service;

import java.util.List;

import com.project.bling.vo.NonorderVO;
import com.project.bling.vo.OptionVO;
import com.project.bling.vo.OrderVO;
import com.project.bling.vo.UserVO;

public interface OrderService {
	void insert(NonorderVO vo) throws Exception;
	void detailInsert(NonorderVO vo) throws Exception;
	void memberinsert(OrderVO vo) throws Exception;
	void memberdetailInsert(OrderVO vo) throws Exception;
	void mileageupdate(OrderVO vo) throws Exception;
	List<OrderVO> addr_select(int midx) throws Exception;
	void stock_update(OptionVO vo) throws Exception;
	UserVO select_midx(int midx) throws Exception;
	void delivery_insert(OrderVO vo) throws Exception;
	void non_delivery_insert(NonorderVO vo) throws Exception;
}

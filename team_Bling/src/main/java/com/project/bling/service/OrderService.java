package com.project.bling.service;

import com.project.bling.vo.NonorderVO;

public interface OrderService {
	void insert(NonorderVO vo) throws Exception;
	void detailInsert(NonorderVO vo) throws Exception;
	
}

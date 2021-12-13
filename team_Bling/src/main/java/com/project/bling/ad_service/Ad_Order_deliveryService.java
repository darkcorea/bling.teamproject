package com.project.bling.ad_service;

import java.util.List;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;

public interface Ad_Order_deliveryService {

	public int orderCnt(PageMaker pm) throws Exception;
	public List<CombineVO> orderList(PageMaker pm) throws Exception;
	public void prodStat(CombineVO vo) throws Exception;
}

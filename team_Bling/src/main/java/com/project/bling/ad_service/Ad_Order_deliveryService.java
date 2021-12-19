package com.project.bling.ad_service;

import java.util.List;

import com.project.bling.domain.Criteria;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;

public interface Ad_Order_deliveryService {

	public int orderCnt(PageMaker pm) throws Exception;
	public List<CombineVO> orderList(PageMaker pm) throws Exception;
	public void prodStat(CombineVO vo) throws Exception;
	public void invoice(CombineVO vo) throws Exception;
	public int deliveryCnt(Criteria sc) throws Exception;
	public List<CombineVO> deliveryList(PageMaker pm) throws Exception;
	public int returnCnt(Criteria sc) throws Exception;
	public List<CombineVO> returnList(PageMaker pm) throws Exception;
}

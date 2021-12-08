package com.project.bling.ad_service;

import java.util.List;

import com.project.bling.vo.DeliveryVO;

public interface Ad_MainService {
	
	List<DeliveryVO> order()throws Exception;
}

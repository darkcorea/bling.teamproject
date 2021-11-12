package com.project.bling.service;

import java.util.List;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;

public interface CustomerService {
	
	int Product_Question_Count(int pidx) throws Exception;
	List<CombineVO> Product_Question(PageMaker pm) throws Exception;
	
}

package com.project.bling.service;

import java.util.List;

import com.project.bling.vo.CustomVO;

public interface CustomService {
	
	List<CustomVO> shape(int type) throws Exception;
	List<CustomVO> shapes(CustomVO co) throws Exception;
}

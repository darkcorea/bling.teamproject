package com.project.bling.service;

import java.util.List;

import com.project.bling.vo.ImageVO;
import com.project.bling.vo.OptionVO;
import com.project.bling.vo.ProductVO;

public interface AdminService {
	
	void insert(ProductVO vo) throws Exception;
	void insertOpt(OptionVO vo) throws Exception;
	void insertImg(ImageVO vo) throws Exception;
	List<ProductVO> list() throws Exception;

}

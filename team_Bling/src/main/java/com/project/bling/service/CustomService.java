package com.project.bling.service;

import java.util.List;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CustomVO;

public interface CustomService {
	
	List<CustomVO> shape(int type) throws Exception;
	List<CustomVO> shapes(CustomVO co) throws Exception;
	void insertdb(CustomVO co)throws Exception;
	//리스트개수
	int howmany() throws Exception;
	//리스트
	List<CustomVO> listajax(PageMaker pm) throws Exception;
	//삭제
	void dellist(int cuidx)throws Exception;
}

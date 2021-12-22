package com.project.bling.ad_service;

import java.util.List;

import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.CustomVO;
import com.project.bling.vo.ImageVO;
import com.project.bling.vo.OptionVO;
import com.project.bling.vo.ProductVO;

public interface Ad_RegistService {
	void insert(ProductVO vo) throws Exception;
	void insertOpt(OptionVO vo) throws Exception;
	void insertImg(ImageVO vo) throws Exception;
	List<CombineVO> list(PageMaker pm) throws Exception;
	int product_count(String kind) throws Exception;
	int product_count1(String kind) throws Exception;
	int sold_out_count() throws Exception;
	List<CombineVO> sold_out_list(PageMaker pm) throws Exception;
	List<OptionVO> oblist() throws Exception;
	ProductVO product(int pidx) throws Exception;
	void updatePro(ProductVO vo) throws Exception;
	List<OptionVO> oblist(int pidx) throws Exception;
	void updateOpt(OptionVO ov) throws Exception;
	void deleteOpt(int oidx) throws Exception;
	ImageVO image(int pidx) throws Exception;
	void deleteImg(CombineVO cv) throws Exception;
	void updateImg(ImageVO vo) throws Exception;
	
	
	// 커스텀
	int custom_list_count(PageMaker pm) throws Exception;
	List<CustomVO> custom_list(PageMaker pm) throws Exception;
	void custom_delete(int coidx) throws Exception;
	void customregist(CustomVO vo)throws Exception;
}

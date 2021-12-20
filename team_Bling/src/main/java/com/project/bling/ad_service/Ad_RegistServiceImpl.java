package com.project.bling.ad_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.ad_dao.Ad_RegistDAO;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;
import com.project.bling.vo.ImageVO;
import com.project.bling.vo.OptionVO;
import com.project.bling.vo.ProductVO;

@Service("Ad_RegistService")
public class Ad_RegistServiceImpl implements Ad_RegistService{
	
	@Autowired
	Ad_RegistDAO ad_registDAO;
	
	// 상품 총 갯수
	@Override
	public int product_count(String kind) throws Exception {
		return ad_registDAO.product_count(kind);
	}
	
	// 상품 총 갯수
	@Override
	public int product_count1(String kind) throws Exception {
		return ad_registDAO.product_count1(kind);
	}
	
	// 옵션이 20미만 제품
	@Override
	public int sold_out_count() throws Exception {
		return ad_registDAO.sold_out_count();
	}
	@Override
	public List<CombineVO> sold_out_list(PageMaker pm) throws Exception{
		return ad_registDAO.sold_out_list(pm);
	}
	
	// 제품 등록
	@Override
	public void insert(ProductVO vo) throws Exception {
		ad_registDAO.insert(vo);
	}
	
	// 옵션 등록
	@Override
	public void insertOpt(OptionVO vo) throws Exception {
		ad_registDAO.insertOpt(vo);
	}

	// 이미지 등록
	@Override
	public void insertImg(ImageVO vo) throws Exception {
		ad_registDAO.insertImg(vo);	
	}

	// 제품 불러오기
	@Override
	public List<CombineVO> list(PageMaker pm) throws Exception {
		return ad_registDAO.list(pm);
	}
	
	// 상품 옵션 불러오기
	@Override
	public List<OptionVO> oblist() throws Exception {
		return ad_registDAO.oblist();
	}
	
	// pidx로 제품 정보 불러오기
	@Override
	public ProductVO product(int pidx) throws Exception {
		return ad_registDAO.product(pidx);
	}
	
	// 제품 수정하기
	@Override
	public void updatePro(ProductVO vo) throws Exception {
		ad_registDAO.updatePro(vo);
	}

	// pidx로 옵션 정보 불러오기
	@Override
	public List<OptionVO> oblist(int pidx) throws Exception {
		return ad_registDAO.oblist(pidx);
	}
	
	// 제품 옵션 수정하기
	@Override
	public void updateOpt(OptionVO ov) throws Exception {
		ad_registDAO.updateOpt(ov);
	}
	
	// 제품 옵션 삭제하기
	@Override
	public void deleteOpt(int oidx) throws Exception {
		ad_registDAO.deleteOpt(oidx);
	}
	
	// pidx로 제품 이미지 가져오기
	@Override
	public ImageVO image(int pidx) throws Exception {
		return ad_registDAO.image(pidx);
	}
	
	// 제품 이미지 칼럼에 있는 파일명 지우기
	@Override
	public void deleteImg(CombineVO cv) throws Exception {
		ad_registDAO.deleteImg(cv);
	}
	
	// 제품 이미지 수정
	@Override
	public void updateImg(ImageVO vo) throws Exception {
		ad_registDAO.updateImg(vo);
	}

	
}

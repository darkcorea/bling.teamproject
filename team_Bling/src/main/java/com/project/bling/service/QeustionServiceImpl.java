package com.project.bling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.QeustionDAO;
import com.project.bling.domain.PageMaker;
import com.project.bling.vo.CombineVO;

@Service("QeustionService")
public class QeustionServiceImpl implements QeustionService {

	@Autowired
	QeustionDAO qeustionDAO;
	
	// 상품 pidx로 상품 문의 갯수 가져오기
	@Override
	public int Product_Question_Count(int pidx) throws Exception {
		return qeustionDAO.Product_Question_Count(pidx);
	}
	
	// 상품 pidx로 상품 문의 정보 페이징 가지고 오기
	@Override
	public List<CombineVO> Product_Question(PageMaker pm) throws Exception {
		return qeustionDAO.Product_Question(pm);
	}

	
	
	
	
}

package com.project.bling.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.dao.AdminDAO;
import com.project.bling.vo.AdminVO;
import com.project.bling.vo.ImageVO;
import com.project.bling.vo.OptionVO;
import com.project.bling.vo.ProductVO;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;

	@Override
	public void insert(ProductVO vo) throws Exception {
		adminDAO.insert(vo);
	}

	@Override
	public void insertOpt(OptionVO vo) throws Exception {
		adminDAO.insertOpt(vo);
		
	}

	@Override
	public void insertImg(ImageVO vo) throws Exception {
		adminDAO.insertImg(vo);
		
	}

	@Override
	public List<ProductVO> list() throws Exception {
		return adminDAO.list();
	}

	
	@Override
	public boolean adminCheck1(AdminVO vo) throws Exception {
		System.out.println("관리자 서비스에서 pwd1 : "+vo.getPwd1());
		
		boolean result1 = adminDAO.adminCheck1(vo);
		System.out.println("관리자 서비스 check1 : "+result1);
		if(result1 == true) {
			
		}
		
		return result1;
	}

	@Override
	public boolean adminCheck2(AdminVO vo, HttpSession session) throws Exception {
		System.out.println("관리자 서비스에서 pwd2 : "+vo.getPwd2());
		
		boolean result2 = adminDAO.adminCheck2(vo);
		
		System.out.println("관리자 서비스 check2 : "+result2);
		
		if(result2 == true) {
			AdminVO adminVO = adminInfo(vo);
			
			session.setAttribute("adminId", adminVO.getId());
		}
		System.out.println("관리자 서비스 세션 id : "+session.getAttribute("adminId"));
		
		return result2;
	}

	@Override
	public AdminVO adminInfo(AdminVO vo) throws Exception {
		
		return adminDAO.adminInfo(vo);
	}
	
	@Override
	public void logout(HttpSession session) {
		// 세션 변수 개별 삭제
		// session.removeAttribute("userId");
		//세션을 모두 초기화시킴
		session.invalidate();
	}
	
	
	
}

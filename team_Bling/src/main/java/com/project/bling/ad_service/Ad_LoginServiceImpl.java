package com.project.bling.ad_service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bling.ad_dao.Ad_LoginDAO;
import com.project.bling.vo.AdminVO;

@Service("Ad_LoginService")
public class Ad_LoginServiceImpl implements Ad_LoginService{
	
	@Autowired
	Ad_LoginDAO ad_loginDAO;
	
	@Override
	public boolean adminCheck1(AdminVO vo) throws Exception {
		System.out.println("관리자 서비스에서 pwd1 : "+vo.getPwd1());
		
		boolean result1 =  ad_loginDAO.adminCheck1(vo);
		System.out.println("관리자 서비스 check1 : "+result1);
		if(result1 == true) {
			
		}
		
		return result1;
	}

	@Override
	public boolean adminCheck2(AdminVO vo, HttpSession session) throws Exception {
		System.out.println("관리자 서비스에서 pwd2 : "+vo.getPwd2());
		
		boolean result2 = ad_loginDAO.adminCheck2(vo);
		
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
		
		return ad_loginDAO.adminInfo(vo);
	}
	
	@Override
	public void logout(HttpSession session) {
		// 세션 변수 개별 삭제
		// session.removeAttribute("userId");
		//세션을 모두 초기화시킴
		session.invalidate();
	}
}

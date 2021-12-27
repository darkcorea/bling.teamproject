package com.project.bling.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 세션객체 가져오기
		HttpSession session = request.getSession();
		// session에 관리자id가 null이면
		if(session.getAttribute("adminId") == null){
			response.sendRedirect(request.getContextPath()+"/"); //홈 화면으로 리다이렉트
			return false; // 요청 실행 X
		// null이 아니면
		} else {
			return true; // 요청 실행 O
		}
	}

	
}

package com.project.bling.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.project.bling.dao.LoginDAO;
import com.project.bling.vo.UserVO;

public class LoginKeepInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	LoginDAO loginDAO;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// 세션 객체 가져오기
		HttpSession session = request.getSession();
		
		// 쿠키를 꺼내온다.
        Cookie loginCookie = WebUtils.getCookie(request,"loginCookie");
        
        //쿠키가 존재하면
        if(loginCookie != null) {
            // loginCookie의 값을 꺼내오고 -> 즉, 저장해놓은 세션Id를 꺼내오고
            String sessionId = loginCookie.getValue();
            // 세션Id를 checkCookie에 전달해 이전에 로그인한적이 있는지 체크하는 메서드를 거쳐서
            // 유효시간이 > now() 인 즉 아직 유효시간이 지나지 않으면서 해당 sessionId 정보를 가지고 있는 사용자 정보를 반환한다.
            UserVO vo3 = loginDAO.checkCookie(sessionId);
            
            System.out.println("쿠키id존재 여부>>>>>>>>>>>>>>>>>>>>>>>"+vo3);
            
            // 현재 쿠키가 최신 이라면 자동로그인 처음에 함
            if(vo3 != null){
                // 세션을 생성시켜 준다.
                session.setAttribute("UserVO", vo3);
                //LoginInterceptor에서 기준을 세션에 "userId"가 존재하는지로 했으므로 추가해줘야한다.
                session.setAttribute("userId", vo3.getId());
                
            // 쿠키가 존재하는데 최신 쿠키가 아니라면
            }else if (vo3 == null){
            	// 쿠기 주소 입력
            	 loginCookie.setPath("/team_Bling/");
 	            // 쿠키는 없앨 때 유효시간을 0으로 설정해서 쿠키를 없앤다
 	            loginCookie.setMaxAge(0);
 	            // 쿠키 설정을 적용한다.
 	            response.addCookie(loginCookie);
            }
        }
        return true;
	}
	
}

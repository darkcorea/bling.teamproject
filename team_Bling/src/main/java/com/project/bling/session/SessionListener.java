package com.project.bling.session;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.project.bling.vo.UserVO;


public class SessionListener implements HttpSessionListener {

	private static final Map<String, HttpSession> sessions = new ConcurrentHashMap();

    //중복로그인 지우기
    public synchronized static String getSessionidCheck(String type, String compareId){
	String result = "";
	for( String key : sessions.keySet() ){
		HttpSession hs = sessions.get(key);
		UserVO vo = new UserVO();
		if(hs != null) {
			vo = (UserVO) hs.getAttribute(type);
			if(vo != null && vo.getId().toString().equals(compareId)) {
				result = key.toString();
			}
		}
	}
	removeSessionForDoubleLogin(result);
	return result;
    }
    
    private static void removeSessionForDoubleLogin(String userId){    	
        System.out.println("remove userId : " + userId);
        if(userId != null && userId.length() > 0){
            sessions.get(userId).invalidate();
            sessions.remove(userId);    		
        }
    }

    @Override
    public void sessionCreated(HttpSessionEvent hse) {
        System.out.println(hse);
        sessions.put(hse.getSession().getId(), hse.getSession());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent hse) {
        if(sessions.get(hse.getSession().getId()) != null){
            sessions.get(hse.getSession().getId()).invalidate();
            sessions.remove(hse.getSession().getId());	
        }
    }
}

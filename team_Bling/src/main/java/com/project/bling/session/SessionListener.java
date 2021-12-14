package com.project.bling.session;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.bling.dao.VisitCountDAO;
import com.project.bling.service.VisitCountService;
import com.project.bling.vo.UserVO;


public class SessionListener implements HttpSessionListener {
	
	/**
		여기서 Map<String,  Integer> map = new map<>() 이 아닌것에 의문을 가지는 분들도 계실것 같습니다.(저ㅠ....)
		Map 컬렉션은 인터페이스입니다. 인터페이스란 추상메소드들로만 구성되어있는 기본 설계도 입니다.
		이 인터페이스로는 객체를 생성할 수 없습니다. 그래서 Map 인터페이스를 구현한 구현 클래스를 이용하여 객체를 생성하여야 합니다.
		
		출처 : https://ratseno.tistory.com/64
	**/
	//					 Map<Key, Value>
	private static final Map<String, HttpSession> sessions = new ConcurrentHashMap();

    //중복로그인 지우기
	public synchronized static String getSessionidCheck(String type, String compareId){
		String result = "";
		//	Map 컬렉션에서 keySet() 메서드는 Map 컬렉션에 저장된 모든 key를 Set 컬렉션에 담아서 리턴한다.
		System.out.println("리스너에서 keySet>>>>>>>>>>>>>>>>"+sessions.keySet());
		System.out.println("리스너에서 values>>>>>>>>>>>>>>>>"+sessions.values());
		/*
			향상된 for문으로 ketSet()으로 생성된 배열에서 각각의 key 값만을 불러온다.
			for(변수 : 배열변수)
		 */
		for( String key : sessions.keySet() ){
			System.out.println("리스너에서 key>>>>>>>>>>>>"+key);
			//	주어진 key가 있는 value를 return한다.
			HttpSession session = sessions.get(key);
			System.out.println("리스너에서 해당 메소드 매개변수 type>>>>>>>>>>>>>>>>"+type);
			System.out.println("리스너에서 해당 메소드 매개변수 compareId>>>>>>>>>>>>>>>"+compareId);
			if(session != null &&  session.getAttribute(type) != null 
					&& session.getAttribute(type).equals(compareId) ){
				//key값을 String 형태로 변환하여 이를 변수 result에 담는다.
				result =  key.toString();
			}
		}
		System.out.println("리스너에서 key.toString()을 담은 result>>>>>>>>>>>>"+result);
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
	
	/*
	 * private static void removeSessionForDoubleLogin(String userId){
	 * System.out.println("remove userId : " + userId); if(userId != null &&
	 * userId.length() > 0){ sessions.get(userId).invalidate();
	 * sessions.remove(userId); } }
	 */

	@Autowired
    VisitCountService visitcountService;
	
	 //방문자수 카운트 포함
    @Override
    public void sessionCreated(HttpSessionEvent hse) {
        System.out.println("123456789!!!"+hse);
        sessions.put(hse.getSession().getId(), hse.getSession());
        
        //VisitCountDAO visitcountDAO = new VisitCountDAO();
        try {
        	//visitcountDAO.visiter();
			visitcountService.visiter();
		} catch (Exception e) {
			e.printStackTrace();
		}
        
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent hse) {
        if(sessions.get(hse.getSession().getId()) != null){
            sessions.get(hse.getSession().getId()).invalidate();
            sessions.remove(hse.getSession().getId());	
        }
    }
}

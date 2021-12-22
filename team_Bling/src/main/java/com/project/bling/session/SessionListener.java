package com.project.bling.session;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.project.bling.service.VisitCountService;
import com.project.bling.service.VisitCountServiceImpl;


public class SessionListener implements HttpSessionListener {
	
	/**
		여기서 Map<String,  Integer> map = new map<>() 이 아닌것에 의문을 가지는 분들도 계실것 같습니다.(저ㅠ....)
		Map 컬렉션은 인터페이스입니다. 인터페이스란 추상메소드들로만 구성되어있는 기본 설계도 입니다.
		이 인터페이스로는 객체를 생성할 수 없습니다. 그래서 Map 인터페이스를 구현한 구현 클래스를 이용하여 객체를 생성하여야 합니다.
		
		출처 : https://ratseno.tistory.com/64
	**/
	//					 Map<Key, Value>
	private static final Map<String, HttpSession> sessions = new ConcurrentHashMap<String, HttpSession>();

    //중복로그인 지우기
	public synchronized static String getSessionidCheck(String type, String compareId){
		String result = "";
		//	Map 컬렉션에서 keySet() 메서드는 Map 컬렉션에 저장된 모든 key를 Set 컬렉션에 담아서 리턴한다.
		//	즉, Map<Key, Value>에 저장된 모든 데이터에서 Key 값들만 추출하여 배열로 나타낸다. 
		System.out.println("리스너에서 keySet>>>>>>>>>>>>>>>>"+sessions.keySet());
		System.out.println("리스너에서 values>>>>>>>>>>>>>>>>"+sessions.values());
		/*
			향상된 for문으로 ketSet()으로 생성된 배열에서 각각의 key 값만을 불러온다.
			for(변수 : 배열변수)
		 */
		for( String key : sessions.keySet() ){
			System.out.println("리스너에서 key>>>>>>>>>>>>"+key);
			//	주어진 key가 있는 value를 return한다.
			//	즉, 추출한 Key 값에 해당하는 Value 값을 Map에서 get() 메소드를 사용하여 가져오고, 이 값이 세션값이므로 이를 세션 타입으로 저장한다.
			HttpSession session = sessions.get(key);
			System.out.println("리스너에서 해당 메소드 매개변수 type>>>>>>>>>>>>>>>>"+type);
			System.out.println("리스너에서 해당 메소드 매개변수 compareId>>>>>>>>>>>>>>>"+compareId);
			if(session != null &&  session.getAttribute(type) != null 
					&& session.getAttribute(type).equals(compareId) ){
				/*
					처음 로그인시에는 위의 if 조건 3개중에서 1번째 조건은 만족하지만, 2번째 조건은 null이므로 3번째 조건도 만족하지 않는다.
					왜냐하면 세션에 setAttribute()로 key,value를 등록하는것은 세션 리스너가 실행된 후에 실행되기 때문이다.
					LoginServiceImpl.java에 메소드 순서는 다음과 같다.
						SessionListener.getSessionidCheck("userId", vo.getId());
						session.setAttribute("userId", vo.getId());
					즉, 처음 로그인 했을때는 세션에 "userId"라는 key값으로 vo.getId() value값이 저장되어있지 않다.
					세션리스너가 실행된 후 세션에 "userId"라는 key로 vo.getId()가 저장된다.
					
					따라서 처음 로그인 시에는 세션리스너 실행시 위의 if절 조건에 2,3번째 조건이 일치하지 않으므로 그대로 result=""이다.
					-> removeSessionForDoubleLogin(result)가 실행되지 않는다.
					-> 세션리스너 종료 후 session.setAttribute("userId", vo.getId());가 실행되어 세션에 입력한 ID가 저장된다.
					2번째 로그인시 세션에 "userId"라는 key로 vo.getId()가 value로 이미 저장되어있으므로
					위의 if 조건절이 모두 만족하게 된다.
					-> removeSessionForDoubleLogin(result) 실행됨
					-> sessions라는 Map에 저장된 세션(value값)을 초기화하고 세션ID(key값)을 제거한다. 
					-> 먼저 저장된 세션이 제거되므로, 먼저 로그인한 브라우저의 계정이 로그아웃된다.
				*/
				//key값을 String 형태로 변환하여 이를 변수 result에 담는다.
				//세션ID가 result에 저장된다.
				result =  key.toString();
			}
		}
		System.out.println("리스너에서 key.toString()을 담은 result>>>>>>>>>>>>"+result);
		removeSessionForDoubleLogin(result);
		return result;
	}
	
	private static void removeSessionForDoubleLogin(String sessionId){    	
        System.out.println("remove sessionId : " + sessionId);
        if(sessionId != null && sessionId.length() > 0){
        	//sessions라는 Map에 sessionId라는 key로 저장된 value(세션 값)를 초기화(invalidate)한다.
            sessions.get(sessionId).invalidate();
            //sessions라는 Map에 저장된 sessionId라는 key를 제거한다 -> value값이 리턴된다.
            sessions.remove(sessionId);    		
        }
    }
	
	/*
	 * private static void removeSessionForDoubleLogin(String userId){
	 * System.out.println("remove userId : " + userId); if(userId != null &&
	 * userId.length() > 0){ sessions.get(userId).invalidate();
	 * sessions.remove(userId); } }
	 */

	
	 //방문자수 카운트 포함
    @Override
    public void sessionCreated(HttpSessionEvent hse) {
        System.out.println("123456789!!!"+hse);
        /*
         	세션은 해당 프로젝트를 실행하여 브라우저에서 홈화면에 들어가는 순간 생성된다.
      		세션생성시 필드에 선언한 sessions라는 Map에  세션ID(ex. DD961431AC2C639F989166A8CAB18744)와
      		세션값(ex. org.apache.catalina.session.StandardSessionFacade@29c40d61)이 각각 Key와 Value로 저장된다.
        */
        sessions.put(hse.getSession().getId(), hse.getSession());
        System.out.println("hse.getSession().getId() : "+hse.getSession().getId());
        System.out.println("hse.getSession() : "+hse.getSession());
        
        VisitCountService visitcountService = new VisitCountServiceImpl();
        System.out.println(visitcountService);
        
        SqlSession session = sqlSessionMethod(hse);       
        
        try {
			visitcountService.visiter(hse,session);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
    }
 
    @Override
    public void sessionDestroyed(HttpSessionEvent hse) {
    	//세션이 없어질 때 sessions라는 Map에 저장된 ID(Key값)에 해당하는 세션값(Value값)이 null이 아니면
    	//즉, Map에 저장된 값이 있으면 get()으로 세션값(Value값)을  가져와서 invalidate()로 세션을 초기화한다.
    	//그리고 저장된 ID(Key값)는 remove()로 삭제한다.
        if(sessions.get(hse.getSession().getId()) != null){
            sessions.get(hse.getSession().getId()).invalidate();
            sessions.remove(hse.getSession().getId());	
        }
    }
    
    
    public SqlSession sqlSessionMethod(HttpSessionEvent hse) {
    	
    	HttpSession session = hse.getSession();
        ApplicationContext ctx = 
              WebApplicationContextUtils.
                    getWebApplicationContext(session.getServletContext());
        SqlSession sqlSession = 
                    (SqlSession) ctx.getBean("sqlSession");
		System.out.println("sqlSession"+sqlSession);
		return sqlSession;
    }
    
    
    
    
    
    
    
    
}

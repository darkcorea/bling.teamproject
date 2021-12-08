package com.project.bling.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class PageMaker {
	
	//필요한 값 : totalCount, scri.getPage,displayPageNum
	private int totalCount;		//전체 데이터 갯수, 전체 테이터 갯수가 들어가야 모든 출력값이 나옴.
	private int startPage;		// 네비게이션 바의 시작 번호
	private int endPage;		// 네이게이션 바의 끝 번호
	private int displayPageNum =10;	//화면아래에 표현될 게시판 보드의 개수 (게시글들이 모여있는 게시판 보드)
	private int startPost;		// 가져올 페이지 시작 번호
	private int lastPost;		// 가져올 페이지 마지막 번호
	private boolean prev;		// 이전 버튼
	private boolean next;		// 다음 버튼
	private Criteria scri;			// 페이지와 화면에 표현될 게시글의 숫자 값이 담긴 클래스, 서치 할 떄도 사용가능
	// pidx 추가 매퍼 입력 할 때 이게 없으면 파라미터 타입이 2개가 됨
	private int pidx;
	private int midx;
	private String kind;
	private int start;
	private int end;
	private String type;
	
	
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getPidx() {
		return pidx;
	}
	public void setPidx(int pidx) {
		this.pidx = pidx;
	}
	public int getStartPost() {
		return startPost;
	}
	public void setStartPost(int startPost) {
		this.startPost = startPost;
	}
	public int getLastPost() {
		return lastPost;
	}
	public void setLastPost(int lastPost) {
		this.lastPost = lastPost;
	}
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public Criteria getScri() {
		return scri;
	}
	public void setScri(Criteria scri) {
		this.scri = scri;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	private void calcData() {
		// 시작 페이지 번호와 끝페이지 번호를 정의
		// 이전 버튼과 다음 버튼이 나올지 말지를 정의
		// 1 2 3 4 5 6 7 7 8 9 10
		
		//Math.ceil 함수는 반올림, double 형태의 변수를 넣어야 한다.
		// getPage, getPerPageNum()의 값은 15
		
		if (scri.getPage() == 0) scri.setPage(1);
		// 현재 페이지의 마지막 페이지 = 올림((게시판보드의 총 갯수/화면아래 표현되리 게시판보드의 갯수)*화면아래 표현될 게시판 보드의 갯수) : 마지막 페이지는 무조건 있어야 하므로
		endPage  = (int)(Math.ceil(scri.getPage()/(double)displayPageNum))*displayPageNum;
			
		// 현재 페이지의 시작 페이지 = (현재의 마지막 페이지 - 화면아래에 표현될 게시판 보드의 갯수) + 1 : 무조건 1페이지는 있어야 하므로
		startPage = (endPage - displayPageNum)+1;
	
		startPost = (int)(((scri.getPage()-1)*scri.getPerPageNum())+start);	// 가져오는 페이지 중에 시작하는 페이지 번호
		lastPost = (int)(scri.getPage()*scri.getPerPageNum());		// 가져오는 페이지 중에서 마지막 페이지 번호
		

		// 전체 게시글에 대한 마지막 페이지 = 올림(모든 게시판글의 숫자 / 게시판에 보현될 게시글의 갯수) : 마지막 페이지는 있어야 하므로
		int tempEndPage = (int) Math.ceil(totalCount/(double)scri.getPerPageNum());
		
		// 현재 페이지의 마지막 페이지가 전체 게시글에 대한 마지막 페이지보다 크다면
		// 두 페이지는 같다.  next를 표시하느냐 안하느냐를 결정하기 위해서 필요
		if (endPage > tempEndPage) {
			endPage  = tempEndPage;
		}
		// 이전 버튼 : 스타트 페이지가 1이면 false, 아니면 true
		// 페이지 번호가 1이 아니라면 전부다 표시하겠다
		prev = (startPage == 1 ? false : true);
		// 다음 버튼 : 마지막페이지번호와 15를 곱해서 전체 카운터 수와 크거나 같으면
		// false 그렇지 않으면 true
		// 토탈 페이지의 수를 넘어가면 표기하지 않겠다
		next = (endPage * scri.getPerPageNum() >= totalCount ? false : true);
		
		
	}
	public String encoding(String keyword) {
		String keyword2 = "";
		// 자바에 있는 URLEncoder.encode를 사용해서 인코딩
		try {
			if (keyword != null)
			keyword2 = URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return keyword2;
	}
	
}

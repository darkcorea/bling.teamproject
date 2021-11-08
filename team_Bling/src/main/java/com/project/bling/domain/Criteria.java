package com.project.bling.domain;

public class Criteria {

	private int page;
	// 게시판 화면에 표현될 게시글의 갯수 ,물건을 보여주는 매핑이 많은거 같아서 기본값을 9로 잡음
	private int perPageNum = 9;
	
	// 검색 기능 추가 서치랑 같이 넣어줌
	private String searchType;
	private String keyword;
	
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
	
	
}

package com.project.bling.domain;

public class Criteria {

	private int page;
	// 게시판 화면에 표현될 게시글의 갯수 ,물건을 보여주는 매핑이 많은거 같아서 기본값을 9로 잡음
	private int perPageNum = 9;
	
	// 검색 기능 추가 서치랑 같이 넣어줌
	private String searchType;
	private String keyword;
	private String kind;
	private int price;
	private int start_price;
	private int last_price;
	private String rdate1;
	private String rdate2;
	private String grade;
	

	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStart_price() {
		return start_price;
	}
	public void setStart_price(int start_price) {
		this.start_price = start_price;
	}
	public int getLast_price() {
		return last_price;
	}
	public void setLast_price(int last_price) {
		this.last_price = last_price;
	}
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
	public String getRdate1() {
		return rdate1;
	}
	public void setRdate1(String rdate1) {
		this.rdate1 = rdate1;
	}
	public String getRdate2() {
		return rdate2;
	}
	public void setRdate2(String rdate2) {
		this.rdate2 = rdate2;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	
	
}

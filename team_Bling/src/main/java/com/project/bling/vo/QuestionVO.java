package com.project.bling.vo;

public class QuestionVO {
	private int qidx;
	private int midx;
	private String category;
	private String title;
	private String content;
	private String rdate;
	private String state;
	private int originqidx;
	private int depth;
	private int detail_idx;
	private int rownum;
	private String oname;
	private String pname;
	private int pqidx;
	private int originpqidx;
	private String comments;
	
	
	
	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPqidx() {
		return pqidx;
	}

	public void setPqidx(int pqidx) {
		this.pqidx = pqidx;
	}

	public int getOriginpqidx() {
		return originpqidx;
	}

	public void setOriginpqidx(int originpqidx) {
		this.originpqidx = originpqidx;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getOriginqidx() {
		return originqidx;
	}

	public void setOriginqidx(int originqidx) {
		this.originqidx = originqidx;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getDetail_idx() {
		return detail_idx;
	}

	public void setDetail_idx(int detail_idx) {
		this.detail_idx = detail_idx;
	}

	public QuestionVO() {
		
	}
	
	public int getQidx() {
		return qidx;
	}
	public void setQidx(int qidx) {
		this.qidx = qidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
}

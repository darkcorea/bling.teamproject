package com.project.bling.vo;

public class Question_commentVO {
	private int qcom_idx;
	private int qidx;
	private String comments;
	private String rdate;
	
	public Question_commentVO() {
		
	}
	
	public int getQcom_idx() {
		return qcom_idx;
	}
	public void setQcom_idx(int qcom_idx) {
		this.qcom_idx = qcom_idx;
	}
	public int getQidx() {
		return qidx;
	}
	public void setQidx(int qidx) {
		this.qidx = qidx;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
}

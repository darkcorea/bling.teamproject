package com.project.bling.vo;

public class OrderVO {

	private int order_idx;
	private int midx;
	private String rdate;
	private int addr_idx;
	private int tot_price;
	private String order_yn;
	private String delivery_yn;
	
	
	public int getOrder_idx() {
		return order_idx;
	}
	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getAddr_idx() {
		return addr_idx;
	}
	public void setAddr_idx(int addr_idx) {
		this.addr_idx = addr_idx;
	}
	public int getTot_price() {
		return tot_price;
	}
	public void setTot_price(int tot_price) {
		this.tot_price = tot_price;
	}
	public String getOrder_yn() {
		return order_yn;
	}
	public void setOrder_yn(String order_yn) {
		this.order_yn = order_yn;
	}
	public String getDelivery_yn() {
		return delivery_yn;
	}
	public void setDelivery_yn(String delivery_yn) {
		this.delivery_yn = delivery_yn;
	}
	
}

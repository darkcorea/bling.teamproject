package com.project.bling.vo;

public class DeliveryVO {
	private int didx;
	private int invoice_num;
	private int order_idx;
	private String cancel;
	private String refund;
	private String exchanges;
	private String deli_com;
	private String deli_stat;
	private String send_day;
	private String order_yn;
	
	public DeliveryVO() {
		
	}
	
	public int getDidx() {
		return didx;
	}
	public void setDidx(int didx) {
		this.didx = didx;
	}
	public int getInvoice_num() {
		return invoice_num;
	}
	public void setInvoice_num(int invoice_num) {
		this.invoice_num = invoice_num;
	}
	public int getOrder_idx() {
		return order_idx;
	}
	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}
	public String getCancel() {
		return cancel;
	}
	public void setCancel(String cancel) {
		this.cancel = cancel;
	}
	public String getRefund() {
		return refund;
	}
	public void setRefund(String refund) {
		this.refund = refund;
	}
	public String getExchanges() {
		return exchanges;
	}
	public void setExchanges(String exchanges) {
		this.exchanges = exchanges;
	}
	public String getDeli_com() {
		return deli_com;
	}
	public void setDeli_com(String deli_com) {
		this.deli_com = deli_com;
	}
	public String getDeli_stat() {
		return deli_stat;
	}
	public void setDeli_stat(String deli_stat) {
		this.deli_stat = deli_stat;
	}
	public String getSend_day() {
		return send_day;
	}
	public void setSend_day(String send_day) {
		this.send_day = send_day;
	}

	public String getOrder_yn() {
		return order_yn;
	}

	public void setOrder_yn(String order_yn) {
		this.order_yn = order_yn;
	}
	
	
}

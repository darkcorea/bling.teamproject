package com.project.bling.vo;

public class CustomVO {
	
	//option
	private int coidx;
	private int kind;
	private int type;
	private int shape;
	private String name;
	private String customimg;
	private int price;
	//user
	private int cuidx;
	private int midx;
	private String sumcoidx;
	private int cntoption;
	//customimg, price를 option이랑 같이 씀
	
	public int getCoidx() {
		return coidx;
	}
	public void setCoidx(int coidx) {
		this.coidx = coidx;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getShape() {
		return shape;
	}
	public void setShape(int shape) {
		this.shape = shape;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCustomimg() {
		return customimg;
	}
	public void setCustomimg(String customimg) {
		this.customimg = customimg;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCuidx() {
		return cuidx;
	}
	public void setCuidx(int cuidx) {
		this.cuidx = cuidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getSumcoidx() {
		return sumcoidx;
	}
	public void setSumcoidx(String sumcoidx) {
		this.sumcoidx = sumcoidx;
	}
	public int getCntoption() {
		return cntoption;
	}
	public void setCntoption(int cntoption) {
		this.cntoption = cntoption;
	}
	
}

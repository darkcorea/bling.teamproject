package com.project.bling.vo;

public class CombineVO {

	// product
	private int pidx;		
	private String pname;
	private String kind;
	private String saleyn;
	private int price;
	private int discount;
	private int saleprice;
	// option
	private int oidx;
	private String oname;
	private int addprice;
	// review
	private int ridx;
	private int grade;
	private String contents;
	private String image1;
	private String image2;
	private int detail_idx;
	// image
	private String main;
	//user
	private String uname;
	// product_question
	private int pqidx;
	private int depth;
	private String title;
	private String comments;
	private String rdate;
	// delivery
	private String deli_stat;
	// order
	private int order_idx;
	private int midx;
	// like
	private int interest_idx;
	// 임의로 정한 
	private int reviewCount;
	private int quantitySum;
	private int quantity;
	private String rdate1;
	private String rdate2;
	private String path;
	// 임의(MyPageMapper)
	private int orderCompCnt;
	private int deliStatCnt;
	
	
	
	public int getInterest_idx() {
		return interest_idx;
	}
	public void setInterest_idx(int interest_idx) {
		this.interest_idx = interest_idx;
	}
	public String getSaleyn() {
		return saleyn;
	}
	public void setSaleyn(String saleyn) {
		this.saleyn = saleyn;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getPqidx() {
		return pqidx;
	}
	public void setPqidx(int pqidx) {
		this.pqidx = pqidx;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public int getPidx() {
		return pidx;
	}
	public void setPidx(int pidx) {
		this.pidx = pidx;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	public int getOrder_idx() {
		return order_idx;
	}
	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public int getAddprice() {
		return addprice;
	}
	public void setAddprice(int addprice) {
		this.addprice = addprice;
	}
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public int getDetail_idx() {
		return detail_idx;
	}
	public void setDetail_idx(int detail_idx) {
		this.detail_idx = detail_idx;
	}
	public String getMain() {
		return main;
	}
	public void setMain(String main) {
		this.main = main;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getDeli_stat() {
		return deli_stat;
	}
	public void setDeli_stat(String deli_stat) {
		this.deli_stat = deli_stat;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public int getQuantitySum() {
		return quantitySum;
	}
	public void setQuantitySum(int quantitySum) {
		this.quantitySum = quantitySum;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getOrderCompCnt() {
		return orderCompCnt;
	}
	public void setOrderCompCnt(int orderCompCnt) {
		this.orderCompCnt = orderCompCnt;
	}
	public int getDeliStatCnt() {
		return deliStatCnt;
	}
	public void setDeliStatCnt(int deliStatCnt) {
		this.deliStatCnt = deliStatCnt;
	}
	public int getOidx() {
		return oidx;
	}
	public void setOidx(int oidx) {
		this.oidx = oidx;
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
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
}

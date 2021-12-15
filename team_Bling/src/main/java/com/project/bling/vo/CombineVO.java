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
	private int mileage;
	// product_question
	private int pqidx;
	private int depth;
	private String title;
	private String comments;
	private String rdate;
	private String show_yn;
	// delivery
	private int didx;
	private String send_day;
	private String deli_com;
	private String deli_stat;
	private String cancel;
	private String refund;
	private String exchange;
	private String order_yn;
	private String invoice_num;
	private String confirm_yn;
	// order
	private int order_idx;
	private String orderid;
	private int midx;
	private int tot_price;
	private String delivery_yn;
	private String addr1;
	private String addr2;
	private String recipient;
	private String payment;
	private String zip_code;
	private String rphone;
	// like
	private int interest_idx;
	// 임의로 정한 
	private int reviewCount;
	private int quantitySum;
	private int quantity;
	private int count;
	private int	date_differ;
	private String path;
	// 임의(MyPageMapper)
	private int orderCompCnt;
	private int deliStatCnt;
	private String rdate1;
	private String rdate2;
	// 임의(관리자 주문)
	private String O_order_yn;
	private String D_order_yn;
	//방문자수, 페이지뷰, 관심상품수
	private int visit;
	private int pageview;
	private int attention;
	//탈퇴사유
	private String quitval;
	
	
	public String getQuitval() {
		return quitval;
	}
	public void setQuitval(String quitval) {
		this.quitval = quitval;
	}
	public int getVisit() {
		return visit;
	}
	public void setVisit(int visit) {
		this.visit = visit;
	}
	public int getPageview() {
		return pageview;
	}
	public void setPageview(int pageview) {
		this.pageview = pageview;
	}
	public int getAttention() {
		return attention;
	}
	public void setAttention(int attention) {
		this.attention = attention;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getRphone() {
		return rphone;
	}
	public void setRphone(String rphone) {
		this.rphone = rphone;
	}
	public String getShow_yn() {
		return show_yn;
	}
	public void setShow_yn(String show_yn) {
		this.show_yn = show_yn;
	}
	public int getDate_differ() {
		return date_differ;
	}
	public void setDate_differ(int date_differ) {
		this.date_differ = date_differ;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
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
	public String getExchange() {
		return exchange;
	}
	public void setExchange(String exchange) {
		this.exchange = exchange;
	}
	public String getOrder_yn() {
		return order_yn;
	}
	public void setOrder_yn(String order_yn) {
		this.order_yn = order_yn;
	}
	public String getInvoice_num() {
		return invoice_num;
	}
	public void setInvoice_num(String invoice_num) {
		this.invoice_num = invoice_num;
	}
	public String getConfirm_yn() {
		return confirm_yn;
	}
	public void setConfirm_yn(String confirm_yn) {
		this.confirm_yn = confirm_yn;
	}
	public int getTot_price() {
		return tot_price;
	}
	public void setTot_price(int tot_price) {
		this.tot_price = tot_price;
	}
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
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getDelivery_yn() {
		return delivery_yn;
	}
	public void setDelivery_yn(String delivery_yn) {
		this.delivery_yn = delivery_yn;
	}
	public String getO_order_yn() {
		return O_order_yn;
	}
	public void setO_order_yn(String o_order_yn) {
		O_order_yn = o_order_yn;
	}
	public String getD_order_yn() {
		return D_order_yn;
	}
	public void setD_order_yn(String d_order_yn) {
		D_order_yn = d_order_yn;
	}
	public int getDidx() {
		return didx;
	}
	public void setDidx(int didx) {
		this.didx = didx;
	}
	public String getSend_day() {
		return send_day;
	}
	public void setSend_day(String send_day) {
		this.send_day = send_day;
	}
	public String getDeli_com() {
		return deli_com;
	}
	public void setDeli_com(String deli_com) {
		this.deli_com = deli_com;
	}
	
}

package kr.co.ictedu.order;

public class OrderMainDTO {

	private String order_no;
	private String mno;
	private String card_no;
	private String addr_no;
	private String order_product_cnt;
	private String order_amt;
	private String discount_amt;
	private String pay_amt;
	private String order_date;
	private String order_status;

	private String str_basket_no;
	private String [] arr_basket_no;

	private String buy_now_prdt_no;
	private String buy_now_qty;

	@Override
	public String toString() {
		return order_no
				+ " : " +mno
				+ " : " +card_no
				+ " : " +addr_no
				+ " : " +order_product_cnt
				+ " : " +order_amt
				+ " : " +discount_amt
				+ " : " +pay_amt
				+ " : " +order_date
				+ " : " +order_status;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getCard_no() {
		return card_no;
	}
	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}
	public String getAddr_no() {
		return addr_no;
	}
	public void setAddr_no(String addr_no) {
		this.addr_no = addr_no;
	}
	public String getOrder_product_cnt() {
		return order_product_cnt;
	}
	public void setOrder_product_cnt(String order_product_cnt) {
		this.order_product_cnt = order_product_cnt;
	}
	public String getOrder_amt() {
		return order_amt;
	}
	public void setOrder_amt(String order_amt) {
		this.order_amt = order_amt;
	}
	public String getDiscount_amt() {
		return discount_amt;
	}
	public void setDiscount_amt(String discount_amt) {
		this.discount_amt = discount_amt;
	}
	public String getPay_amt() {
		return pay_amt;
	}
	public void setPay_amt(String pay_amt) {
		this.pay_amt = pay_amt;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getStr_basket_no() {
		return str_basket_no;
	}
	public void setStr_basket_no(String str_basket_no) {
		this.str_basket_no = str_basket_no;
	}
	public String[] getArr_basket_no() {
		return arr_basket_no;
	}
	public void setArr_basket_no(String[] arr_basket_no) {
		this.arr_basket_no = arr_basket_no;
	}
	public String getBuy_now_prdt_no() {
		return buy_now_prdt_no;
	}
	public void setBuy_now_prdt_no(String buy_now_prdt_no) {
		this.buy_now_prdt_no = buy_now_prdt_no;
	}
	public String getBuy_now_qty() {
		return buy_now_qty;
	}
	public void setBuy_now_qty(String buy_now_qty) {
		this.buy_now_qty = buy_now_qty;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

}//class

package com.pick.member.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberOrderShoppingVO")
public class MemberOrderShoppingVO {
	private int bno;
	private String order_num;
	private String member_id;
	private String goods_id;
	private String goods_title;
	private int goods_qty;
	private String original_price;
	private String retail_price;
	private String delivery_name;
	private String delivery_zipcode;
	private String delivery_addrbasic;
	private String delivery_addrdetail;
	private String delivery_phone1;
	private String delivery_phone2;
	private String delivery_phone3;
	private String delivery_msg;
	private Date orderDate;
	private String state;
	private String review;
	private Date cancelDate;
	private String fileName;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_title() {
		return goods_title;
	}
	public void setGoods_title(String goods_title) {
		this.goods_title = goods_title;
	}
	public int getGoods_qty() {
		return goods_qty;
	}
	public void setGoods_qty(int goods_qty) {
		this.goods_qty = goods_qty;
	}

	public String getOriginal_price() {
		return original_price;
	}
	public void setOriginal_price(String original_price) {
		this.original_price = original_price;
	}
	public String getRetail_price() {
		return retail_price;
	}
	public void setRetail_price(String retail_price) {
		this.retail_price = retail_price;
	}
	public String getDelivery_name() {
		return delivery_name;
	}
	public void setDelivery_name(String delivery_name) {
		this.delivery_name = delivery_name;
	}
	public String getDelivery_zipcode() {
		return delivery_zipcode;
	}
	public void setDelivery_zipcode(String delivery_zipcode) {
		this.delivery_zipcode = delivery_zipcode;
	}
	public String getDelivery_addrbasic() {
		return delivery_addrbasic;
	}
	public void setDelivery_addrbasic(String delivery_addrbasic) {
		this.delivery_addrbasic = delivery_addrbasic;
	}
	public String getDelivery_addrdetail() {
		return delivery_addrdetail;
	}
	public void setDelivery_addrdetail(String delivery_addrdetail) {
		this.delivery_addrdetail = delivery_addrdetail;
	}
	public String getDelivery_phone1() {
		return delivery_phone1;
	}
	public void setDelivery_phone1(String delivery_phone1) {
		this.delivery_phone1 = delivery_phone1;
	}
	public String getDelivery_phone2() {
		return delivery_phone2;
	}
	public void setDelivery_phone2(String delivery_phone2) {
		this.delivery_phone2 = delivery_phone2;
	}
	public String getDelivery_phone3() {
		return delivery_phone3;
	}
	public void setDelivery_phone3(String delivery_phone3) {
		this.delivery_phone3 = delivery_phone3;
	}
	public String getDelivery_msg() {
		return delivery_msg;
	}
	public void setDelivery_msg(String delivery_msg) {
		this.delivery_msg = delivery_msg;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public Date getCancelDate() {
		return cancelDate;
	}
	public void setCancelDate(Date cancelDate) {
		this.cancelDate = cancelDate;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
	
}

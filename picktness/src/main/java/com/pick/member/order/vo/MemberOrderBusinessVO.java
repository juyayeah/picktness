package com.pick.member.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component("memberOrderBusinessVO")
public class MemberOrderBusinessVO {
	private int bno;
	private String order_num;
	private String member_id;
	private String goods_id;
	private String goods_title;
	private String goods_option;
	private String original_price;
	private String retail_price;
	private String state;
	private Date orderDate;
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
	public String getGoods_option() {
		return goods_option;
	}
	public void setGoods_option(String goods_option) {
		this.goods_option = goods_option;
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
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
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

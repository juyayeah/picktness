package com.pick.member.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberOrderTotalVO")
public class MemberOrderTotalVO {
	private int order_num;
	private String member_id;
	private String total_price;
	private String sale_price;
	private String pay_price;
	private int use_point;
	private int add_point;
	private String credit_company;
	private String credit_installment;
	private Date orderDate;
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	public String getSale_price() {
		return sale_price;
	}
	public void setSale_price(String sale_price) {
		this.sale_price = sale_price;
	}
	public String getPay_price() {
		return pay_price;
	}
	public void setPay_price(String pay_price) {
		this.pay_price = pay_price;
	}
	public int getUse_point() {
		return use_point;
	}
	public void setUse_point(int use_point) {
		this.use_point = use_point;
	}
	public int getAdd_point() {
		return add_point;
	}
	public void setAdd_point(int add_point) {
		this.add_point = add_point;
	}
	public String getCredit_company() {
		return credit_company;
	}
	public void setCredit_company(String credit_company) {
		this.credit_company = credit_company;
	}
	public String getCredit_installment() {
		return credit_installment;
	}
	public void setCredit_installment(String credit_installment) {
		this.credit_installment = credit_installment;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	
}

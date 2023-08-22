package com.pick.member.cart.vo;

import org.springframework.stereotype.Component;

@Component("memberCartVO")
public class MemberCartVO {
	private int cart_id;
	private String member_idString;
	private String goods_id;
	private String option;
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getMember_idString() {
		return member_idString;
	}
	public void setMember_idString(String member_idString) {
		this.member_idString = member_idString;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	
}

package com.pick.goods.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("goodsReviewAnswerVO")
public class GoodsReviewAnswerVO {
	private int bno;
	private int p_bno;
	private Date reviewDate;
	private String answer_content;
	private String goods_id;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getP_bno() {
		return p_bno;
	}
	public void setP_bno(int p_bno) {
		this.p_bno = p_bno;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getAnswer_content() {
		return answer_content;
	}
	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	
	
	
}

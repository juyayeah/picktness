package com.pick.board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("comentVO")
public class CommentVO {

	private int bno;
	private int p_bno;
	private String content;
	private String member_id;
	private Date millrDate;
	
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getMillrDate() {
		return millrDate;
	}
	public void setMillrDate(Date millrDate) {
		this.millrDate = millrDate;
	}


}

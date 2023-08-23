package com.pick.board.vo;

import org.springframework.stereotype.Component;

@Component("boardVO")
public class BoardVO {
	private int bno;
	private String member_id;
	private String title;
	private String content;
	private String freeDate;
	private String hastag;
	private String millDate;
	private String todaymill_img;
	public String getHastag() {
		return hastag;
	}
	public void setHastag(String hastag) {
		this.hastag = hastag;
	}
	public String getMillDate() {
		return millDate;
	}
	public void setMillDate(String millDate) {
		this.millDate = millDate;
	}
	public String getTodaymill_img() {
		return todaymill_img;
	}
	public void setTodaymill_img(String todaymill_img) {
		this.todaymill_img = todaymill_img;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFreeDate() {
		return freeDate;
	}
	public void setFreeDate(String freeDate) {
		this.freeDate = freeDate;
	}
	
	
}
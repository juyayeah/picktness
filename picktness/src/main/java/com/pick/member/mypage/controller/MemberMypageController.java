package com.pick.member.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface MemberMypageController {
	public ModelAndView memberDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView orderList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView calcelList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView goodsAskList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView oneOnOneAskList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView boardList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView replyList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView pointList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}

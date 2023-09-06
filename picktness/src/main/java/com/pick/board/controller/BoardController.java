package com.pick.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface BoardController {

	public ModelAndView faqList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView millBoardForm(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView millDetail(int bno,HttpServletRequest request, HttpServletResponse response);

	ModelAndView getDelete(int bno,String todaymill_img, HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView noticeDetail(int bno,HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView freeDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView freeboardForm(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView addFreeBoard(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView freeboardList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView eventList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView eventDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView oneOnOneForm(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView millBoardList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	String form();

	ResponseEntity addMillBoard(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	ModelAndView millrInsert(String member_id, String content, int p_bno, HttpServletRequest request,HttpServletResponse response) throws Exception;

	ModelAndView updateMillBoardForm(int bno,HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView updateMillBoard(int bno, HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView noticeForm(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView faqForm(HttpServletRequest request, HttpServletResponse response) throws Exception;


}

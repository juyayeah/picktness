package com.pick.business.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface BusinessController {
	public ModelAndView placeCont(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView placeForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addGymDetail(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ModelAndView modGym(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView goodsAskCont(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView trainerCont(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView trainerForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView orderPayCont(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView orderPayList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView reviewCont(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView busiInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView withdraw(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView withdrawFixed(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView withdrawBye(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView settlement(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView settlementDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
}

	

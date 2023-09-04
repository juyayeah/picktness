package com.pick.admin.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface AdminMypageController {
	public ModelAndView adminProdList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView adminProdForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView adminProdMod(@RequestParam(value="goods_id") String goods_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView adminQnAList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView adminBusiList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView busiMemberInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView adminTrainerList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView trainerDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView adminDeliverList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView adminOrder(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView adminOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView adminReviewCont(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView memberCont(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView adsettlementDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}

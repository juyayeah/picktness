package com.pick.goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface GoodsController {
	public ModelAndView placeList(@RequestParam("cate") String cate, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView trainerList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchGoods(@RequestParam("search_content") String search_content, HttpServletRequest request, HttpServletResponse response) throws Exception;
}

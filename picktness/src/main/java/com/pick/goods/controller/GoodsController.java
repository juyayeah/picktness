package com.pick.goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface GoodsController {
	public ModelAndView placeList(HttpServletRequest request, HttpServletResponse response) throws Exception;
}

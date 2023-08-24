package com.pick.goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface GoodsController {
	public ModelAndView placeList(@RequestParam(value="section", defaultValue="1") int section, @RequestParam(value="pageNum", defaultValue="1") int pageNum, @RequestParam(value="cate", defaultValue="all") String cate, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView trainerList(@RequestParam(value="section", defaultValue="1") int section, @RequestParam(value="pageNum", defaultValue="1") int pageNum, @RequestParam(value="cate", defaultValue="all") String cate, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchGoods(@RequestParam("search_content") String search_content, HttpServletRequest request, HttpServletResponse response) throws Exception;
}

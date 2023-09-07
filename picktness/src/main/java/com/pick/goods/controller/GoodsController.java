package com.pick.goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface GoodsController {
	public ModelAndView placeList(@RequestParam(value="section", defaultValue="1") int section, @RequestParam(value="pageNum", defaultValue="1") int pageNum, @RequestParam(value="cate", defaultValue="all") String cate, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView trainerList(@RequestParam(value="section", defaultValue="1") int section, @RequestParam(value="pageNum", defaultValue="1") int pageNum, @RequestParam(value="cate", defaultValue="all") String cate, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchGoods(@RequestParam("search_content") String search_content, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView shoppingMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView shopFoodList(@RequestParam(value="section", defaultValue="1") int section, @RequestParam(value="pageNum", defaultValue="1") int pageNum, @RequestParam(value="cate", defaultValue="all") String cate,@RequestParam(value="orderBy", defaultValue="best") String orderBy,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView shopGoodsList(@RequestParam(value="section", defaultValue="1") int section, @RequestParam(value="pageNum", defaultValue="1") int pageNum, @RequestParam(value="cate", defaultValue="all") String cate,@RequestParam(value="orderBy", defaultValue="best") String orderBy,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView placeDetail(@RequestParam(value="goods_id") String goods_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView goodsDetail(@RequestParam("goods_id") String goods_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
}

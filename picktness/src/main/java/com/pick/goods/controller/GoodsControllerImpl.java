package com.pick.goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("goodsController")
public class GoodsControllerImpl implements GoodsController{

	@Override
	@RequestMapping(value="/goods/placeList.do", method=RequestMethod.GET)
	public ModelAndView placeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("membersLocation", "강원도 강릉시");
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/goods/trainerList.do", method=RequestMethod.GET)
	public ModelAndView trainerList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	//--------운동시설------------//
	@RequestMapping(value="/goods/gymDetail.do", method=RequestMethod.GET)
	private ModelAndView gymDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	//--------트레이너------------//
	@RequestMapping(value="/goods/trainerDetail.do", method=RequestMethod.GET)
	private ModelAndView trainerDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	//--------쇼핑------------//
	@RequestMapping(value="/goods/goodsDetail.do", method=RequestMethod.GET)
	private ModelAndView goodsDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/goods/searchGoods.do", method=RequestMethod.GET)
	public ModelAndView searchGoods(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}

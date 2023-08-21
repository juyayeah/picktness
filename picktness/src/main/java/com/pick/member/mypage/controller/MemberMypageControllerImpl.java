package com.pick.member.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pick.member.mypage.service.MemberMypageService;
import com.pick.member.mypage.vo.MemberMypagePointVO;
@Controller("memberMypageController")
public class MemberMypageControllerImpl implements MemberMypageController{
	HttpSession session;
	@Autowired
	MemberMypageService mypageService;

	@Override
	@RequestMapping(value="/member/mypage/memberDetail.do", method=RequestMethod.GET)
	public ModelAndView memberDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/member/mypage/orderList.do", method=RequestMethod.GET)
	public ModelAndView orderList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/member/mypage/cancelList.do", method=RequestMethod.GET)
	public ModelAndView calcelList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/member/mypage/goodsAskList.do", method=RequestMethod.GET)
	public ModelAndView goodsAskList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/member/mypage/oneOnOneAskList.do", method=RequestMethod.GET)
	public ModelAndView oneOnOneAskList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/member/mypage/boardList.do", method=RequestMethod.GET)
	public ModelAndView boardList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/member/mypage/replyList.do", method=RequestMethod.GET)
	public ModelAndView replyList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/member/mypage/reviewList.do", method=RequestMethod.GET)
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/member/mypage/pointList.do", method=RequestMethod.GET)
	public ModelAndView pointList(@RequestParam("option") String option, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		session.setAttribute("option", option);
		if(option.equals("all")) {
			List<MemberMypagePointVO> pointList =mypageService.allPointList(id);
			mav.addObject("pointList", pointList);
		} else if(option.equals("add")) {
			List<MemberMypagePointVO> pointList = mypageService.addPointList(id);
			mav.addObject("pointList", pointList);
		} else {
			List<MemberMypagePointVO> pointList = mypageService.usePointList(id);
			mav.addObject("pointList", pointList);
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	

}

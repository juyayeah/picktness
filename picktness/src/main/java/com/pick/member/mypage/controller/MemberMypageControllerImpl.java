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
import com.pick.member.order.vo.MemberOrderBusinessVO;
import com.pick.member.order.vo.MemberOrderShoppingVO;
import com.pick.member.order.vo.MemberOrderTotalVO;
import com.pick.member.vo.MemberVO;
@Controller("memberMypageController")
public class MemberMypageControllerImpl implements MemberMypageController{
	HttpSession session;
	@Autowired
	MemberMypageService mypageService;
	@Autowired
	MemberVO memberVO;
	@Override
	@RequestMapping(value="/member/mypage/memberDetail.do", method=RequestMethod.GET)
	public ModelAndView memberDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getId();
		ModelAndView mav = new ModelAndView();
		memberVO = mypageService.memberDetail(id);
		mav.setViewName(viewName);
		mav.addObject("member",memberVO);
		return mav;
	}


	@Override
	@RequestMapping(value="/member/mypage/orderList.do", method=RequestMethod.GET)
	public ModelAndView orderList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("member");
		String member_id = memberVO.getId();
		System.out.println("가나");
		List<MemberOrderTotalVO> orderTotalList = mypageService.orderTotalList(member_id);
		System.out.println("오나");
		List<MemberOrderBusinessVO> orderBusinessList = mypageService.orderBusinessList(member_id);
		List<MemberOrderBusinessVO> orderTrainerList = mypageService.orderTrainerList(member_id);
		List<MemberOrderShoppingVO> orderShoppingList = mypageService.orderShoppingList(member_id);
		mav.addObject("orderTotalList", orderTotalList);
		mav.addObject("orderBusinessList", orderBusinessList);
		mav.addObject("orderTrainerList", orderTrainerList);
		mav.addObject("orderShoppingList", orderShoppingList);
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
		MemberVO member = (MemberVO) session.getAttribute("member");
		String id = member.getId();
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
	
	
	@RequestMapping(value="/member/mypage/delAccount.do", method=RequestMethod.GET)
	public ModelAndView delAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
}

package com.pick.member.controller;



import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pick.member.service.MemberService;
import com.pick.member.vo.MemberVO;

@Controller("memberController")

public class MemberController{
	@Autowired
	MemberVO memberVO;
	@Autowired
	MemberService memberService;

	@RequestMapping(value="/member/loginForm.do", method=RequestMethod.GET)
	private ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/member/b_loginForm.do", method=RequestMethod.GET)
	private ModelAndView b_loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	private ModelAndView login(@RequestParam Map<String, String> loginMap,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session =request.getSession();
		memberVO = memberService.login(loginMap);
		if(memberVO != null) {
			if(memberVO.getId().equals("admin")) {
				session.setAttribute("isLogOn", true);
				session.setAttribute("member", memberVO);
				mav.setViewName("/main");
			} else {
				session.setAttribute("isLogOn", true);
				session.setAttribute("member", memberVO);
				mav.setViewName("/main");
			}
		} else {
			mav.setViewName("/member/loginForm");
		}
	return mav;
	}
	
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
		private ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			HttpSession session = request.getSession();
			session.removeAttribute("isLogOn");
			session.removeAttribute("member");
			mav.setViewName("/main");
			return mav;
		}
	
	
	@RequestMapping(value="/member/join.do", method=RequestMethod.GET)
	private ModelAndView join(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	@RequestMapping(value="/member/bJoin.do", method=RequestMethod.GET)
	private ModelAndView bJoin(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	
	@RequestMapping(value="/member/selectJoin.do", method=RequestMethod.GET)
	private ModelAndView selectJoin(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/member/joinSuccess.do", method=RequestMethod.GET)
	private ModelAndView joinSuccess(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
}

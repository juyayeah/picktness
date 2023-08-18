package com.pick.member.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

	@Controller("memberCartController")
		public class MemberCartControllerImpl implements MemberCartController{
		
		//--------장바구니------------//
		@RequestMapping(value="/member/cart/cartList.do", method=RequestMethod.GET)
		private ModelAndView cartList(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
	}

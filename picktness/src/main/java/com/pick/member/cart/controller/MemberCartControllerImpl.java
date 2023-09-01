package com.pick.member.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pick.member.cart.service.MemberCartService;
import com.pick.member.cart.vo.MemberCartVO;

	@Controller("memberCartController")
		public class MemberCartControllerImpl implements MemberCartController{
		@Autowired
		MemberCartService memberCartService;

		@Override
		@ResponseBody
		@RequestMapping(value="/member/cart/addCart.do", method = RequestMethod.POST,produces = "application/text; charset=utf8")
		public String addCart(MemberCartVO cartVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
			String data;
			boolean result = memberCartService.findCartGoods(cartVO);
			System.out.println(result);
			if(result == true) {
				data =  "existed";
			} else {
				memberCartService.addCart(cartVO);
				data = "add";
			}
			return data;
		}



		//--------장바구니------------//
		@RequestMapping(value="/member/cart/cartList.do", method=RequestMethod.GET)
		public ModelAndView cartList(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
	}

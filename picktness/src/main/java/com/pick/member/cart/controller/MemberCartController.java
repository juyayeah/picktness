package com.pick.member.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.pick.member.cart.vo.MemberCartVO;

public interface MemberCartController {
	public String addCart(MemberCartVO cartVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView cartList(HttpServletRequest request, HttpServletResponse response) throws Exception;
}

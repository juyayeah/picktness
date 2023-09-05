package com.pick.member.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pick.member.cart.vo.MemberCartVO;

public interface MemberCartController {
	public String addCart(MemberCartVO cartVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView cartList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String removeCartGoods(@RequestParam(value="cart_id") String cart_id) throws Exception;
	public String removeCartGoodsSelect(@RequestParam(value="id_list") String[] idList) throws Exception;
	public String updateCartGoods(@RequestParam(value="option") String option, @RequestParam(value="cart_id") String cart_id) throws Exception;
}

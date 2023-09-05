package com.pick.member.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface MemberOrderController {
	public String order_Cart(String[] idList, @RequestParam(value="original_price") String original_price, @RequestParam(value="sale_price") String sale_price, @RequestParam(value="total_price") String total_price, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView orderPay(HttpServletRequest request, HttpServletResponse ponse) throws Exception;
}

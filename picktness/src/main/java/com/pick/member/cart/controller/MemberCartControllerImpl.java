package com.pick.member.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pick.member.cart.service.MemberCartService;
import com.pick.member.cart.vo.MemberCartVO;
import com.pick.member.vo.MemberVO;

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
		@Override
		@RequestMapping(value="/member/cart/cartList.do", method=RequestMethod.GET)
		public ModelAndView cartList(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			HttpSession session=request.getSession();
			MemberVO member = (MemberVO) session.getAttribute("member");
			String member_id = member.getId();
			Map<String, List> cartMap = memberCartService.cartList(member_id);
			session.setAttribute("cartMap", cartMap);
			return mav;
		}

		@Override
		@ResponseBody
		@RequestMapping(value="/member/cart/removeCartGoods.do")
		public String removeCartGoods(String cart_id)
				throws Exception {
			memberCartService.removeCartGoods(cart_id);
			return "/member/cart/cartList.do";
		}


		@Override
		@ResponseBody
		@RequestMapping(value="/member/cart/removeCartGoodsSelect.do")
		public String removeCartGoodsSelect(String[] idList) throws Exception {
		     for(int i=0; i<idList.length; i++) {
		    	 memberCartService.removeCartGoods(idList[i]);
		     }
			return "/member/cart/cartList.do";
		}



		@Override
		@ResponseBody
		@RequestMapping(value="/member/cart/updateCartGoods.do")
		public String updateCartGoods(String option, String cart_id) throws Exception {
			Map<String, String> updateMap = new HashMap<String, String>();
			updateMap.put("option", option);
			updateMap.put("cart_id", cart_id);
			memberCartService.updateCartGoods(updateMap);
			return "/member/cart/cartList.do";
		}
		
		
		
		
		
		
	}

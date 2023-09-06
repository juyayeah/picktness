package com.pick.member.order.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pick.goods.vo.GoodsBusinessVO;
import com.pick.goods.vo.GoodsShoppingVO;
import com.pick.goods.vo.GoodsTrainerVO;
import com.pick.member.cart.vo.MemberCartVO;
import com.pick.member.mypage.vo.MemberMypagePointVO;
import com.pick.member.order.service.MemberOrderService;
import com.pick.member.order.vo.MemberOrderBusinessVO;
import com.pick.member.order.vo.MemberOrderShoppingVO;
import com.pick.member.order.vo.MemberOrderTotalVO;
import com.pick.member.service.MemberService;
import com.pick.member.vo.MemberVO;
@Controller("memberOrderController")
public class MemberOrderControllerimpl implements MemberOrderController{
	@Autowired
	MemberOrderBusinessVO memberOrderBusinessVO;
	@Autowired
	MemberOrderShoppingVO memberOrderShoppingVO;
	@Autowired
	MemberOrderService memberOrderService;
	@Autowired
	MemberMypagePointVO memberPointVO;
	@Autowired
	MemberService memberService;
	
	
	@Override
	@ResponseBody
	@RequestMapping(value="/member/order/order_cart.do")
	public String order_Cart(String[] idList, @RequestParam(value="original_price") String original_price, @RequestParam(value="sale_price") String sale_price, @RequestParam(value="total_price") String total_price, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("orderMap");
		session.removeAttribute("original_price");
		session.removeAttribute("sale_price");
		session.removeAttribute("total_price");
		Map cartMap = (Map) session.getAttribute("cartMap");
		List<MemberCartVO> myCartList = (List<MemberCartVO>) cartMap.get("myCartList");
		List<GoodsBusinessVO> businessList = (List<GoodsBusinessVO>) cartMap.get("businessList");
		List<GoodsTrainerVO> trainerList = (List<GoodsTrainerVO>) cartMap.get("trainerList");
		List<GoodsShoppingVO> shoppingList =(List<GoodsShoppingVO>) cartMap.get("shoppingList");
		
		List<MemberCartVO> orderCartList = new ArrayList<MemberCartVO>();
		List<GoodsBusinessVO> orderBusinessList = new ArrayList<GoodsBusinessVO>();
		List<GoodsTrainerVO> orderTrainerList = new ArrayList<GoodsTrainerVO>();
		List<GoodsShoppingVO> orderShoppingList = new ArrayList<GoodsShoppingVO>();
		for(int i=0; i<idList.length; i++) {
			for(MemberCartVO memberCartVO : myCartList) {
				if(Integer.parseInt(idList[i]) == (memberCartVO.getCart_id())) {
					orderCartList.add(memberCartVO);
				}
			}
		}
		
		for(MemberCartVO memberCartVO : orderCartList) {
			if(memberCartVO.getGoods_id().contains("pc")) {
				for(GoodsBusinessVO goodsBusinessVO : businessList) {
					if(memberCartVO.getGoods_id().equals(goodsBusinessVO.getGoods_id())) {
						orderBusinessList.add(goodsBusinessVO);
					}
				}
			} else if(memberCartVO.getGoods_id().contains("tr")) {
				for(GoodsTrainerVO goodsTrainerVO : trainerList) {
					if(memberCartVO.getGoods_id().equals(goodsTrainerVO.getGoods_id())) {
						orderTrainerList.add(goodsTrainerVO);
					}
				}
			} else if(memberCartVO.getGoods_id().contains("sh")) {
				for(GoodsShoppingVO goodsShoppingVO : shoppingList) {
					if(memberCartVO.getGoods_id().equals(goodsShoppingVO.getGoods_id())) {
						orderShoppingList.add(goodsShoppingVO);
					}
				}
			}
		}
		Map orderMap = new HashMap();
		orderMap.put("orderCartList", orderCartList);
		orderMap.put("orderBusinessList", orderBusinessList);
		orderMap.put("orderTrainerList", orderTrainerList);
		orderMap.put("orderShoppingList", orderShoppingList);
		session.setAttribute("orderMap", orderMap);
		session.setAttribute("original_price", original_price);
		session.setAttribute("sale_price", sale_price);
		session.setAttribute("total_price", total_price);
		return "/member/order/orderDetail.do";
	}
	
	@RequestMapping(value="/member/order/orderDetail.do", method=RequestMethod.GET)
	public ModelAndView orderDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/order/orderPay.do", method=RequestMethod.POST)
	public ModelAndView orderPay(HttpServletRequest request, HttpServletResponse ponse)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String member_id = memberVO.getId();
		Map orderMap = (Map) session.getAttribute("orderMap");
		List<MemberCartVO> orderCartList = (List<MemberCartVO>) orderMap.get("orderCartList");
		List<GoodsBusinessVO> orderBusinessList = (List<GoodsBusinessVO>) orderMap.get("orderBusinessList");
		List<GoodsTrainerVO> orderTrainerList = (List<GoodsTrainerVO>) orderMap.get("orderTrainerList");
		List<GoodsShoppingVO> orderShoppingList = (List<GoodsShoppingVO>) orderMap.get("orderShoppingList");
		
		List<MemberOrderBusinessVO> addOrderBusinessList = new ArrayList<MemberOrderBusinessVO>();
		List<MemberOrderShoppingVO> addOrderShoppingList = new ArrayList<MemberOrderShoppingVO>();

		MemberOrderTotalVO totalVO = new MemberOrderTotalVO();
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
		String formatedNow = now.format(formatter);
		int number = (int) (Math.random() * 8999) + 1000;
		String order_num = formatedNow +  Integer.toString(number);
		int use_point = Integer.parseInt(request.getParameter("use_point"));
		int add_point = Integer.parseInt(request.getParameter("add_point"));
		totalVO.setOrder_num(order_num);
		totalVO.setMember_id(member_id);
		totalVO.setTotal_price(request.getParameter("total_price"));
		totalVO.setSale_price(request.getParameter("sale_price"));
		totalVO.setPay_price(request.getParameter("pay_price"));
		totalVO.setUse_point(use_point);
		totalVO.setAdd_point(add_point);
		totalVO.setCredit_company(request.getParameter("credit_company"));
		totalVO.setCredit_installment(request.getParameter("credit_installment"));
		
		memberOrderService.addTotalOrder(totalVO);
		
		for(MemberCartVO memberCartVO : orderCartList) {
			if(memberCartVO.getGoods_id().contains("pc")) {
				for(GoodsBusinessVO businessVO : orderBusinessList) {
					if(memberCartVO.getGoods_id().equals(businessVO.getGoods_id())) {
						memberOrderBusinessVO.setMember_id(member_id);
						memberOrderBusinessVO.setOrder_num(order_num);
						memberOrderBusinessVO.setGoods_id(memberCartVO.getGoods_id());
						memberOrderBusinessVO.setGoods_title(businessVO.getB_name());
						String goods_option = memberCartVO.getGoods_option();
						memberOrderBusinessVO.setGoods_option(goods_option);
						switch(goods_option) {
						case "prod1retail" : memberOrderBusinessVO.setGoods_price(businessVO.getProd1retail());
							break;
						case "prod3retail" : memberOrderBusinessVO.setGoods_price(businessVO.getProd3retail());
							break;
						case "prod6retail" : memberOrderBusinessVO.setGoods_price(businessVO.getProd6retail());
							break;
						case "prod12retail" : memberOrderBusinessVO.setGoods_price(businessVO.getProd12retail());
							break;
						}
						addOrderBusinessList.add(memberOrderBusinessVO);
					}
				}
			} else if(memberCartVO.getGoods_id().contains("tr")) {
				
			} else if(memberCartVO.getGoods_id().contains("sh")) {
				
			}
		}
		
		if(addOrderBusinessList != null && addOrderBusinessList.size() != 0) {
			memberOrderService.addBusinessOrder(addOrderBusinessList);
		}
		if(addOrderShoppingList != null && addOrderShoppingList.size() != 0) {
			memberOrderService.addShoppingOrder(addOrderShoppingList);
		}
		memberPointVO.setMember_id(member_id);
		if(use_point != 0) {
			memberPointVO.setMember_point(use_point);
			memberPointVO.setState("사용");
			memberPointVO.setContent("구매 사용");
			memberOrderService.useOrderPoint(memberPointVO);
		}
		memberPointVO.setMember_point(add_point);
		memberPointVO.setState("적립");
		memberPointVO.setContent("구매 적립");
		memberOrderService.addOrderPoint(memberPointVO);
		memberVO = memberService.selectById(member_id);
		session.setAttribute("member", memberVO);
		
		mav.setViewName("redirect:/member/order/orderList.do");
		return mav;
	}

	@RequestMapping(value="/member/order/orderList.do", method=RequestMethod.GET)
	public ModelAndView orderList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	
}

package com.pick.admin.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pick.admin.goods.service.AdminGoodsService;
import com.pick.goods.vo.GoodsImageFileVO;
import com.pick.goods.vo.GoodsShoppingVO;

@Controller("adminMypageController")
public class AdminMypageControllerImpl implements AdminMypageController {
	@Autowired
	AdminGoodsService adminGoodsService;
	

	// --------상품관리------------//
	@RequestMapping(value = "/admin/mypage/adminProdList.do", method = RequestMethod.GET)
	public ModelAndView adminProdList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		List goodsList = adminGoodsService.goodsList();
		mav.addObject("goodsList", goodsList);
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/admin/mypage/adminProdForm.do", method = RequestMethod.GET)
	public ModelAndView adminProdForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/admin/mypage/adminProdMod.do", method = RequestMethod.GET)
	public ModelAndView adminProdMod(@RequestParam(value="goods_id") String goods_id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		GoodsShoppingVO goods = adminGoodsService.selectGoods(goods_id);
		List imageFileList = adminGoodsService.selectImage(goods_id);
		mav.addObject("goods",goods);
		mav.addObject("imageFileList", imageFileList);
		mav.setViewName(viewName);
		return mav;
	}

	// --------상품문의------------//
	@RequestMapping(value = "/admin/mypage/adminQnAList.do", method = RequestMethod.GET)
	public ModelAndView adminQnAList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// --------사업자 운동시설 관리------------//
	@RequestMapping(value = "/admin/mypage/adminBusiList.do", method = RequestMethod.GET)
	public ModelAndView adminBusiList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/admin/mypage/busiMemberInfo.do", method = RequestMethod.GET)
	public ModelAndView busiMemberInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// --------트레이너 관리------------//
	@RequestMapping(value = "/admin/mypage/adminTrainerList.do", method = RequestMethod.GET)
	public ModelAndView adminTrainerList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/admin/mypage/trainerDetail.do", method = RequestMethod.GET)
	public ModelAndView trainerDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// --------주문 결제 배송관리------------//

	@RequestMapping(value = "/admin/mypage/adminDeliverList.do", method = RequestMethod.GET)
	public ModelAndView adminDeliverList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/admin/mypage/adminOrder.do", method = RequestMethod.GET)
	public ModelAndView adminOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/admin/mypage/adminOrderList.do", method = RequestMethod.GET)
	public ModelAndView adminOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// --------리뷰관리------------//
	@RequestMapping(value = "/admin/mypage/adminReviewCont.do", method = RequestMethod.GET)
	public ModelAndView adminReviewCont(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// --------회원관리------------//
	@RequestMapping(value = "/admin/mypage/memberCont.do", method = RequestMethod.GET)
	public ModelAndView memberCont(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// --------정산내역------------//
	@RequestMapping(value = "/admin/mypage/adsettlementDetail.do", method = RequestMethod.GET)
	public ModelAndView adsettlementDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}


}

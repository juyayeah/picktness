package com.pick.admin.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

	@Controller("adminMypageController")
		public class AdminMypageControllerImpl {
		
		//--------상품관리------------//
		@RequestMapping(value="/admin/mypage/adminProdList.do", method=RequestMethod.GET)
		private ModelAndView adminProdList(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		@RequestMapping(value="/admin/mypage/adminProdForm.do", method=RequestMethod.GET)
		private ModelAndView adminProdForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		@RequestMapping(value="/admin/mypage/adminProdMod.do", method=RequestMethod.GET)
		private ModelAndView adminProdMod(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		//--------상품문의------------//
		@RequestMapping(value="/admin/mypage/adminQnAList.do", method=RequestMethod.GET)
		private ModelAndView adminQnAList(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
		//--------운동시설 관리------------//
		@RequestMapping(value="/admin/mypage/adminBusiList.do", method=RequestMethod.GET)
		private ModelAndView adminBusiList(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		@RequestMapping(value="/admin/mypage/busiMemberInfo.do", method=RequestMethod.GET)
		private ModelAndView busiMemberInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
		//--------트레이너 관리------------//
		@RequestMapping(value="/admin/mypage/adminTrainerList.do", method=RequestMethod.GET)
		private ModelAndView adminTrainerList(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
		//--------주문 결제 배송관리------------//

		@RequestMapping(value="/admin/mypage/adminDeliverList.do", method=RequestMethod.GET)
		private ModelAndView adminDeliverList(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		@RequestMapping(value="/admin/mypage/adminOrder.do", method=RequestMethod.GET)
		private ModelAndView adminOrder(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		@RequestMapping(value="/admin/mypage/adminOrderList.do", method=RequestMethod.GET)
		private ModelAndView adminOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		//--------리뷰관리------------//
		
		//--------사업자정보------------//
		
		//--------정산내역------------//
		
	}

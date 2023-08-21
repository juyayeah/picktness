package com.pick.business.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

	@Controller("BusinessMypageController")
		public class BusinessMypageControllerImpl {
		//운동시설관리//
		@RequestMapping(value="/business/mypage/gymCont.do", method=RequestMethod.GET)
		private ModelAndView gymCont(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		@RequestMapping(value="/business/mypage/addGym.do", method= {RequestMethod.GET,RequestMethod.POST})
		private ModelAndView addGym(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		@RequestMapping(value="/business/mypage/modGym.do", method=RequestMethod.GET)
		private ModelAndView modGym(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		//상품문의 관리//
			@RequestMapping(value="/business/mypage/goodsAskCont.do", method=RequestMethod.GET)
			private ModelAndView goodsAskCont(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			//트레이너 관리//
			@RequestMapping(value="/business/mypage/trainerCont.do", method=RequestMethod.GET)
			private ModelAndView trainerCont(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			//트레이너 등록//
			@RequestMapping(value="/business/mypage/trainerForm.do", method=RequestMethod.GET)
			private ModelAndView trainerForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			//주문결제 관리//
			@RequestMapping(value="/business/mypage/orderPayCont.do", method=RequestMethod.GET)
			private ModelAndView orderPayCont(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			//주문/결제 리스트//
			@RequestMapping(value="/business/mypage/orderPayList.do", method=RequestMethod.GET)
			private ModelAndView orderPayList(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			//리뷰 관리//
			@RequestMapping(value="/business/mypage/reviewCont.do", method=RequestMethod.GET)
			private ModelAndView reviewCont(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			//사업자정보//
			@RequestMapping(value="/business/mypage/busiInfo.do", method=RequestMethod.GET)
			private ModelAndView busiInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			@RequestMapping(value="/business/mypage/withdraw.do", method= {RequestMethod.GET, RequestMethod.POST})
			private ModelAndView withdraw(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			@RequestMapping(value="/business/mypage/withdrawFixed.do", method=RequestMethod.GET)
			private ModelAndView withdrawFixed(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			@RequestMapping(value="/business/mypage/withdrawBye.do", method=RequestMethod.GET)
			private ModelAndView withdrawBye(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			//정산내역//
			@RequestMapping(value="/business/mypage/settlementDetail.do", method=RequestMethod.GET)
			private ModelAndView settlementDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
	}

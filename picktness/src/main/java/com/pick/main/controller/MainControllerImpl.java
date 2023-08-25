package com.pick.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("mainController")
public class MainControllerImpl {
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		if(session.getAttribute("memLocation") == null) {
			session.setAttribute("lat", 36.3492640);
			session.setAttribute("lng", 127.3776557);
			session.setAttribute("memLocation", "대전 서구 대덕대로 182");
		}
		mav.setViewName(viewName);
		return mav;
	}
	@RequestMapping(value="/footer/privacy.do", method=RequestMethod.GET)
	private ModelAndView privacy(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	@RequestMapping(value="/footer/uselaw.do", method=RequestMethod.GET)
	private ModelAndView uselaw(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	@RequestMapping(value="/footer/service_location.do", method=RequestMethod.GET)
	private ModelAndView location_service(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

}

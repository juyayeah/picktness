package com.pick.main.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.pick.goods.service.GoodsService;
import com.pick.goods.vo.GoodsBusinessVO;
import com.pick.goods.vo.GoodsShoppingVO;
import com.pick.goods.vo.GoodsTrainerVO;

@Controller("mainController")
public class MainControllerImpl {
	@Autowired
	GoodsService goodsService;
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		Map<String, Object> option = new HashMap<>();
		double memLat = 0;
		double memLng = 0;
		HttpSession session = request.getSession();
		if(session.getAttribute("memLocation") == null) {
			session.setAttribute("lat", 36.3492640);
			session.setAttribute("lng", 127.3776557);
			session.setAttribute("memLocation", "대전 서구 대덕대로 182");
		}
		
		if(request.getParameter("lat") != null) {
			memLat = Double.parseDouble(request.getParameter("lat"));
			memLng = Double.parseDouble(request.getParameter("lng"));
			String memLocation = request.getParameter("memLocation");
			session.setAttribute("memLocation", memLocation);
			session.setAttribute("lat", memLat);
			session.setAttribute("lng", memLng);
		} else {
			memLat = (double) session.getAttribute("lat");
			memLng = (double) session.getAttribute("lng");	
		}
		option.put("lat", memLat);
		option.put("lng", memLng);
		option.put("cate", "헬스");
		option.put("limit", "limit 4");
		List<GoodsBusinessVO> businessList = goodsService.goodsBusinessCateList(option);
		mav.addObject("healthList", businessList);
		option.put("cate", "필라테스");
		businessList = goodsService.goodsBusinessCateList(option);
		mav.addObject("pilaList", businessList);
		option.remove("cate");
		List<GoodsTrainerVO> trainerList = goodsService.goodsTrainerAllList(option);
		mav.addObject("trainerList", trainerList);
		option.clear();
		option.put("orderBy", "review_star DESC");
		option.put("limit", "limit 4");
		option.put("where", "&& s.goods_qty != 0");
		List<GoodsShoppingVO> shoppingList = goodsService.goodsGoodsAllList(option);
		mav.addObject("goodsList", shoppingList);
		option.put("cate", "protain");
		shoppingList = goodsService.goodsFoodCateList(option);
		mav.addObject("foodList", shoppingList);
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

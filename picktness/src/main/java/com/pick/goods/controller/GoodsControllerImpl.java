package com.pick.goods.controller;

import java.math.BigDecimal;
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
import org.springframework.web.servlet.ModelAndView;

import com.pick.goods.service.GoodsService;
import com.pick.goods.vo.GoodsBusinessVO;
import com.pick.member.vo.MemberVO;

@Controller("goodsController")
public class GoodsControllerImpl implements GoodsController{
	@Autowired
	GoodsService goodsService;
	@Autowired
	HttpSession session;

	@Override
	@RequestMapping(value="/goods/placeList.do", method=RequestMethod.GET)
	public ModelAndView placeList(@RequestParam(value="section", defaultValue="1") int section, @RequestParam(value="pageNum", defaultValue="1") int pageNum,@RequestParam(value="cate", defaultValue="all") String cate, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> option = new HashMap<>();
		ModelAndView mav = new ModelAndView();
		List<GoodsBusinessVO> placeAllList = new ArrayList<>();
		List<GoodsBusinessVO> placeList = new ArrayList<>();
		String viewName = (String) request.getAttribute("viewName");
		double memLat = 0;
		double memLng = 0;
		session = request.getSession();
		session.setAttribute("cate", cate);
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
		if(cate.equals("all")) {
			placeAllList = goodsService.goodsBusinessAllList(option);
		} else if(cate.equals("allTime")){
			option.put("allTime", "Y");
			placeAllList = goodsService.goodsBusinessAllTimeList(option);
		}else {
			switch(cate) {
			case "health": cate="헬스";
			break;
			case "cross": cate="크로스핏";
			break;
			case "yoga": cate="요가";
			break;
			case "pila": cate="필라테스";
			break;
			case "boxing": cate="복싱";
			break;
			case "jiu": cate="주짓수";
			break;
			}
			option.put("cate", cate);
			placeAllList = goodsService.goodsBusinessCateList(option);
		}
		try {
			for(int i=(pageNum-1)*12; i<pageNum*12; i++) {
				placeList.add(placeAllList.get(i));
			}
		} catch(IndexOutOfBoundsException  e) {
			e.printStackTrace();
		}
		mav.addObject("section", section);
		mav.addObject("pageNum",pageNum);
		mav.addObject("totalGoods", placeAllList.size());
		mav.addObject("placeList", placeList);
		mav.setViewName(viewName);
		option.clear();
		return mav;
	}

	@Override
	@RequestMapping(value="/goods/trainerList.do", method=RequestMethod.GET)
	public ModelAndView trainerList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	//--------운동시설------------//
	@RequestMapping(value="/goods/gymDetail.do", method=RequestMethod.GET)
	private ModelAndView gymDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	//--------트레이너------------//
	@RequestMapping(value="/goods/trainerDetail.do", method=RequestMethod.GET)
	private ModelAndView trainerDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	//--------쇼핑------------//
	@RequestMapping(value="/goods/goodsDetail.do", method=RequestMethod.GET)
	private ModelAndView goodsDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	//검색
	@Override
	@RequestMapping(value="/goods/searchGoods.do", method=RequestMethod.GET)
	public ModelAndView searchGoods(@RequestParam("search_content") String search_content, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		request.setAttribute("search_content", search_content);
		String content = "%" + search_content + "%";
		Map<String, List> result = goodsService.searchGoods(content);
		mav.addObject("result", result);
		return mav;
	}

}

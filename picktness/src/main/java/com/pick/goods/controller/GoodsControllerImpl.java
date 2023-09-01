package com.pick.goods.controller;

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
import com.pick.goods.vo.GoodsImageFileVO;
import com.pick.goods.vo.GoodsShoppingVO;
import com.pick.goods.vo.GoodsTrainerVO;

@Controller("goodsController")
public class GoodsControllerImpl implements GoodsController{
	@Autowired
	GoodsService goodsService;
	@Autowired
	HttpSession session;

	@Override
	@RequestMapping(value="/goods/placeList.do", method=RequestMethod.GET)
	public ModelAndView placeList(@RequestParam(value="section", defaultValue="1") int section, @RequestParam(value="pageNum", defaultValue="1") int pageNum, @RequestParam(value="cate", defaultValue="all") String cate, HttpServletRequest request, HttpServletResponse response) throws Exception {
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
	public ModelAndView trainerList(@RequestParam(value="section", defaultValue="1") int section, @RequestParam(value="pageNum", defaultValue="1") int pageNum, @RequestParam(value="cate", defaultValue="all") String cate, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> option = new HashMap<>();
		ModelAndView mav = new ModelAndView();
		List<GoodsTrainerVO> trainerAllList = new ArrayList<>();
		List<GoodsTrainerVO> trainerList = new ArrayList<>();
		String viewName = (String) request.getAttribute("viewName");
		double memLat = 0;
		double memLng = 0;
		session = request.getSession();
		session.setAttribute("cate", cate);
		if(request.getParameter("lng") != null) {
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
			trainerAllList = goodsService.goodsTrainerAllList(option);
		} else {
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
			trainerAllList = goodsService.goodsTrainerCateList(option);
		}
		
		try {
			for(int i=(pageNum-1)*12; i<pageNum*12; i++) {
				trainerList.add(trainerAllList.get(i));
			}
		} catch(IndexOutOfBoundsException  e) {
			
		}
		mav.addObject("section", section);
		mav.addObject("pageNum",pageNum);
		mav.addObject("totalGoods", trainerAllList.size());
		mav.addObject("trainerList", trainerList);
		mav.setViewName(viewName);
		option.clear();
		return mav;
	}
	

	@Override
	@RequestMapping(value="/goods/shoppingMain.do", method=RequestMethod.GET)
	public ModelAndView shoppingMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		Map<String, Object> option = new HashMap<String, Object>();
		option.put("orderBy", "review_star DESC");
		option.put("limit", "limit 4");
		List<GoodsShoppingVO> goodsFoodList = goodsService.goodsFoodAllList(option);
		List<GoodsShoppingVO> goodsGoodsList = goodsService.goodsGoodsAllList(option);
		mav.addObject("foodList", goodsFoodList);
		mav.addObject("goodsList", goodsGoodsList);
		return mav;
	}



	@Override
	@RequestMapping(value="/goods/shopFoodList.do", method=RequestMethod.GET)
	public ModelAndView shopFoodList(@RequestParam(value="section", defaultValue="1") int section, @RequestParam(value="pageNum", defaultValue="1") int pageNum,String cate, String orderBy, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		Map<String, Object> option = new HashMap<String, Object>();
		List<GoodsShoppingVO> goodsFoodAllList = new ArrayList<>();
		List<GoodsShoppingVO> goodsFoodList = new ArrayList<>();
		session.setAttribute("cate", cate);
		session.setAttribute("orderBy", orderBy);
		switch(orderBy) {
		case "best" : orderBy = "review_star DESC";
		break;
		case "row" : orderBy = "priceretail ASC";
		}
		option.put("orderBy", orderBy);
		System.out.println(orderBy);
		if(cate.equals("all")) {
			goodsFoodAllList = goodsService.goodsFoodAllList(option);
		} else {
			option.put("cate", cate);
			goodsFoodAllList = goodsService.goodsFoodCateList(option);
		}
		
		
		try {
			for(int i=(pageNum-1)*12; i<pageNum*12; i++) {
				goodsFoodList.add(goodsFoodAllList.get(i));
				System.out.println(goodsFoodAllList.get(i).getGoods_title());
			}
		} catch(IndexOutOfBoundsException  e) {
			
		}
		mav.addObject("section", section);
		mav.addObject("pageNum",pageNum);
		mav.addObject("totalGoods", goodsFoodAllList.size());
		mav.addObject("foodList", goodsFoodList);
		mav.setViewName(viewName);
		option.clear();
		return mav;
	}

	
	
	
	
	@Override
	@RequestMapping(value="/goods/shopGoodsList.do", method=RequestMethod.GET)
	public ModelAndView shopGoodsList(int section, int pageNum, String cate, String orderBy, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		Map<String, Object> option = new HashMap<String, Object>();
		List<GoodsShoppingVO> goodsGoodsAllList = new ArrayList<>();
		List<GoodsShoppingVO> goodsGoodsList = new ArrayList<>();
		session.setAttribute("cate", cate);
		session.setAttribute("orderBy", orderBy);
		switch(orderBy) {
		case "best" : orderBy = "review_star DESC";
		break;
		case "row" : orderBy = "priceretail ASC";
		}
		option.put("orderBy", orderBy);
		System.out.println(orderBy);
		if(cate.equals("all")) {
			goodsGoodsAllList = goodsService.goodsGoodsAllList(option);
		} else {
			option.put("cate", cate);
			goodsGoodsAllList = goodsService.goodsGoodsCateList(option);
		}
		
		
		try {
			for(int i=(pageNum-1)*12; i<pageNum*12; i++) {
				goodsGoodsList.add(goodsGoodsAllList.get(i));
			}
		} catch(IndexOutOfBoundsException  e) {
			
		}
		mav.addObject("section", section);
		mav.addObject("pageNum",pageNum);
		mav.addObject("totalGoods", goodsGoodsAllList.size());
		mav.addObject("goodsList", goodsGoodsList);
		mav.setViewName(viewName);
		option.clear();
		return mav;
	}

	@Override
	@RequestMapping(value="/goods/placeDetail.do")
	public ModelAndView placeDetail(String goods_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		GoodsBusinessVO placeVO = goodsService.goodsBusinessDetail(goods_id);
		List<GoodsImageFileVO> placeImage = goodsService.goodsBusinessImage(goods_id);
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

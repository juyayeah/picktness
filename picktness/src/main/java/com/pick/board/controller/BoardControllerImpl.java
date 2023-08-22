package com.pick.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pick.board.service.BoardService;
import com.pick.board.vo.BoardVO;

@Controller("boardController")
public class BoardControllerImpl {
	private static final String TODAYMILL_IMAGE_REPO = "c:\\picktness\\todaymill_image";
	
	@Autowired
	BoardService boardService;
	@Autowired
	BoardVO boardVO;
	 
	
	@RequestMapping(value="/board/faqList.do")
	public ModelAndView faqList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	@RequestMapping(value="/board/millDetail.do")
	public ModelAndView millDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
}
	@RequestMapping(value="/board/millBoardInsert.do")
	public ModelAndView millBoardInsert(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
		
	}
	@RequestMapping(value="/board/addMillBoard.do",method =RequestMethod.POST)
	public ModelAndView addMillBoard(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
		
	}
	@RequestMapping(value="/board/millList.do")
	public ModelAndView millList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
}
	@RequestMapping(value="/board/noticeDetail.do")
	public ModelAndView noticeDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
}
	@RequestMapping(value="/board/noticeList.do")
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/board/freeBoardInsert.do")
	public ModelAndView freeboardInsert(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	@RequestMapping(value="/board/addFreeBoard.do", method =RequestMethod.POST)
	public ModelAndView addFreeBoard(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	@RequestMapping(value="/board/freeBoardList.do")
	public ModelAndView freeboardList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		List freeBoardList=boardService.listFreeBoards();
		mav.setViewName(viewName);
		mav.addObject("freeBoardList",freeBoardList);
		return mav;
	}
	@RequestMapping(value="/board/eventList.do")
	public ModelAndView eventList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/board/eventDetail.do")
	public ModelAndView eventDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/board/oneOnOneForm.do")
	public ModelAndView oneOnOneForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

}

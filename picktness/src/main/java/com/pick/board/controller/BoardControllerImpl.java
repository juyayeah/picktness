package com.pick.board.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pick.board.service.BoardServiceImpl;
import com.pick.board.vo.BoardVO;
import com.pick.board.vo.CommentVO;
import com.pick.member.vo.MemberVO;

@Controller("boardController")
public class BoardControllerImpl {
	private static final String TODAYMILL_IMAGE_REPO = "c:\\picktness\\todaymill_image";

	@Autowired
	BoardServiceImpl boardService;
	@Autowired
	BoardVO boardVO;
	@Autowired
	HttpSession session;

	@RequestMapping(value="/board/faqList.do")
	public ModelAndView faqList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
 }
		/* 
		 * @RequestMapping(value="/board/millDetail.do") public ModelAndView
		 * millDetail(HttpServletRequest request, HttpServletResponse response) throws
		 * Exception{ ModelAndView mav = new ModelAndView(); String viewName = (String)
		 * request.getAttribute("viewName"); mav.setViewName(viewName); return mav;
		 
}*/
	@RequestMapping(value = "/board/millDetail.do")
	public ModelAndView millDetail(@RequestParam("bno") int bno, HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		BoardVO millDetail = boardService.getMillByBno(bno); 

	    ModelAndView modelAndView = new ModelAndView();
	    modelAndView.setViewName(viewName); // millDetail.jsp와 같이 실제 상세 페이지의 뷰 이름으로 설정
	    
	    modelAndView.addObject("millDetail", millDetail);

	    return modelAndView;
	}

	@RequestMapping(value = "/board/millBoardForm.do")
	public ModelAndView millBoardForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;

	}

	@RequestMapping(value = "/board/noticeDetail.do")
	public ModelAndView noticeDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/board/noticeList.do")
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	@RequestMapping(value = "/board/freeDetail.do")
	public ModelAndView freeDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}


	@RequestMapping(value = "/board/freeBoardForm.do")
	public ModelAndView freeboardForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/board/addFreeBoard.do", method = RequestMethod.POST)
	public ModelAndView addFreeBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/board/freeBoardList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView freeboardList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		List freeBoardList = boardService.listFreeBoards();
		mav.setViewName(viewName);
		mav.addObject("freeBoardList", freeBoardList);
		return mav;
	}

	@RequestMapping(value = "/board/eventList.do")
	public ModelAndView eventList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/board/eventDetail.do")
	public ModelAndView eventDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/board/oneOnOneForm.do")
	public ModelAndView oneOnOneForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/board/millBoardList.do")
	public ModelAndView millBoardList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		List millList = boardService.millBoardList();
		mav.setViewName(viewName);
		mav.addObject("millList", millList);
		return mav;
	}

    

	@RequestMapping(value = "/form")
	public String form() {
		return "miiBoardForm";
	}

	@RequestMapping(value = "board/addMillBoard.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addMillBoard(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {

		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> boardMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			boardMap.put(name, value);
		}
		String todaymill_img = upload(multipartRequest);
		session = multipartRequest.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String member_id = member.getId();


		boardMap.put("member_id", member_id);
		boardMap.put("todaymill_img", todaymill_img);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int bno = boardService.addNewMillBoard(boardMap);

			if (todaymill_img != null && todaymill_img.length() != 0) {
				File srcFile = new File(TODAYMILL_IMAGE_REPO + "\\" + "temp" + "\\" + todaymill_img);
				File destDir = new File(TODAYMILL_IMAGE_REPO + "\\" + bno);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);

			}
			message = "<script>";
			message += " alert('게시글을 추가했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/millBoardList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(TODAYMILL_IMAGE_REPO + "\\" + "temp" + "\\" + todaymill_img);
			srcFile.delete();

			message = "<script>";
			message += " alert('추가 중 오류가 발생했습니다.'); ";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/millBoardForm.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();

		}
		return resEnt;
	}

	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String image = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();

		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			image = mFile.getOriginalFilename();
			File file = new File(TODAYMILL_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
			if (mFile.getSize() != 0) {// File Null Check
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(TODAYMILL_IMAGE_REPO + "\\" + "temp" + "\\" + image));
				}
			}
		}
		return image;
	}
	/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
	@RequestMapping(value = "board/addComment", method = RequestMethod.POST)
    public String addComment(CommentVO comment) throws Exception{
        boardService.addComment(comment);
        return "redirect:/board/view?bno=" + comment.getBno();
    }
    


}

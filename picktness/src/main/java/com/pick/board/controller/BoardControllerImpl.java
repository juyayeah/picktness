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
import com.pick.board.vo.FaqVO;
import com.pick.board.vo.NoticeVO;
import com.pick.member.vo.MemberVO;

@Controller("boardController")
public class BoardControllerImpl implements BoardController {
	private static final String TODAYMILL_IMAGE_REPO = "c:\\picktness\\todaymill_image";

	@Autowired
	BoardServiceImpl boardService;
	@Autowired
	BoardVO boardVO;
	@Autowired
	CommentVO commentVO;
	@Autowired
	NoticeVO noticeVO;
	@Autowired
	FaqVO faqVO;
	@Autowired
	HttpSession session;

	@Override
	@RequestMapping(value = "/board/faqList.do")
	@ResponseBody
	public ModelAndView faqList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		List<FaqVO> faqList =boardService.selectFaqList();
		mav.addObject("faqList",faqList);
		mav.setViewName(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value = "/board/faqForm.do")
	public ModelAndView faqForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;

	}
	@RequestMapping(value = "/board/addFaq.do", method = RequestMethod.POST)
	public ModelAndView addFaq(FaqVO faqVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		boardService.insertFaq(faqVO);

		mav.setViewName("redirect:/board/faqList.do");
		return mav;
	}
	@RequestMapping(value = "/board/modFaq.do",method = RequestMethod.POST)
	public ModelAndView modFaq(FaqVO faqVO, @RequestParam("bno") int bno,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		boardService.updateFaq(faqVO);
		
		mav.setViewName("redirect:/board/faqList.do");
		return mav;

	}
	  @RequestMapping(value = "/board/modFaqForm.do")
	  public ModelAndView modFaqForm(@RequestParam("bno") int bno,HttpServletRequest request,HttpServletResponse response) throws Exception {
	  ModelAndView mav = new ModelAndView();
	  String viewName = (String) request.getAttribute("viewName");
	  System.out.println(bno);
	  FaqVO faqList = boardService.selectFaqList(bno);
	  mav.addObject("faqList",faqList); 
	  mav.setViewName(viewName);
	  return mav;
	  
	  }
		@RequestMapping(value = "/board/deleteFaq.do", method = RequestMethod.GET)
		public ModelAndView deleteFaq(@RequestParam("bno") int bno, HttpServletRequest request,
				HttpServletResponse response) {
			ModelAndView mav = new ModelAndView();
			System.out.println("서비스 들어가기전" + bno);
			boardService.deleteFaq(bno);
			System.out.println(bno);
			System.out.println("service after");
			mav.setViewName("redirect:/board/faqList.do");

			return mav;
		}

	@Override
	@RequestMapping(value = "/board/removeMillBoard.do", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getDelete(@RequestParam("bno") int bno, @RequestParam("todaymill_img") String todaymill_img, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(bno);
		ModelAndView mav = new ModelAndView();
		boardService.delete(bno);
		boardService.deleteComment(bno);
		mav.setViewName("redirect:/board/millBoardList.do");
		File oldFile = new File(TODAYMILL_IMAGE_REPO + "\\" + bno + "\\" + todaymill_img);
		oldFile.delete();
		File oldFolder = new File(TODAYMILL_IMAGE_REPO + "\\" + bno );
		oldFolder.delete();
		return mav;

	}

	
	  @RequestMapping(value="/board/removeMillrBoard.do", method=RequestMethod.GET)
	  
	  @ResponseBody public ModelAndView replyDelete(@RequestParam("bno") int
	  bno,HttpServletRequest request, HttpServletResponse response)throws
	  Exception{ ModelAndView mav = new ModelAndView(); String viewName = (String)
	  request.getAttribute("viewName"); boardService.deleteComment(bno);
	  mav.addObject("bno", bno); mav.setViewName(viewName);
	  mav.setViewName("redirect:/board/millDetail.do?bno="+bno); return mav; }
	 
	@Override
	@RequestMapping(value = "/board/updateMillBoardForm.do", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView updateMillBoardForm(@RequestParam("bno") int bno, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		boardVO = boardService.selectMillBoard(bno);
		mav.addObject("board", boardVO);
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/board/updateMillBoard.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity updateMillBoard(@RequestParam("bno") int bno, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {

		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> boardMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			boardMap.put(name, value);
		}

		String todaymill_img = upload(multipartRequest);
		BoardVO boardVO = (BoardVO) session.getAttribute("board");
		MemberVO member = (MemberVO) session.getAttribute("member");
		String member_id = member.getId();
		boardMap.put("member_id", member_id);
		boardMap.put("todaymill_img", todaymill_img);
		boardMap.put("bno", bno);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html; charset=utf-8");
		try {
			boardService.modMillBoard(boardMap);

			System.out.println(todaymill_img);
			System.out.println("서비스 다녀왓니!!?");

			if (todaymill_img != null && todaymill_img.length() != 0) {

				String originalFilename = (String) boardMap.get("originalFileName");
				File oldFile = new File(TODAYMILL_IMAGE_REPO + "\\" + bno + "\\" + originalFilename);
				oldFile.delete();

				File srcFile = new File(TODAYMILL_IMAGE_REPO + "\\" + "temp" + "\\" + todaymill_img);
				File destDir = new File(TODAYMILL_IMAGE_REPO + "\\" + bno);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);

			}
			message = "<script>";
			message += " alert('글을 수정했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/millBoardList.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(TODAYMILL_IMAGE_REPO + "\\" + "temp" + "\\" + todaymill_img);
			srcFile.delete();
			message = "<script>";
			message += " alert('수정 중 오류가 발생했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/millBoardList.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	@Override
	@RequestMapping(value = "/board/millDetail.do")
	public ModelAndView millDetail(@RequestParam("bno") int bno, HttpServletRequest request,
			HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		BoardVO millDetail = boardService.getMillByBno(bno);
		List<CommentVO> commentList = boardService.getComments(bno);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(viewName); // millDetail.jsp와 같이 실제 상세 페이지의 뷰 이름으로 설정
		modelAndView.addObject("commentList", commentList);
		modelAndView.addObject("millDetail", millDetail);
		System.out.println(commentList);
		return modelAndView;
	}

	@Override
	@RequestMapping(value = "/board/millBoardForm.do")
	public ModelAndView millBoardForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;

	}

	@Override
	@RequestMapping(value = "/board/noticeForm.do")
	public ModelAndView noticeForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;

	}

	
	  @RequestMapping(value = "/board/modNoticeForm.do") public ModelAndView
	  modNoticeForm(@RequestParam("bno") int bno,HttpServletRequest request,
	  HttpServletResponse response) throws Exception { ModelAndView mav = new
	  ModelAndView(); String viewName = (String) request.getAttribute("viewName");
	  NoticeVO noticeList = boardService.selectNoticeList(bno);
	  mav.addObject("noticeList",noticeList); mav.setViewName(viewName); return
	  mav;
	  
	  }
	 
	@RequestMapping(value = "/board/modNotice.do",method = RequestMethod.POST)
	public ModelAndView modNotice(NoticeVO noticeVO, @RequestParam("bno") int bno,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		boardService.updateNotice(noticeVO);
		mav.setViewName("redirect:/board/noticeList.do");
		return mav;

	}
	
	

	@Override
	@RequestMapping(value = "/board/noticeDetail.do")
	public ModelAndView noticeDetail(@RequestParam("bno") int bno, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		NoticeVO noticeList = boardService.selectNoticeList(bno);
		System.out.println(bno);
		mav.addObject("noticeList", noticeList);
		System.out.println(noticeList);
		mav.setViewName(viewName);
		return mav;
	}
	

	@Override
	@RequestMapping(value = "/board/noticeList.do")
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		List<NoticeVO> noticeList = boardService.noticeList();
		mav.addObject("noticeList", noticeList);
		mav.setViewName(viewName);
		System.out.println(noticeList);
		return mav;

	}

	
	  @RequestMapping(value = "/board/deleteNotice.do", method = RequestMethod.GET)
	  public ModelAndView deleteNotice(@RequestParam("bno") int bno,
	  HttpServletRequest request, HttpServletResponse response) { ModelAndView mav
	  = new ModelAndView(); System.out.println("서비스 들어가기전" + bno);
	  boardService.deleteNotice(bno); System.out.println(bno);
	  System.out.println("service after");
	  mav.setViewName("redirect:/board/noticeList.do");
	  
	  return mav; }
	 
	@ResponseBody
	@RequestMapping(value = "/board/delNotice.do", method = RequestMethod.POST)
	public String deleteNotice(String[] bnoList) {
		ModelAndView mav = new ModelAndView();
		for(int i=0; i<bnoList.length; i++) {
			boardService.delNotice(bnoList[i]);
		}
		String result = "/board/noticeList.do";

		return result;
	}

	@RequestMapping(value = "/board/addNotice.do", method = RequestMethod.POST)
	public ModelAndView addNotice(NoticeVO noticeVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		boardService.insertNotice(noticeVO);

		mav.setViewName("redirect:/board/noticeList.do");
		return mav;
	}



	/*
	 * @RequestMapping(value = "/board/removeNoticeArray.do") public String
	 * ajaxTest(HttpServletRequest request) throws Exception { ModelAndView mav =
	 * new ModelAndView(); String[] ajaxMsg =
	 * request.getParameterValues("valueArr"); int size = ajaxMsg.length; for(int
	 * i=0; i<size; i++) { boardService.deletenotice(ajaxMsg[i]);
	 * 
	 * } return "redirect:/board/noticeList.do";
	 * 
	 * }
	 */

	@Override
	@RequestMapping(value = "/board/freeDetail.do")
	public ModelAndView freeDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/board/freeBoardForm.do")
	public ModelAndView freeboardForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/board/freeBoardList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView freeboardList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		List freeBoardList = boardService.listFreeBoards();
		mav.setViewName(viewName);
		mav.addObject("freeBoardList", freeBoardList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/board/eventList.do")
	public ModelAndView eventList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/board/eventDetail.do")
	public ModelAndView eventDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/board/oneOnOneForm.do")
	public ModelAndView oneOnOneForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/board/millBoardList.do")
	public ModelAndView millBoardList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		List<BoardVO> millList = boardService.millBoardList();
		mav.setViewName(viewName);
		mav.addObject("millList", millList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/form")
	public String form() {
		return "millBoardForm";
	}

	@Override
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

	@RequestMapping(value = "board/addReply.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView millrInsert(@RequestParam("member_id") String member_id,
			@RequestParam("content") String content, @RequestParam("p_bno") int p_bno, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(member_id);
		ModelAndView mav = new ModelAndView();
		commentVO.setP_bno(p_bno);
		commentVO.setContent(content);
		commentVO.setMember_id(member_id);
		boardService.millrInsert(commentVO);
		mav.addObject("bno", p_bno);
		mav.setViewName("redirect:/board/millDetail.do?bno=" + p_bno);

		return mav;

	}

	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String todaymill_img = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();

		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			todaymill_img = mFile.getOriginalFilename();
			File file = new File(TODAYMILL_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
			if (mFile.getSize() != 0) {// File Null Check
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(TODAYMILL_IMAGE_REPO + "\\" + "temp" + "\\" + todaymill_img));
				}
			}
		}
		return todaymill_img;
	}
	/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */

	@Override
	public ModelAndView updateMillBoard(int bno, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView addFreeBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



}

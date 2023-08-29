package com.pick.member.controller;



import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pick.member.service.MemberService;
import com.pick.member.vo.MemberVO;

@Controller("memberController")

public class MemberControllerImpl implements MemberController{
	@Autowired
	MemberVO memberVO;
	@Autowired
	MemberService memberService;
	
	

	@RequestMapping(value="/member/loginForm.do", method=RequestMethod.GET)
	private ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	private String login(@RequestParam Map<String, String> loginMap,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session =request.getSession();
		System.out.println("로그인 메소드 진입");
		String uri = (String) session.getAttribute("uri");
		session.removeAttribute("uri");
		memberVO = memberService.login(loginMap);
		if(memberVO != null) {
			if(memberVO.getId().equals("admin")) {
				session.setAttribute("isLogOn", true);
				session.setAttribute("member", memberVO);
			} else {
				String memLocation = memberVO.getAddrBasic();
				Double memLat = memberVO.getLat();
				Double memLng = memberVO.getLng();
				session.setAttribute("isLogOn", true);
				session.setAttribute("member", memberVO);		
				session.setAttribute("memLocation", memLocation);
				session.setAttribute("lat", memLat);
				session.setAttribute("lng", memLng);
			}
			if(uri != null) {
				return "redirect:" + uri;
			} else {
				return "redirect:/main.do";
			}
		}
	return "redirect:/member/loginForm.do";
	}
	
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
		private ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			HttpSession session = request.getSession();
			session.removeAttribute("isLogOn");
			session.removeAttribute("member");
			session.setAttribute("lat", 36.3492640);
			session.setAttribute("lng", 127.3776557);
			session.setAttribute("memLocation", "대전 서구 대덕대로 182");
			mav.setViewName("/main");
			return mav;
		}
	
	
	@RequestMapping(value="/member/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) throws Exception{
		int cnt = memberService.idCheck(id);
		return cnt;
	}
	
	
	@RequestMapping(value="/member/join.do", method=RequestMethod.GET)
	private ModelAndView join(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	@RequestMapping(value="/member/bJoin.do", method=RequestMethod.GET)
	private ModelAndView bJoin(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	
	@RequestMapping(value="/member/selectJoin.do", method=RequestMethod.GET)
	private ModelAndView selectJoin(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	
	
	@Override
	@RequestMapping(value="/member/addMember.do" , method = RequestMethod.POST)
	public ResponseEntity addMember(MemberVO member,
			 @RequestParam(name = "emailConsent", required = false) boolean emailConsentChecked,
			 @RequestParam(name = "phoneConsent", required = false) boolean phoneConsentChecked,
		        HttpServletRequest request, HttpServletResponse response)
	        throws Exception {
		System.out.println("회원가입 메소드 진입");
	    response.setContentType("text/html; charset=UTF-8");
	    request.setCharacterEncoding("utf-8");
	    String message = null;
	    ResponseEntity resEntity = null;
	    HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    try {
	    	 member.setEmailConsent(emailConsentChecked ? "Y" : "N");
	         member.setPhoneConsent(phoneConsentChecked ? "Y" : "N");
	    	
	        // member 객체의 정보를 그대로 사용
	        memberService.addMember(member);
	       
	        message  = "<script>";
	        message += " location.href='"+request.getContextPath()+"/member/joinSuccess.do';";
	        message += " </script>";
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	    resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
	    return resEntity;
	}

	@RequestMapping(value="/member/joinSuccess.do", method=RequestMethod.GET)
	private ModelAndView joinSuccess(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value="/member/findById.do", method=RequestMethod.GET)
	private ModelAndView findById(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value="/member/findByPwd.do", method=RequestMethod.GET)
	private ModelAndView findByPwd(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

}





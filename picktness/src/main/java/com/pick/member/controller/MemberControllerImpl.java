package com.pick.member.controller;



import java.util.HashMap;
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
import com.pick.member.vo.BusinessVO;
import com.pick.member.vo.MemberVO;

@Controller("memberController")

public class MemberControllerImpl implements MemberController{
	@Autowired
	MemberVO memberVO;
	@Autowired
	BusinessVO businessVO;
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
	private ModelAndView login(@RequestParam Map<String, String> loginMap,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session =request.getSession();
		String uri = (String) session.getAttribute("uri");
		session.removeAttribute("uri");
		if(loginMap.get("userType").equals("member")) {
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
					mav.setViewName("redirect:" + uri);
				} else {
					mav.setViewName("redirect:/main.do");
				}
			} else {
				mav.addObject("message", "아이디나 비밀번호가 틀렸습니다. 다시 로그인 해주세요");
				mav.setViewName("/member/loginForm");
			}
		} else {
			System.out.println("사업자 로그인");
			businessVO = memberService.loginBusiness(loginMap);
			if(businessVO != null) {
				System.out.println("사업자 로그인 성공");
				session.setAttribute("isLogOn", true);
				session.setAttribute("business", businessVO);
				mav.setViewName("redirect:/main.do");
			} else {
				mav.addObject("message", "아이디나 비밀번호가 틀렸습니다. 다시 로그인 해주세요");
				mav.addObject("type", "business");
				mav.setViewName("/member/loginForm");
			}
		}
		return mav;

	}
	
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
		private ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			HttpSession session = request.getSession();
			session.removeAttribute("isLogOn");
			session.removeAttribute("member");
			session.removeAttribute("business");
			session.removeAttribute("uri");
			session.setAttribute("lat", 36.3492640);
			session.setAttribute("lng", 127.3776557);
			session.setAttribute("memLocation", "대전 서구 대덕대로 182");
			mav.setViewName("redirect:/main.do");
			return mav;
		}
	
	//일반회원 아이디 중복
	@RequestMapping(value="/member/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) throws Exception{
		int cnt = memberService.idCheck(id);
		return cnt;
	}
	//사업자 아이디 중복
	@RequestMapping(value="/member/bIdCheck")
	@ResponseBody
	public int bIdCheck(@RequestParam("id") String id) throws Exception{
		int cnt = memberService.bIdCheck(id);
		return cnt;
	}
	//일반회원 이메일 중복
	@RequestMapping(value="/member/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam Map<String, String> emailChk) throws Exception{
		int cnt = memberService.emailCheck(emailChk);
		return cnt;
	}
	
	//사업자 이메일 중복
		@RequestMapping(value="/member/bEmailCheck")
		@ResponseBody
		public int bEmailCheck(@RequestParam Map<String, String> bEmailChk) throws Exception{
			int cnt = memberService.bEmailCheck(bEmailChk);
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
	@RequestMapping(value="/member/addMember.do")
	public ResponseEntity addMember(MemberVO member, 
			 @RequestParam(name = "emailConsent", required = false) boolean emailConsentChecked,
			 @RequestParam(name = "phoneConsent", required = false) boolean phoneConsentChecked,
		        HttpServletRequest request, HttpServletResponse response)
	        throws Exception {
	    response.setContentType("text/html; charset=UTF-8");
	    request.setCharacterEncoding("utf-8");
	    String message = null;
	    ResponseEntity resEntity = null;
	    HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    try {
	    	 member.setEmailConsent(emailConsentChecked ? "Y" : "N");
	         member.setPhoneConsent(phoneConsentChecked ? "Y" : "N");
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
	
	@Override
	@RequestMapping(value="/member/addB_Member.do" , method = RequestMethod.POST)
	public ResponseEntity addB_Member(BusinessVO business,
			 HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
	    response.setContentType("text/html; charset=UTF-8");
	    request.setCharacterEncoding("utf-8");
	    String message = null;
	    ResponseEntity resEntity = null;
	    HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    try {
	        memberService.addB_Member(business);
	       
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





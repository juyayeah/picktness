package com.pick.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pick.member.vo.BusinessVO;
import com.pick.member.vo.MemberVO;

public interface MemberController {
	public ResponseEntity addMember(@ModelAttribute("member") MemberVO member,
			 @RequestParam(name = "emailConsent", required = false) boolean emailConcentChecked,
			 @RequestParam(name = "phoneConsent", required = false) boolean phoneConcentChecked,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addB_Member(@ModelAttribute("business") BusinessVO business,
           HttpServletRequest request, HttpServletResponse response) throws Exception;

}

	

package com.pick.business.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;


import com.pick.business.mypage.vo.BusinessVO;
public interface BusinessController {
	
	public ResponseEntity InsertGym(@ModelAttribute("business") BusinessVO business,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
}

	

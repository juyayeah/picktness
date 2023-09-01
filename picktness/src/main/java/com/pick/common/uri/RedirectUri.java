package com.pick.common.uri;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RedirectUri {
	@RequestMapping(value="/redirectUri.do")
	@ResponseBody
	public void redirectUri(String str, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.setAttribute("uri", str);
		System.out.println("햇니?");
	}
}

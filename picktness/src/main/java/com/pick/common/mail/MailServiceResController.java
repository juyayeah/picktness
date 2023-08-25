package com.pick.common.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MailServiceResController {
	
	@Autowired
	RegisterMail registerMail;
	
	@ResponseBody
	@RequestMapping(value="/api/mail", method=RequestMethod.POST)
	public String mailConfirm(@RequestParam(name = "email") String email, @RequestParam(name="type") String type) throws Exception{
		String code = registerMail.sendSimpleMessage(email, type);
		return code;
	}
}

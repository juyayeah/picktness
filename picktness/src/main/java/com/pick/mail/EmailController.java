package com.pick.mail;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



public class EmailController {
	@Autowired
	EmailService emailService;
	
	@RequestMapping(value="/member/emailCheck")
	public String emailConfirm(@RequestParam String email) throws Exception {

	  String confirm = emailService.sendSimpleMessage(email);

	  return confirm;
	}
}

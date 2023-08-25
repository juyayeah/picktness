package com.pick.common.mail;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class RegisterMail implements MailServiceInter {
	@Autowired
	JavaMailSender emailSender;
	
	private String ePw;

	@Override
	public MimeMessage creatMessage(String to, String type) throws MessagingException, UnsupportedEncodingException {
		MimeMessage message = emailSender.createMimeMessage();
		
		message.addRecipients(RecipientType.TO, to);
		
		String msg = "";
		switch(type) {
		case "join":
			message.setSubject("[Picktenss] 회원가입을 위한 이메일 인증 코드입니다.");
			msg += "<div align='center'>";
			msg += "<h1>안녕하세요</h1>";
			msg += "<h1>픽트니스 입니다</h1>";
			msg += "<br>";
			msg += "<p>아래 인증코드를 회원가입 창에 입력해 주세요</p>";
			msg += "<br>";
			msg += "<div align='center'>";
			msg += "<h3>회원가입 인증 코드입니다</h3>";
			msg += "<div style='color:#2890F1'><strong>";
			msg += ePw + "</strong></div><br></div></div>";
			break;
		case "findId":
			message.setSubject("[Picktenss] 아이디 찾기를 위한 이메일 인증 코드입니다.");
			msg += "<h1>안녕하세요</h1>";
			msg += "<h1>픽트니스 입니다</h1>";
			msg += "<br>";
			msg += "<p>아래 인증코드를 아이디 찾기 창에 입력해 주세요</p>";
			msg += "<br>";
			msg += "<div align='center'>";
			msg += "<h3>회원가입 인증 코드입니다</h3>";
			msg += "<div style='color:#2890F1'>";
			msg += ePw + "</div><br></div>";
			break;
		case "findPwd":
			message.setSubject("[Picktenss] 비밀번호 찾기를 위한 이메일 인증 코드입니다.");
			msg += "<h1>안녕하세요</h1>";
			msg += "<h1>픽트니스 입니다</h1>";
			msg += "<br>";
			msg += "<p>아래 인증코드를 비밀번호 찾기 창에 입력해 주세요</p>";
			msg += "<br>";
			msg += "<div align='center'>";
			msg += "<h3>회원가입 인증 코드입니다</h3>";
			msg += "<div style='color:#2890F1'>";
			msg += ePw + "</div><br></div>";
			break;
		}

		message.setText(msg, "utf-8", "html");
		message.setFrom(new InternetAddress("picktness@naver.com", "picktness"));
		System.out.println(msg);
		System.out.println(message);
		return message;
	}

	@Override
	public String createKey() {
		int leftLimit = 48;
		int rightLimit = 122;
		int targetStringLenght = 8;
		Random random = new Random();
		String key = random.ints(leftLimit, rightLimit + 1)
				.filter(i -> (i <= 57 || i >= 65)&& (i <= 90 || i >= 97))
				.limit(targetStringLenght)
				.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
				.toString();
		
		return key;
	}

	@Override
	public String sendSimpleMessage(String to, String type) throws Exception {
		ePw = createKey();
		MimeMessage message = creatMessage(to, type);
		try {
			emailSender.send(message);
		} catch(Exception e) {
			e.printStackTrace();
			throw new IllegalArgumentException();
		}
		
		return ePw;
	}
	
	

}
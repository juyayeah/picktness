package com.pick.common.mail;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {
	
	@Bean
	public JavaMailSender javaMailService() {
		JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
		
		javaMailSender.setHost("smtp.naver.com"); // 네이버 smtp 주소
		javaMailSender.setUsername("picktness");
		javaMailSender.setPassword("vlrxmsltm123");
		
		javaMailSender.setPort(465);
		
		javaMailSender.setJavaMailProperties(getMailProperties());
		
		return javaMailSender;
	}
	
	private Properties getMailProperties() {
		Properties properties = new Properties();
		properties.setProperty("mail.transport", "smtp"); // 프로토콜 설정
		properties.setProperty("mail.smtp.auth", "true"); //smtp 인증
		properties.setProperty("mail.smtp.starttls", "true"); 
		properties.setProperty("mail.debug", "true");
		properties.setProperty("mail.smtp.ssl.trust", "smtp.naver.com");
		properties.setProperty("mail.smtp.ssl.enable", "true");
		return properties;
	}
}

package com.bugtracker.Bugtracker.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
	
	 @Autowired
	    private JavaMailSender mailSender;

	    public void sendResetPasswordEmail(String email, String token) {
	        String resetUrl = "http://localhost:8080/reset-password?token=" + token;

	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(email);
	        message.setSubject("Password Reset Request");
	        message.setText("To reset your password, click the link below:\n" + resetUrl);
	        mailSender.send(message);
	    }
}

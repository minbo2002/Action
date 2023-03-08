package com.mycom.qna.service;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service("mailService")
@RequiredArgsConstructor
public class MailService {

	private final JavaMailSender mailSender;
    private final SimpleMailMessage preConfiguredMessage;

    @Async
	public void sendMail(String to, String title, String content) {
    	
    	MimeMessage message = mailSender.createMimeMessage();
		
    	try {
			// 메일을 보내기위한 MimeMessage 타입 객체 생성
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setCc(to);	
			messageHelper.setFrom(to, "관리자");
			messageHelper.setSubject(title);
			messageHelper.setTo(to); 
			messageHelper.setText(content);
			mailSender.send(message);  
			
		}catch(Exception e){
			e.printStackTrace();
		  }
		}

    /*
    // mail-context.xml 파일에서 미리 설정한 수신주소로 메일내용을 보낸다
	@Async
	public void sendPreConfiguredMail(String message) {
	  SimpleMailMessage mailMessage = new SimpleMailMessage(preConfiguredMessage);
	  mailMessage.setText(message);
	  mailSender.send(mailMessage);
	}
	*/
}

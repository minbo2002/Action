package com.mycom.qna.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycom.qna.service.MailService;
import com.mycom.qna.service.QnaService;

import lombok.RequiredArgsConstructor;

@Controller
@EnableAsync
@RequiredArgsConstructor
@RequestMapping("/qna/*")
public class MailController {

	private final MailService mailService;
	private final QnaService qnaService;
	
	private final Logger logger = LoggerFactory.getLogger(MailController.class);
	
	@RequestMapping(value = "/sendMailForm")
	public String sendMail(HttpServletRequest request, Model model) {
		
		String qnaNo = request.getParameter("qnaNo");
		String writerEmail = request.getParameter("writerEmail");
		String curPage = request.getParameter("curPage");
		logger.info("qnaNo="+qnaNo+",   writerEmail="+writerEmail+",    curPage="+curPage);
		
		model.addAttribute("qnaNo", qnaNo);
		model.addAttribute("curPage", curPage);
		model.addAttribute("writerEmail", writerEmail);
		
		return "qna/mailSendForm";
	}
	
	@RequestMapping(value = "/sendMail", method = RequestMethod.POST)
    public String sendSimpleMail(HttpServletRequest request, HttpServletResponse response) throws Exception{
    	
		String strQnaNo = request.getParameter("qnaNo");
		int qnaNo = Integer.parseInt(strQnaNo);
		
		String to = request.getParameter("to");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		request.setCharacterEncoding("utf-8");
    	response.setContentType("text/html;charset=utf-8");
        
    	PrintWriter out = response.getWriter();

//      mailService.sendMail("minbo2002@naver.com", "테스트 메일", "안녕하세요.보낸 메일 내용입니다.");  // to, title, content
        mailService.sendMail(to, title, content);  // to, title, content

//      mailService.sendPreConfiguredMail("테스트 메일입니다.");
//      out.print("메일을 보냈습니다!!");
        
        int updateStatusCnt = qnaService.updateStatus(qnaNo);
        logger.info("답변상태 변경 횟수" + updateStatusCnt);
        
        return "redirect:/qna/list";
    }
}

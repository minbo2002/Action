package com.mycom.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycom.notice.domain.Notice;
import com.mycom.notice.service.NoticeService;
@Controller
public class HomeController {
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, 
							@RequestParam(name="ano",required=false,defaultValue="1") int no,
							@RequestParam(name="keyword", required=false )String keyword) throws Exception {
		//전체 게시물수
		int totalCnt=noticeService.getTotalCnt(keyword);

		//전체목록조회
		List<Notice> list=noticeService.getNoticeAllList(keyword);
		
		
		//3.Model
		model.addAttribute("totalCnt", totalCnt); //전체조회
		model.addAttribute("list", list); 		//전체목록
		model.addAttribute("keyword", keyword); //키워드 세션유지
	
	
		return "home";
	}
	
	@RequestMapping(value = "/sample1", method = RequestMethod.GET)
	public String sample1() {
		return "boxoffice/sample1";
	}

	@RequestMapping(value = "/sample3", method = RequestMethod.GET)
	public String sample3() {
		return "boxoffice/sample3";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "test/test";
	}
}

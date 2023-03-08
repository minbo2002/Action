package com.mycom.notice.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//원칙적으로 요청함수는 <->Service<->DAO(Repository)<->(MyBatis)->db
//여기에서는 임시 요청함수                <->DAO(Repository)<->(MyBatis)->db
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.common.base.BaseController;
import com.mycom.notice.domain.Notice;
import com.mycom.notice.service.NoticeService;

@Controller
public class NoticeController extends  BaseController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	NoticeService noticeService;
	
	//화면목록페이지
	@GetMapping("/notice/list")
	public String list(Model model,
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
	
		
		//4.View
		return "notice/list";
	}
	
	//입력폼 페이지이동
	@GetMapping("/notice/addForm")
	public String insertNoticeForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return "notice/addForm";
	}
	
	//입력 데이터 실제 저장되는곳
	@PostMapping("/notice/list")
	public String saveForm(Notice notice) throws Exception {
		noticeService.insertNotice(notice);
		return "redirect:/notice/list";
	}
	
	
	//상세보기
	 @GetMapping("/notice/detailForm") 
	 public String detailFormNoticeForm(@RequestParam int noticeNo,Model model) throws Exception { 
		 
		 //Notice detail = noticeService.detailNotice(noticeNo); //아래께 축약버전
		 model.addAttribute("detail",noticeService.detailNotice(noticeNo));
		 return "notice/detailForm"; 
	 }
	
	//수정폼보여주기
		@GetMapping("/notice/updateForm")
		public String updateNoticeForm(@RequestParam("noticeNo") int no,
				Model model) throws Exception {
			//db에서 특정게시글의 상세정보를 가져오기  진행예정
			Notice notice=noticeService.detailNotice(no);
			model.addAttribute("notice",notice);
			return "/notice/updateForm";
		}
		
		//수정처리
	    @PostMapping("/notice/updateForm")
	    public ModelAndView submitUpdateForm(Notice notice, 
	    		ModelAndView mv) throws Exception {
	    	int cnt = noticeService.updateNotice(notice);
	    	
	    	if(cnt==1) {
	    		mv.setViewName("redirect:/notice/list"); //redirect용 view
	    	}else { 
	    		mv.setViewName("redirect:/notice/updateForm?ano="+notice.getNoticeNo());
	    	}
	    	return mv;
	    }
		
	    
	    //삭제하기  
	    @RequestMapping(value="/notice/delete", 
	    		        method= {RequestMethod.POST,RequestMethod.GET})
		public ModelAndView deleteNotice(@RequestParam("noticeNo") int no) throws Exception {
			int cnt=noticeService.deleteNotice(no);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/notice/list");
			return mv;
		}
	

	
}//입력처리 끝
	

	
	
    
    












package com.mycom.event.controller;


import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//원칙적으로 요청함수는 <->Service<->DAO(Repository)<->(MyBatis)->db
//여기에서는 임시 요청함수                <->DAO(Repository)<->(MyBatis)->db
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.common.base.BaseController;
import com.mycom.event.domain.Event;
import com.mycom.event.domain.ImageFileVO;
import com.mycom.event.service.EventService;


@Controller
public class EventController extends  BaseController {

	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	EventService eventService;
	
	//화면목록페이지
	@GetMapping("/event/list")
	public String list(Model model,
			@RequestParam(name="ano",required=false,defaultValue="1") int no,
			@RequestParam(name="keyword", required=false )String keyword) throws Exception {

		
		//전체 게시물수
		int totalCnt=eventService.getTotalCnt(keyword);

		//전체목록조회
		List<Event> list=eventService.getEventAllList(keyword);
		
		
		//3.Model
		model.addAttribute("totalCnt", totalCnt); //전체조회
		model.addAttribute("list", list); 		//전체목록
		model.addAttribute("keyword", keyword); //키워드 세션유지
	
		
		//4.View
		return "event/list";
	}
	
	//입력폼 페이지이동
	@GetMapping("/event/addForm")
	public String insertEventForm(HttpServletRequest request) {
		//원칙적으로는 (로그인한 user가) 글입력 권한을 가진 사용자가 글입력해야지만
		//여기에서는 임시로 세션에 정보를 저장하여 진행하겠다
		HttpSession session = request.getSession();
		
		return "event/addForm";
	}
	
	//입력 데이터 실제 저장되는곳
	@PostMapping("/event/save")
	public String saveForm(Event event) throws Exception {
		eventService.insertEvent(event);
		return "redirect:/event/list";
	}
	
	
	//상세보기
	 @GetMapping("/event/detailForm") 
	 public String detailFormEventForm(@RequestParam int eventNo,Model model) throws Exception { 
		 
		 //Event detail = eventService.detailEvent(eventNo); //아래께 축약버전
		 model.addAttribute("detail",eventService.detailEvent(eventNo));
		 return "event/detailForm"; 
	 }
	
	//수정폼보여주기
		//방식get
		//요청주소 ~컨페/event/updateForm?ano=글번호
		@GetMapping("/event/updateForm")
		public String updateEventForm(@RequestParam("eventNo") int no,
				Model model) throws Exception {
			//db에서 특정게시글의 상세정보를 가져오기  진행예정
			Event event=eventService.detailEvent(no);
			model.addAttribute("event",event);
			return "/event/updateForm";
		}
		
		//수정처리
	//수정페이지에서 <form action="${contextPath}/event/updateForm" method="post">
	    @PostMapping("/event/updateForm")
	    public ModelAndView submitUpdateForm(Event event, 
	    		ModelAndView mv) throws Exception {
	    /* ModelAndView에서의 view지정하기	
	    	mv.setView("redirect용 view명");
	    	mv.setViewName("일반view");
	    	mv.setViewName("redirect:요청주소"); //redirect용 view */
	    	//1.파라미터받기
	    	//2.비즈니스로직수행
	    	int cnt = eventService.updateEvent(event);
	    	//update가 적용된 레코드수를 반환받는다
	    	//여기에서는 1이면 수정성공, 0이면 실패
	    	if(cnt==1) { //성공이면 목록보기(여기에서는 resultView)
	    		/*아래는  요청메서드의 리턴유형이 String인경우의 redirect처리방법
	    		 * return redirect:요청주소
	    		   return "redirect:/event/req1";*/
	    		mv.setViewName("redirect:/event/list"); //redirect용 view
	    	}else { //실패이면 수정폼을 보여주기
	    		/*아래는  요청메서드의 리턴유형이 String인경우의 redirect처리방법
	    		 * return redirect:요청주소
	    		   return "redirect:/event/updateForm?ano="+event.getEventNo();*/
	    		mv.setViewName("redirect:/event/updateForm?ano="+event.getEventNo());
	    	}
	    	//3.Model //4.View
	    	return mv;
	    }
		
	    
	    //삭제하기  
	    //get방식,post방식
	    //요청주소 ~컨페/event/delete?ano=글번호
	    @RequestMapping(value="/event/delete", 
	    		        method= {RequestMethod.POST,RequestMethod.GET})
		public ModelAndView deleteEvent(@RequestParam("eventNo") int no) throws Exception {
			int cnt=eventService.deleteEvent(no);
			System.out.println("cnt="+cnt);
			//delete가 적용된 레코드수를 반환받는다
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/event/list");
			return mv;
		}
	
	  //-----------------------파일 업로드---------------------------------------
	  //파일저장경로
	  	private static final String REPO_PATH = "C:\\spring\\event_repo";
		
		//입력처리
		//요청방식 post
		//요청주소 ~컨페/event/addNewevent.do
		//@PostMapping("/event/addNewevent")
		@RequestMapping(value="/event/addNewevent" ,method={RequestMethod.POST})
		public ResponseEntity submitEventForm(ModelAndView mv,
				MultipartHttpServletRequest multipartRequest) throws Exception {			
			//multipartRequest.setCharacterEncoding("utf-8");
			Map map = new HashMap(); //글관련정보+첨부파일정보
	  		
			//1.form요소 중에서(<input type="file">이 아닌 요소의 name속성의 값)파라미터명 가져오기
			Enumeration enu = multipartRequest.getParameterNames();  
			while( enu.hasMoreElements() ) {
				//map에는 key이름으로  파라미터명으로(form의 name속성값) 사용하겠다
				//value는 가져온 파라미터명을 이용하여 추출
				String name = (String)enu.nextElement();
				String value= multipartRequest.getParameter(name);
				logger.info("컨트롤러 while문안 map.put(name,value)="+name+","+value);
		  		map.put(name,value);  //name에 들어가는 "memberId","file1","file2","file3"
		  		//<input type="file">이 아닌 것들에 대한 파라미터명과  값이 담긴다
			}
			
			//session 등록자id를 구하기
			HttpSession session=multipartRequest.getSession();
			/* 세션속성명과 값이  정해졌으나, 아직 소스가 합쳐지기 전상태라면
			AuthUser authUser = new AuthUser();
			authUser.setUserNo(1);
			authUser.setUserId("hongId");
			authUser.setUserName("홍GD");
			session.setAttribute("AUTHUSER",authUser);
			
			AuthUser authUser = session.getAttribute("AUTHUSER");
			String reg_id=authUser.getUserId();*/
			
			//AuthUser라는 객체가 없는 상태라면 아래와 같이 임시 저장해놓고 사용하다가
			//소스합쳐지면 잊지말고   정리하자~~~~~!!!!!!!!!!!!!!!
			//session.setAttribute("AUTHUSER_NO",1);
			session.setAttribute("AUTHUSER_ID","adminId");//로그인했다 가정하고
			//session.setAttribute("AUTHUSER_NAME","홍GD");
			
			String reg_id = (String)session.getAttribute("AUTHUSER_ID");
			
					
			//2.form요소 중에서<input type="file"> 가져오기		
			//여기에서는 다중파일업로드이므로  n개이니 List로 처리하겠다
			//여기에서는 BaseController로 부터 상속받은 upload()호출
			List<ImageFileVO> imageFileList = upload(multipartRequest);
			if( imageFileList!=null && imageFileList.size()!=0) {
				for( ImageFileVO imageFileVO  : imageFileList) {
					imageFileVO.setReg_id(reg_id);//등록자id를 set
					logger.info("컨트롤러 for문안 imageFileVO="+imageFileVO);
				}
				map.put("imageFileList",imageFileList);
			}//if끝
		   
			
			ResponseEntity resEntity = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html;charset=utf-8");
			String msg = null;
			String imageFileName = null;

			try {
				int event_id =eventService.addNewEvent(map);//글관련정보+첨부파일정보			
				
				//입력성공이 되면 
				//"글등록이 되었습니다."라는 alert띄우기+입력폼페이지로 이동+임시파일을 저장소로 이동
				//1)임시파일을 저장소로 복사(->temp폴더안의 임시파일을  글번호폴더생성후 그 하위에 이동)
				if( imageFileList!=null && imageFileList.size()!=0) {
					for( ImageFileVO imageFileVO : imageFileList) {
						imageFileName=imageFileVO.getFileName();
						File srcFile = new File(REPO_PATH+"\\temp\\"+imageFileName);
						File destDir = new File(REPO_PATH+"\\"+event_id);
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
					}
				}//if
				
				//2)"글등록이 되었습니다."라는 alert띄우기
				msg = "<script>";
				msg+= "alert('글등록이 되었습니다.');";
				msg+= "location.href='"+multipartRequest.getContextPath()+"/event/addForm';";
				msg+= "</script>";
				//3)입력폼페이지로 이동
			}catch(Exception e) {
				//입력실패 되면 
				//"오류발생."라는 alert띄우기+입력폼페이지로 이동+업로드된 이미지삭제
				//1)업로드된 이미지삭제
				if(imageFileList!=null && imageFileList.size()!=0) {
					for( ImageFileVO imageFileVO : imageFileList) {
						imageFileName=imageFileVO.getFileName();
						File srcFile = new File(REPO_PATH+"\\temp\\"+imageFileName);
						srcFile.delete();
					}
				}//if
				
				
				//2)"오류발생."라는 alert띄우기   + 3)입력폼페이지로 이동
				msg = "<script>";
				msg+= "alert('오류가 발생했습니다.PLZ Retry');";
				msg+= "location.href='"+multipartRequest.getContextPath()+"/event/addForm';";
				msg+= "</script>";
				
				e.printStackTrace();
			}
			
			resEntity = new ResponseEntity(msg,responseHeaders,HttpStatus.OK);
			return resEntity;//~~~~~~~~~~~~~~~~~~~~~
		}//입력처리 끝
	/*참고  ResponseEntity란?
	 * 응답결과데이터, HttpStatus상태코드를 직접 제어할 수 있는 클래스
	 * ResponseEntity에는  사용자 요청에 대한 응답데이터를 포함
	 */
	
}//입력처리 끝
	

	
	
    
    












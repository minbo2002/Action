package com.mycom.qna.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.qna.domain.Qna;
import com.mycom.qna.domain.QnaFile;
import com.mycom.qna.service.Pager;
import com.mycom.qna.service.QnaFileService;
import com.mycom.qna.service.QnaService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/qna/*")
public class QnaController {

	private final QnaService qnaService;
	private final QnaFileService qnaFileService;
	
	private final Logger logger = LoggerFactory.getLogger(QnaController.class);
	private static final String IMAGE_REPO_PATH = "C:\\upload\\tmp";  

	// 전체 list
	@RequestMapping(value="/list", method = {RequestMethod.GET, RequestMethod.POST})
	public String getQnaList(@RequestParam(defaultValue="1") int curPage,
							 @RequestParam(defaultValue="") String search_option,
							 @RequestParam(defaultValue="") String keyword,
							 Model model,
							 HttpServletRequest request) throws Exception {


		int count = qnaService.countQna(search_option, keyword);
		logger.info("게시물 총 개수 count = " + count);

		Pager pager = new Pager(count, curPage);
		
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		logger.info("start="+start+",  end="+end+",   search_option="+search_option+",   keyword="+keyword+",    curPage="+pager.getCurPage());
		
		List<Qna> list = qnaService.list(start, end, search_option, keyword);
		logger.info("list="+list.toString());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);
		
		model.addAttribute("map", map);
		
		return "qna/qnaList";
	}
		
	// 게시판 상세내용 조회
	@GetMapping("/detail")
	public String getQnaDetail(@RequestParam("qnaNo") int no, 
							   @RequestParam(defaultValue="1") int curPage, Model model) throws Exception {
		
		// 게시판 상세내용 조회
		Qna qnaDetail = qnaService.getQnaDetail(no);
		logger.info("게시판 상세조회 qnaDetail = "+qnaDetail.toString());
		
		// 게시판 안의 파일들 조회
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<QnaFile> fileList = qnaFileService.fileList(no);
		logger.info("파일 정보 fileList = " + fileList.toString());

		map.put("fileList", fileList);

		logger.info("curPage="+curPage);
		model.addAttribute("map", map);
		model.addAttribute("curPage", curPage);
		model.addAttribute("qnaDetail", qnaDetail);
		
		return "qna/detailView";
	}

	// 글 등록폼
	@GetMapping("/addForm")
	public String addQnaForm(HttpServletRequest request) {

		return "qna/addForm";
	}
	
	// 글 등록 데이터처리
	@PostMapping("/add")
	public ModelAndView addQna(MultipartHttpServletRequest multipartRequest,
			@Valid @ModelAttribute Qna qna, BindingResult bindingResult) throws Exception { 
		
		ModelAndView mav = new ModelAndView();
		
		if(bindingResult.hasErrors()) {

            bindingResult.getAllErrors().forEach(objectError ->  {

                FieldError field = (FieldError) objectError;
                logger.info("문제가 있는 field : " + field.getField());

                mav.addObject("badRequest", (HttpStatus.BAD_REQUEST).toString());
                mav.setViewName("qna/addForm");
            });

			return mav;
		}
		
		// 1. 게시판 데이터 저장하기
		int insertQnaCnt = qnaService.insertQna(qna);
		logger.info("1) qna = "+qna);
		logger.info("2) 등록된 글 개수 = " + insertQnaCnt);
		
		MultipartFile file1 = multipartRequest.getFile("file1");
		
		if(!file1.isEmpty()) {
			
			// 2. 파일 데이터 저장하기
			Map<String, Object> map = new HashMap<String, Object>();
			
			// form 요소중에서  <input type="file">  가져오기
			List<String> fileList = fileProc(multipartRequest, qna);
			int size = fileList.size();
			
			logger.info("7) 저장된 파일 개수 = " + size);
			logger.info("8) 저장된 랜점숫자+원본파일명 = " + fileList);
			
			map.put("fileList", fileList);  //  <input type="file"> 으로 업로드된 파일의 정보들이 담긴다.
			
			// 3. map에 넣은 입력한 정보 + 파일 정보를 뷰단으로 보내기 
			mav.addObject("map", map);
		}
		
		mav.setViewName("redirect:/qna/list");
		
		return mav;
		
	}
	
	// 첨부파일에 대한 정보  + upload
  	public List<String> fileProc(MultipartHttpServletRequest multipartRequest, Qna qna) throws IOException {
  		
  		// 파일DB에 들어갈 게시판번호(FK)
  		int qnaNo = qna.getQnaNo();
  		
  		List<String> storedFileList = new ArrayList<String>();
  		
  		/* JSP에서 넘어온 <input> 태그의 name을 확실히 알고 있다면 getFile(), 확실히 알수 없다면 getFileNames() 를 사용.  getFileNames()는 배열임.
  		       파일이 몇개가 넘어오던 Iterator반환타입으로 name속성값을  모두 받아준다.  */
  		Iterator<String> fileNames = multipartRequest.getFileNames();

		while(fileNames.hasNext()) {  // 첨부파일 개수만큼 반복해서  --> 첨부파일 정보 가져와서 List에 담는다

  			// 파일의 이름 가져오기
  			String fileName = fileNames.next();
  			
  			/* Iterator반환타입으로 name속성값을  모두 받은다음에
  			   MultipartHttpServletRequest 인터페이스의 .getFile() 메서드로 실제파일객체인  MultipartFile 인터페이스의 객체를 만든다. */
  			MultipartFile mfile = multipartRequest.getFile(fileName);
  			
  			// 원본파일명
  			String originalFilename = mfile.getOriginalFilename();
  			logger.info("3) 원본 파일명 originalFilename = " + originalFilename);
  			// 랜덤숫자 + 원본파일명
  			String storedFileName = getRandomString() + originalFilename;
  			logger.info("4) 랜덤숫자 + 원본파일명 storedFileName = " + storedFileName);
  			// 파일사이즈
  			long fileSize = mfile.getSize();
  			logger.info("5) 파일 사이즈 = " + fileSize);

			storedFileList.add(storedFileName);
			
			// 지정위치에 파일 객체 생성
			File file = new File(IMAGE_REPO_PATH+"\\" + storedFileName);
			
			if(!mfile.isEmpty()) { // 첨부파일이 존재한다면
				logger.info("6) 첨부파일이 존재한다");
				
				if(!file.exists()) { // 지정한 경로에 이미 파일이 존재하지않는다면
					if(file.getParentFile().mkdirs()) {  // 해당경로에 폴더를 생성한다 
						file.createNewFile();  // 파일을 생성한다
					}
				}
				mfile.transferTo(new File(IMAGE_REPO_PATH+"\\" + storedFileName));  // 지정된 저장경로에 파일객체 저장
				
				// 파일DB에 파일 정보 저장
				qnaService.fileUpload(originalFilename, storedFileName, fileSize, qnaNo);
			}	
		}
		return storedFileList;
  	}
  	
  	// 화면단에 이미지 표현
  	@RequestMapping(value = "/imageFile", method=RequestMethod.GET)
  	public void download1(@RequestParam("imageFileName") String imageFileName,
            HttpServletResponse response)throws Exception {

  		logger.info("화면단에 이미지 출력");
		
		OutputStream out = response.getOutputStream();
		String downFile = IMAGE_REPO_PATH + "\\" + imageFileName;
		File file = new File(downFile);//다운로드할 파일객체생성
		
		//response.setHeader()  응답헤더정보 설정
		//Cache-Control   HTTP 1.1 버전에서 지원하는 헤더로서, 이 헤더의 값을 "no-cache"로 지정하면 웹 브라우저는 응답 결과를 캐시하지 않는다.
		/*캐시란?-브라우저(클라이언트)가 저장해 놓은 데이터
		-웹 브라우저가 WAS에 같은 jsp파일을 2번 이상 요청할 때 불필요한 응답 요청을 방지하기 위해 사용한다.
		-웹 브라우저의 응답속도 향상되는 효과가 있다.*/
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);//Content-Disposition을 통해 파일명을 설정
		
		//버퍼를 이용하여   파일정보를     한 번에 8byte씩  읽어들이고 
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) //더 이상 읽어들일 것이 없다면
			break; //읽어들이는 것을 멈추어라
			out.write(buffer, 0, count); //읽은 내용 브라우저에 전송하기(-> 웹브라우저에 출력됨. 여기에서는 result.jsp문서에 출력됨)
		}
		
		in.close();//입력스트림닫기
		out.close();//출력스트림닫기
	}
	
	// 글 수정폼
	@GetMapping("/updateForm")
	public String updateQnaForm(@RequestParam("qnaNo") int no, 
								@RequestParam int curPage, Model model) throws Exception {
		
		// 특정 게시물 조회
		Qna qnaDetail = qnaService.getQnaDetail(no);
		logger.info("qnaDetail="+qnaDetail.toString());
		
		// 특정 게시물안의 파일들 조회
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<QnaFile> fileList = qnaFileService.fileList(no);
		logger.info("파일 정보 fileList = " + fileList.toString());

		map.put("fileList", fileList);

		model.addAttribute("map", map);
		model.addAttribute("curPage", curPage);
		model.addAttribute("qnaDetail", qnaDetail);
		
		return "qna/updateForm";
	}
	
	// 글 수정 데이터 처리
	@PostMapping("/update")
	public ModelAndView updateQna(@RequestParam("qnaNo") int no, @RequestParam int curPage,
								  @ModelAttribute @Valid Qna qna, BindingResult bindingResult, Model model) throws Exception {

		ModelAndView mav = new ModelAndView();

		if(bindingResult.hasErrors()) {

            FieldError fieldError = bindingResult.getFieldError();
            logger.info("field error 발생 = "+ fieldError.getDefaultMessage());
            
            mav.setViewName("redirect:/qna/updateForm?qnaNo="+no+"&curPage="+curPage);
            
			return mav;
		}
		
		int updateCnt = qnaService.updateQna(qna);
		logger.info("글수정 횟수 = " + updateCnt);
		
		if(updateCnt==1) {
			mav.setViewName("redirect:/qna/list");
		}else {
			mav.setViewName("redirect:/qna/updateForm?qnaNo="+no+"&curPage="+curPage);
		}
		
		return mav;
	}

	// 글 삭제
	@PostMapping("/delete")
	public ModelAndView delteQna(ModelAndView mav, @RequestParam("qnaNo") int no) throws Exception {

		List<QnaFile> fileList = qnaFileService.fileList(no);
		logger.info("파일 정보 fileList = " + fileList.toString());
		
		// 파일이 존재한다면
		if(fileList!=null || fileList.size()!=0) {	
			for(int i=0; i<fileList.size(); i++) {
				
				// 파일 저장경로의 파일 삭제
				Path file1 = Paths.get("C:\\upload\\tmp\\"+fileList.get(i).getFileName());
				Files.deleteIfExists(file1);
				
				// 썸네일파일 저장경로의 파일 삭제
				Path file2 = Paths.get("C:\\upload\\tmp\\thumbnail\\"+fileList.get(i).getFileName());
				Files.deleteIfExists(file2);
			}
		}

		int deleteCnt = qnaService.deleteQna(no);
		logger.info("삭제된 글 개수="+deleteCnt);
		
		if(deleteCnt==1) {
			mav.setViewName("redirect:/qna/list");
		}else {
			mav.setViewName("redirect:/qna/detail?qnaNo="+no);
		}
		
		return mav;
	}

	// 랜덤숫자생성
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}

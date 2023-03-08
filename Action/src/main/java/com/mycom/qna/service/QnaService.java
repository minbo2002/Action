package com.mycom.qna.service;

import java.io.IOException;
import java.util.List;

import com.mycom.qna.domain.Qna;

public interface QnaService {

	public List<Qna> list(int start, int end, String search_option, String keyword) throws Exception;  // 전체 list
	
	public Qna getQnaDetail(int no) throws Exception;  // 특정 게시물 조회

	public int insertQna(Qna qna) throws Exception;  // 글 등록
	
	public int updateQna(Qna qna) throws Exception;  // 글 수정
	
	public int deleteQna(int no) throws Exception;  // 글 삭제

	public int countQna(String search_option, String keyword);
	
	public void fileUpload(String originalFilename, 
			   String storedFileName, 
			   long fileSize, int qnaNo ) throws IOException;  // 파일 등록
	
	public int updateStatus(int qnaNo) throws Exception;    // 답변상태 변경
}

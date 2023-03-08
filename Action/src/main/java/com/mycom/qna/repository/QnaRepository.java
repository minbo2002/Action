package com.mycom.qna.repository;

import java.util.List;
import java.util.Map;

import com.mycom.qna.domain.Qna;

public interface QnaRepository {

public List<Qna> list(int start, int end, String search_option, String keyword);  // 전체 list
	
	public Qna getQnaDetail(int no);  // 특정 게시물 조회1

	public int insertQna(Qna qna);  // 글 등록
	
	public int updateQna(Qna qna);  // 글 수정
	
	public int deleteQna(int no);  // 글 삭제
	
	public int countQna(String search_option, String keyword);  // 게시판 전체개수
	
	public void fileUpload(Map<String, Object> fileMap);  // 파일등록
	
	public int updateStatus(int qnaNo) throws Exception;  // 답변상태 변경
}

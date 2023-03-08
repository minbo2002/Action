package com.mycom.notice.service;

import java.util.List;



import com.mycom.notice.domain.Notice;


public interface NoticeService {

	//전체 게시물수 조회
	public int getTotalCnt(String keyword) throws Exception;
	
	//전체 목록 조회
	public List<Notice>  getNoticeAllList(String keyword) throws Exception;
	
	//저장하기
	public void insertNotice(Notice notice) throws Exception;
	
	//특정글 수정
	public int updateNotice(Notice notice) throws Exception;
	
	//삭제하기   
	public int deleteNotice(int no) throws Exception;
	
	//상세보기
	public  Notice detailNotice(int noticeNo) throws Exception;

}
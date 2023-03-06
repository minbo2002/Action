package com.mycom.notice.repository;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mycom.notice.domain.ImageFileVO;
import com.mycom.notice.domain.Notice;

public interface NoticeRepository {

	//전체 게시물수 조회
	public int getTotalCnt(String keyword) throws DataAccessException;
	
	//상세보기
	public Notice getNoticeDetail(int no) throws DataAccessException;
	
	//전체 목록 조회
	public List<Notice>  getNoticeAllList(String keyword) throws DataAccessException;
	
	//저장하기
	public void insertNotice(Notice notice) throws DataAccessException;
	
	//특정글 수정
	public int updateNotice(Notice notice) throws DataAccessException;
	
	//삭제하기   
	public int deleteNotice(int no) throws DataAccessException;
	
}









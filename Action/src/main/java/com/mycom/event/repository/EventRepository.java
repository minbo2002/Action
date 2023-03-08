package com.mycom.event.repository;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mycom.event.domain.Event;
import com.mycom.event.domain.ImageFileVO;

public interface EventRepository {
	
		//전체 게시물수 조회
		public int getTotalCnt(String keyword) throws DataAccessException;
		
		//상세보기
		public Event getEventDetail(int no) throws DataAccessException;
		
		//전체 목록 조회
		public List<Event>  getEventAllList(String keyword) throws DataAccessException;
		
		//저장하기
		public void insertEvent(Event event) throws DataAccessException;
		
		//특정글 수정
		public int updateEvent(Event event) throws DataAccessException;
		
		//삭제하기   
		public int deleteEvent(int no) throws DataAccessException;

		//글등록- 첨부파일정보 포함
		//파라미터 Map newArticleMap:글관련정보
		public int insertNewEvent(Map newEventMap) throws DataAccessException;
		
		//파라미터 List<ImageFileVO> fileList:첨부파일정보
		public void insertEventImageFile(List<ImageFileVO> fileList) throws DataAccessException;
}

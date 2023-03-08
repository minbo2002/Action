package com.mycom.event.service;

import java.util.List;
import java.util.Map;

import com.mycom.event.domain.Event;


public interface EventService {

	//전체 게시물수 조회
	public int getTotalCnt(String keyword) throws Exception;
	
	//전체 목록 조회
	public List<Event>  getEventAllList(String keyword) throws Exception;
	
	//저장하기
	public void insertEvent(Event event) throws Exception;
	
	//특정글 수정
	public int updateEvent(Event event) throws Exception;
	
	//삭제하기   
	public int deleteEvent(int no) throws Exception;
	
	//상세보기
	public  Event detailEvent(int eventNo) throws Exception;
	//----------------------------------
	//----------------------------------
		//글등록- 첨부파일정보 포함
		//파라미턴 Map newArticleMap:글관련정보+첨부파일정보
	public int addNewEvent(Map newEventMap) throws Exception;



	

	
}









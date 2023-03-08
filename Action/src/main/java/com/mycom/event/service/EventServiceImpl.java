package com.mycom.event.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.event.domain.Event;
import com.mycom.event.domain.ImageFileVO;
import com.mycom.event.repository.EventRepository;




@Service
public class EventServiceImpl implements EventService{

	@Autowired
	EventRepository eventRepository;
	
	
	//전체 게시물수 조회
	public int getTotalCnt(String keyword) throws Exception{
		return eventRepository.getTotalCnt(keyword);
	}

	//전체 목록 조회
	public List<Event>  getEventAllList(String keyword) throws Exception{
		return eventRepository.getEventAllList(keyword);
	}
	
	//저장하기
	public void insertEvent(Event event) throws Exception{
		eventRepository.insertEvent(event);
	}
	
	//특정글 수정
	public int updateEvent(Event event) throws Exception{
		return eventRepository.updateEvent(event);
	}
	
	//삭제하기   
	public int deleteEvent(int no) throws Exception{
		return eventRepository.deleteEvent(no);
	}
	
	//상세보기
	@Override
	public Event detailEvent(int eventNo) throws Exception {
		return eventRepository.getEventDetail(eventNo);
		 
	}

		//글등록- 첨부파일정보 포함
		//파라미턴 Map newEventMap:글관련정보+첨부파일정보
		//리턴     입력된 글번호
		@Override
		public int addNewEvent(Map newEventMap) throws Exception {

			//int event_id에는 event테이블에 지금 입력된 event테이블의 글번호
			int event_id=eventRepository.insertNewEvent(newEventMap);
			
			//List<ImageFileVO> imageFileList에는 첨부파일정보
			List<ImageFileVO> imageFileList= (ArrayList)newEventMap.get("imageFileList");
			for(ImageFileVO imageFileVO : imageFileList) {
				imageFileVO.setEvent_id(event_id);
				System.out.println("서비스 for문안 imageFileVO="+imageFileVO);
			}
			eventRepository.insertEventImageFile(imageFileList);
			return event_id;
		}
		
	
	
}









package com.mycom.event.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycom.event.domain.Event;
import com.mycom.event.domain.ImageFileVO;


@Repository
public class EventRepositoryImpl implements EventRepository {

	//필드
	@Autowired
	private SqlSession sqlSession;
	
	//전체 게시물수 조회
	@Override
	public int getTotalCnt(String keyword) throws DataAccessException {
		int cnt = (Integer)sqlSession.selectOne("mapper.event.totalCnt",keyword);
		return cnt;
	}
	
	
	//전체 목록 조회
	@Override
	public List<Event> getEventAllList(String keyword) throws DataAccessException {
		List<Event> list = sqlSession.selectList("mapper.event.eventAllList",keyword);
		return list;
	}
	
	//저장하기
	@Override
	public void insertEvent(Event event) throws DataAccessException {
		int cnt=sqlSession.insert("mapper.event.insertEvent", event);
		
	}
	//특정글 수정
	@Override
	public int updateEvent(Event event) throws DataAccessException {
		int cnt=sqlSession.update("mapper.event.updateEvent", event);
		System.out.println("cnt="+cnt);
		//update가 적용된 레코드수를 반환받는다
		//여기에서는 1이면 수정성공, 0이면 실패
		return cnt;
	}
	//삭제하기
	@Override
	public int deleteEvent(int no) throws DataAccessException {
		int cnt=sqlSession.delete("mapper.event.deleteEvent", no);
		System.out.println("cnt="+cnt);
		//delete가 적용된 레코드수를 반환받는다
		//여기에서는 1이면 삭제성공, 0이면 실패
		return cnt;
	}

	//상세보기
	@Override
	public Event getEventDetail(int no) throws DataAccessException {
		return (Event)sqlSession.selectOne("mapper.event.eventDetail", no);
	}

	//---------------------------------
		//글등록- 첨부파일정보 포함
		//파라미터 Map newArticleMap:글관련정보
		//리턴      int 입력된 글번호
		@Override
		public int insertNewEvent(Map newEventMap) throws DataAccessException {
			//sqlSession.insert("실행쿼리문id",파라미터);
			sqlSession.insert("mapper.event.insertNewEvent",newEventMap);
			return Integer.parseInt((String)newEventMap.get("event_id"));
		}

		//글등록- 첨부파일정보 포함
		@Override
		public void insertEventImageFile(List<ImageFileVO> fileList) throws DataAccessException {
			//첨부파일의 수 만큼  insert문을 실행
			for(int i=0; i<fileList.size();i++){
				ImageFileVO imageFileVO=(ImageFileVO)fileList.get(i);
				sqlSession.insert("mapper.event.insertEventImageFile",imageFileVO);
			}
		}
		
}

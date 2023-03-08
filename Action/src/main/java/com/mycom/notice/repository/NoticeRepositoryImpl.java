package com.mycom.notice.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycom.notice.domain.ImageFileVO;
import com.mycom.notice.domain.Notice;

@Repository
public class NoticeRepositoryImpl implements NoticeRepository{

	//필드
	@Autowired
	private SqlSession sqlSession;
	
	//전체 게시물수 조회
	@Override
	public int getTotalCnt(String keyword) throws DataAccessException {
		int cnt = (Integer)sqlSession.selectOne("mapper.notice.totalCnt", keyword);
		return cnt;
	}
	
	//특정글의 글번호 조회
	public int getNoticeNo(int no) throws DataAccessException {
		return sqlSession.selectOne("mapper.notice.getNoticeNo",no);
	}
	
	//상세보기
	@Override
	public Notice getNoticeDetail(int no) throws DataAccessException {
		
		return (Notice)sqlSession.selectOne("mapper.notice.noticeDetail", no);
	}
	
	//전체 목록 조회
	@Override
	public List<Notice> getNoticeAllList(String keyword) throws DataAccessException {
		List<Notice> list = sqlSession.selectList("mapper.notice.noticeAllList",keyword);
		return list;
	}

	//저장하기
	public void insertNotice(Notice notice) throws DataAccessException {
		int cnt=sqlSession.insert("mapper.notice.insertNotice", notice);
	}
	
	//수정하기
	public int updateNotice(Notice notice) throws DataAccessException {
		int cnt=sqlSession.update("mapper.notice.updateNotice", notice);
		System.out.println("cnt="+cnt);
		return cnt;
	}
	
	//삭제하기   
	public int deleteNotice(int no) throws DataAccessException {
		int cnt=sqlSession.delete("mapper.notice.deleteNotice", no);
		System.out.println("cnt="+cnt);
		return cnt;
	}
	
}

package com.mycom.notice.service;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.mycom.notice.domain.Notice;
import com.mycom.notice.repository.NoticeRepository;


@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	NoticeRepository noticeRepository;
	
	
	//전체 게시물수 조회
	@Override
	public int getTotalCnt(String keyword) throws Exception {
		return noticeRepository.getTotalCnt(keyword);
		}

	//전체 목록 조회
	@Override
	public List<Notice> getNoticeAllList(String keyword) throws Exception {
		return noticeRepository.getNoticeAllList(keyword);
	}
	
	//저장하기
	public void insertNotice(Notice notice) throws Exception{
		noticeRepository.insertNotice(notice);
	}
	
	//수정하기
	public int updateNotice(Notice notice) throws Exception{
		return noticeRepository.updateNotice(notice);
	}
	
	//삭제하기   
	public int deleteNotice(int no) throws Exception{
		return noticeRepository.deleteNotice(no);
	}
	
	//상세보기
	@Override
	public Notice detailNotice(int noticeNo) throws Exception {
		return noticeRepository.getNoticeDetail(noticeNo);
		 
	}

}

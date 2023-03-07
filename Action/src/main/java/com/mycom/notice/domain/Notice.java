package com.mycom.notice.domain;

import java.util.Date;

public class Notice {
	private int    noticeNo; 	//공지사항번호
	private String theater;  	//극장
	private String category; 	//구분
	private String title; 		//제목
	private String content; 	//내용
	private Date   writeDate;   //날짜  
	private String memberId;	//회원ID
	
	public Notice() {}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getTheater() {
		return theater;
	}

	public void setTheater(String theater) {
		this.theater = theater;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", theater=" + theater + ", category=" + category + ", title=" + title
				+ ", content=" + content + ", writeDate=" + writeDate + ", memberId=" + memberId + "]";
	}


		
}

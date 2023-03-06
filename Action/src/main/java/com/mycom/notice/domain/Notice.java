package com.mycom.notice.domain;

import java.util.Date;

public class Notice {
	private int noticeNo; 
	private String theater; 
	private String category; 
	private String title; 
	private String content; 
	private Date writeDate;      
	private String memberId;
	
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

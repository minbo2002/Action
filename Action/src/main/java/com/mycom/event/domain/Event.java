package com.mycom.event.domain;

import java.util.Date;

public class Event {
	private int eventNo; 
	private String title; 
	private String content; 
	private Date writeDate;      
	private String memberId;

	public Event() {}
	
	public Event(int eventNo, String title, String content, Date writeDate, String memberId) {
		
		this.eventNo = eventNo;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.memberId = memberId;
	}


	public int getEventNo() {
		return eventNo;
	}


	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
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
		return "Event [eventNo=" + eventNo + ", title=" + title + ", content=" + content + ", writeDate=" + writeDate
				+ ", memberId=" + memberId + "]";
	}
	

}

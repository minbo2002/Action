package com.mycom.event.domain;

import java.util.Date;

//event테이블에  첨부되는 이미지파일들용 객체
public class ImageFileVO {
	
	private int image_id;	//이미지번호
	private int event_id;	//글번호.eventno컬럼 (event.eventno fk)
	private String fileName;//이미지파일명
	private String reg_id;//글등록자id. memberid컬럼 
	private Date creDate;	//등록일
	
	public ImageFileVO() {}

	public int getImage_id() {
		return image_id;
	}

	public void setImage_id(int image_id) {
		this.image_id = image_id;
	}

	public int getEvent_id() {
		return event_id;
	}

	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public Date getCreDate() {
		return creDate;
	}

	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

	@Override
	public String toString() {
		return "ImageFileVO [image_id=" + image_id + ", event_id=" + event_id + ", fileName=" + fileName
				+ ", reg_id=" + reg_id + ", creDate=" + creDate + "]";
	}

	
	
	
	
}


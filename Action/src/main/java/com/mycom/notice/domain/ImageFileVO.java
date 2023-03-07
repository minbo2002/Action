package com.mycom.notice.domain;

import java.util.Date;

public class ImageFileVO {
	
	private int image_id;	//이미지번호
	private int notice_id;	//글번호.articleno컬럼 (article.articleno fk)
	private String fileName;//이미지파일명
	private String reg_id;  //글등록자id memberid컬럼
	private Date creDate;	//등록일
	
	public ImageFileVO() {}

	public int getImage_id() {
		return image_id;
	}

	public void setImage_id(int image_id) {
		this.image_id = image_id;
	}

	public int getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
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
		return "ImageFileVO [image_id=" + image_id + ", notice_id=" + notice_id + ", fileName=" + fileName
				+ ", reg_id=" + reg_id + ", creDate=" + creDate + "]";
	}

	
	
	
	
}


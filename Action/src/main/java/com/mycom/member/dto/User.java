package com.mycom.member.dto;

import java.util.Date;

public class User {

	private String memId;	// 회원 id
	private String passwd;	// 회원 비밀번호
	private String memName;	// 회원 이름
	private String email;	// 회원 이메일
	private int gender;		// 성별
	private Date regDate;	// 가입일
	private String addr;	// 주소
	private int grade;		// 등급 0 일반  1브론즈 2실버 3골드 4다이아 5VIP , 기본값 0
	
	public User() {}	

	public User(String memId, String passwd, String memName, String email,int gender , Date regDate, String addr,int grade) {
		this.memId = memId;
		this.passwd = passwd;
		this.memName = memName;
		this.email = email;
		this.gender =gender;
		this.regDate = regDate;
		this.addr = addr;
		this.grade = grade;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	






}
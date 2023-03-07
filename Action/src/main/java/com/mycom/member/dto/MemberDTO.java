package com.mycom.member.dto;

import java.util.Date;

public class MemberDTO {

	private int memNo;	// 
	private String memId;	// 회원 id
	private String passwd;	// 회원 비밀번호
	private String memName;	// 회원 이름
	private int gender;		// 성별
	private String email;	// 회원 이메일
	private Date regDate;	// 가입일
	private String postcode;
	private String address;	// 주소
	private String extraAddress;
	private int grade;		// 등급 0 일반  1브론즈 2실버 3골드 4다이아 5VIP , 기본값 0
	private User user;		//
	
	public MemberDTO() {}	

	public MemberDTO(int memNo,String memId, String passwd, String memName, int gender, String email, Date regDate, String postcode ,String address,String extraAddress,int grade) {
		this.memNo = memNo;
		this.memId = memId;
		this.passwd = passwd;
		this.memName = memName;
		this.gender =gender;
		this.email = email;
		this.regDate = regDate;
		this.postcode = postcode;
		this.address = address;
		this.extraAddress = extraAddress;
		this.grade = grade;
	}
	
	
/*
	public MemberDTO(User user, int gender, Date regDate, String addr, int grade) {
		this.setUser(user);
		this.gender = gender;
		this.regDate = regDate;
		this.addr = addr;
		this.grade = grade;
	}
*/
	
	public int getMemNo() {
		return memNo;
	}
	
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	
	public String getmemId() {
		return memId;
	}

	public void setmemId(String memId) {
		this.memId = memId;
	}
	public String getpasswd() {
		return passwd;
	}
	public void setpasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getmemName() {
		return memName;
	}
	public void setmemName(String memName) {
		this.memName = memName;
	}
	
	public int getGender() {
		return gender;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getregDate() {
		return regDate;
	}
	public void setregDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getExtraAddress() {
		return extraAddress;
	}

	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}


	@Override
	public String toString() {
		return "MemberDTO [memNo=" + memNo + ", memId=" + memId + ", passwd=" + passwd + ", memName=" + memName
				+ ", gender=" + gender + ", email=" + email + ", regDate=" + regDate + ", postcode=" + postcode
				+ ", address=" + address + ", extraAddress=" + extraAddress + ", grade=" + grade + ", user=" + user
				+ "]";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}






}
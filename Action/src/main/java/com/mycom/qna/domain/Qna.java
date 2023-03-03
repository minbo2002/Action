package com.mycom.qna.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Qna {

	private int qnaNo;  		  // (PK)
	private String title;		  // 제목	
	private String content;		  // 내용
	private String writerId;	  // 작성자 아이디
	private String writerEmail;   // 작성자 이메일
	private Date regDate;		  // 등록날짜	
	private String answerStatus;  // 답변상태
	private String secret;		  // 비공개글 여부	
	private String memNo;  		  // (FK)	
}

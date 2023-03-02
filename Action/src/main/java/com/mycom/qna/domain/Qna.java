package com.mycom.qna.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Qna {

	private int qnaNo;  			  // (PK)
	private String title;		  // 제목	
	private String content;		  // 내용
	private String writerId;	  // 작성자
	private Date regDate;		  // 등록날짜	
	private String answerStatus;  // 답변상태
	private String memNo;  		  // (FK)	
}

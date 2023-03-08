package com.mycom.qna.domain;

import java.util.Date;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Qna {

	private int qnaNo;  		  // (PK)
	
	@NotEmpty(message = "제목을 입력하세요")
	@Length(min=1, max=50, message="제목은 1~50글자 사이를 입력해야합니다" )
	private String title;		  // 제목
	
	@NotEmpty(message = "내용을 입력하세요")
	@Length(min=1, max=500, message="내용은 1~500글자 사이를 입력해야합니다" )
	private String content;		  // 내용
	
	private String writerId;	  // 작성자 아이디
	private String writerEmail;   // 작성자 이메일
	private Date regDate;		  // 등록날짜	
	private String answerStatus;  // 답변상태
	private String secret;		  // 비공개글 여부	
	private String memNo;  		  // (FK)	
}

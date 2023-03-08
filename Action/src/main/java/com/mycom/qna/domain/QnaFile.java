package com.mycom.qna.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaFile {

	private int fileNo;			// 파일번호(PK)
	private String fileOriName;	// 원본 파일명
	private String fileName;	// 서버에 저장되는 파일명
	private int fileSize;		// 파일크기
	private Date regDate;		// 파일 등록일
	private int qnaNo;			// QNA게시판번호(FK)
}

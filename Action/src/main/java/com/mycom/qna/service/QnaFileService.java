package com.mycom.qna.service;

import java.util.List;

import com.mycom.qna.domain.QnaFile;

public interface QnaFileService {

	public List<QnaFile> fileList(int no) throws Exception;
}

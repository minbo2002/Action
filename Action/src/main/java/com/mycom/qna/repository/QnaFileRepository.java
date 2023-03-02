package com.mycom.qna.repository;

import java.util.List;
import java.util.Map;

import com.mycom.qna.domain.QnaFile;

public interface QnaFileRepository {

	public List<QnaFile> fileList(int no) throws Exception;

}

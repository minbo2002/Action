package com.mycom.qna.repository;

import java.util.List;
import com.mycom.qna.domain.QnaFile;

public interface QnaFileRepository {

	public List<QnaFile> fileList(int no) throws Exception;
}

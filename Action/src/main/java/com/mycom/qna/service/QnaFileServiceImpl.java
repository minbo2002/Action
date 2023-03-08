package com.mycom.qna.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.mycom.qna.domain.QnaFile;
import com.mycom.qna.repository.QnaFileRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QnaFileServiceImpl implements QnaFileService {

private final QnaFileRepository qnaFileRepository;
	
	@Override
	public List<QnaFile> fileList(int no) throws Exception {
		
		return qnaFileRepository.fileList(no);
	}
}

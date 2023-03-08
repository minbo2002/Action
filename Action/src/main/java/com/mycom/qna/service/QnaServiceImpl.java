package com.mycom.qna.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.mycom.qna.domain.Qna;
import com.mycom.qna.repository.QnaRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaService {

	private final QnaRepository qnaRepository;

	@Override
	public List<Qna> list(int start, int end, String search_option, String keyword) throws Exception {
		
		return qnaRepository.list(start, end, search_option, keyword);
	}


	@Override
	public Qna getQnaDetail(int no) throws Exception {
		
		return qnaRepository.getQnaDetail(no);
	}

	@Override
	public int insertQna(Qna qna) throws Exception {
		
		return qnaRepository.insertQna(qna);
	}

	@Override
	public int updateQna(Qna qna) throws Exception {
		
		return qnaRepository.updateQna(qna);
	}

	@Override
	public int deleteQna(int no) throws Exception {
		
		return qnaRepository.deleteQna(no);
	}

	@Override
	public int countQna(String search_option, String keyword) {
		
		return qnaRepository.countQna(search_option, keyword);
	}

	@Override
	public void fileUpload(String originalFilename, String storedFileName, long fileSize, int qnaNo)
			throws IOException {
		
		// 파일의 정보를 담을 map 생성
		Map<String, Object> fileMap = new HashMap<String, Object>();
		
		fileMap.put("originalFilename", originalFilename);
		fileMap.put("storedFileName", storedFileName);
		fileMap.put("fileSize", fileSize);
		fileMap.put("qnaNo", qnaNo);
		
		qnaRepository.fileUpload(fileMap);
		
	}

	@Override
	public int updateStatus(int qnaNo) throws Exception {

		return qnaRepository.updateStatus(qnaNo);
	}
}

package com.mycom.qna.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycom.qna.domain.QnaFile;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class QnaFileRepositoryImpl implements QnaFileRepository {

	private final SqlSessionTemplate sqlSession;
	
	@Override
	public List<QnaFile> fileList(int no) throws Exception {
		
		return sqlSession.selectList("mapper.qnaFile.qnaFileList", no);
	}
}

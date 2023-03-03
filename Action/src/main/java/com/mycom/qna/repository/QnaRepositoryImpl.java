package com.mycom.qna.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycom.qna.domain.Qna;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class QnaRepositoryImpl implements QnaRepository {

	private final SqlSessionTemplate sqlSession;
	
	@Override
	public List<Qna> list(int start, int end, Qna qna) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("qna", qna);
		
		return sqlSession.selectList("mapper.qna.qnaList", map);
	}

	@Override
	public Qna getQnaDetail(int no) {
		
		return sqlSession.selectOne("mapper.qna.qnaDetail", no);
	}

	@Override
	public int insertQna(Qna qna) {
		
		return sqlSession.insert("mapper.qna.insertQna", qna);
	}

	@Override
	public int updateQna(Qna qna) {
		
		return sqlSession.update("mapper.qna.updateQna", qna);
	}

	@Override
	public int deleteQna(int no) {
		
		return sqlSession.delete("mapper.qna.deleteQna", no);
	}

	@Override
	public int countQna() {
		
		return sqlSession.selectOne("mapper.qna.countQna");
	}

	@Override
	public void fileUpload(Map<String, Object> fileMap) {
		
		sqlSession.insert("mapper.qna.uploadFile", fileMap);
	}

	@Override
	public int updateStatus(int qnaNo) throws Exception {
		
		return sqlSession.update("mapper.qna.answerStatus", qnaNo);
	}
}

package com.mycom.store.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycom.store.model.StoreVO;


@Repository
public class StoreDAO {

	@Autowired
	private SqlSession sqlSession;
	private final static String NAMESPACE = "storeMapper.";
	
/////* 스토어 */////////////////////////////////////////////////////////
	//상품삭제
	public int storeDelete(StoreVO storeVO) throws Exception {
		return sqlSession.delete(NAMESPACE+"storeDelete", storeVO);
	}
	//상품수정
	public int storeUpdate(StoreVO storeVO) throws Exception {
		return sqlSession.update(NAMESPACE+"storeUpdate", storeVO);
	}
	//상품등록
	public int storeWrite(StoreVO storeVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"storeWrite", storeVO);
	}
	//상품조회
	public StoreVO storeSelect(StoreVO storeVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"storeSelect", storeVO);
	}
	//상품목록
	public List<StoreVO> storeList(StoreVO storeVO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"storeList", storeVO);
	}
}

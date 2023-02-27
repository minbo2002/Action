package com.mycom.action.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycom.action.model.StoreVO;


@Repository
public class StoreDAO {

	@Autowired
	private SqlSession sqlSession;
	private final static String NAMESPACE = "storeMapper.";
	
	
	
	
/////* 스토어 */////////////////////////////////////////////////////////
	public int storeDelete(StoreVO storeVO) throws Exception {
		return sqlSession.delete(NAMESPACE+"storeDelete", storeVO);
	}
	
	public int storeUpdate(StoreVO storeVO) throws Exception {
		return sqlSession.update(NAMESPACE+"storeUpdate", storeVO);
	}
	
	public int storeWrite(StoreVO storeVO) throws Exception {
		return sqlSession.insert(NAMESPACE+"storeWrite", storeVO);
	}
	
	public StoreVO storeSelect(StoreVO storeVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"storeSelect", storeVO);
	}
	
	public List<StoreVO> storeList(StoreVO storeVO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"storeList", storeVO);
	}
}

package com.mycom.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycom.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 전체 회원조회
	@Override
	public List<MemberDTO> memberList() {
		
		return sqlSession.selectList("member.memberList");
	}

	// 회원가입
	@Override
	public int insertMember(MemberDTO dto) {
		
		return sqlSession.insert("member.insertMember", dto);
	}

	// 회원 상세조회
	@Override
	public MemberDTO viewMember(String memId) {
	
		return sqlSession.selectOne("member.viewMember", memId);
	}

	// 회원 삭제
	@Override
	public void deleteMember(String memId) {
	
		sqlSession.delete("member.deleteMember", memId);
	}

	// 회원 정보수정
	@Override
	public MemberDTO updateMember(MemberDTO dto) {
	
		sqlSession.update("member.updateMember", dto);
		return dto;
	}

	// 비밀번호 체크 (회원 수정 및 삭제할때 passwd 체크용도)
	@Override
	
	public boolean checkPw(String memId,String passwd) {
	
		boolean result = false;
		
		Map<String, String> map = new HashMap<>();
		map.put("memId", memId);
		map.put("passwd", passwd);
		int count = sqlSession.selectOne("member.checkPw", map);	// map에 memId, passwd 를 묶어서 넣음
		
		if(count==1) result=true;	// return값 1이면true ,  0이면 false
		
		return result;
	}

	// 로그인 체크
	@Override
	public String loginCheck(MemberDTO dto) {
		
		return sqlSession.selectOne("member.login_check", dto);
	}

	// id찾기
	
	@Override
	public MemberDTO findId(String email)throws Exception{
		return sqlSession.selectOne("member.findId", email);
	}

	@Override
	public int findIdCheck(String email)throws Exception{
		return sqlSession.selectOne("member.findIdCheck", email);
	}
	
}

package com.mycom.member.dao;


import java.util.List;

import com.mycom.member.dto.MemberDTO;

public interface MemberDAO {

	// 전체 회원조회
	public List<MemberDTO> memberList();

	// 회원가입
	public int insertMember(MemberDTO dto);
	
	// 회원 상세조회
	public MemberDTO viewMember(String memId);
	
	// 회원 삭제
	public void deleteMember(String memId);
	
	// 회원 정보수정
	public MemberDTO updateMember(MemberDTO dto);

	// 비밀번호 체크 (회원 수정 및 삭제할때 passwd 체크용도)
	public boolean checkPw(String memId,String passwd );
	
	// 로그인 체크
	public String loginCheck(MemberDTO dto);
	
	// id찾기 
	public MemberDTO findId(String email)throws Exception;
	
	// id 확인
	public int findIdCheck(String email)throws Exception;
}

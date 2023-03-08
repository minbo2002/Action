package com.mycom.member.service;

import java.util.List;
import javax.servlet.http.HttpSession;

import com.mycom.member.dto.MemberDTO;
import com.mycom.member.dto.User;

public interface MemberService {

	// 전체 회원조회
	public List<MemberDTO> memberList();
	
	// 회원가입
	public int insertMember(MemberDTO dto);

	// 회원 상세조회
	public MemberDTO viewMember(String memId);
	
	// 회원 삭제
	public void deleteMember(String memId);
	
	// 회원 정보수정
	public void updateMember(MemberDTO dto);
	
	// 비밀번호 체크 (회원 수정 및 삭제할때 passwd 체크용도)
	public boolean checkPw(String memId,String passwd);
	
	// 로그인 체크
	public MemberDTO loginCheck(MemberDTO dto, HttpSession session);
	
	// 로그아웃
	public void logout(HttpSession session);

	// 회원 id찾기
	public MemberDTO findId(MemberDTO dto)throws Exception;
	
	// 회원 passwd찾기
	public MemberDTO findPasswd(MemberDTO dto)throws Exception;
	
	// db id, 이름 , email 확인
	public int findIdCheck(String memId)throws Exception;
	
	public int findNameCheck(String memName)throws Exception;

	public int findEmailCheck(String email)throws Exception;
}

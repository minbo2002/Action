package com.mycom.member.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.member.controller.MemberController;
import com.mycom.member.dao.MemberDAO;
import com.mycom.member.dto.MemberDTO;
import com.mycom.member.dto.User;



@Service
public class MemberServiceImpl implements MemberService {

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	@Autowired
	MemberDAO memberDAO;
	
	// 전체 회원조회
	@Override
	public List<MemberDTO> memberList() {

		return memberDAO.memberList();
	}

	// 회원가입
	@Override
	public int insertMember(MemberDTO dto) {
		System.out.println("dto:"+dto);
		return memberDAO.insertMember(dto);
		
		
		 
	}
	


	// 회원 상세조회
	@Override
	public MemberDTO viewMember(String memId) {
		logger.info(memId);
		return memberDAO.viewMember(memId);
	}

	// 회원 삭제
	@Override
	public void deleteMember(String memId) {

		memberDAO.deleteMember(memId);
	}

	// 회원 정보수정
	@Override
	public void updateMember(MemberDTO dto) {
		System.out.println("dto:"+dto);
		memberDAO.updateMember(dto);
	}

	// 비밀번호 체크 (회원 수정 및 삭제할때 passwd 체크용도)
	@Override
	public boolean checkPw(String memId, String passwd) {
	
		return memberDAO.checkPw(memId,passwd);
	}

	// 로그인 체크
	@Override
	public MemberDTO loginCheck(MemberDTO dto, HttpSession session) {
	
		// 사용자가 userid, passwd 입력하면 user에 담아서 넘김
		MemberDTO member = memberDAO.loginCheck(dto);

		if(member != null) {

			// userid, name 세션등록
			session.setAttribute("memNo", member.getMemNo());
		    session.setAttribute("email", member.getEmail());
		    session.setAttribute("memGrade",member.getGrade());
			session.setAttribute("memId", member.getmemId());
			session.setAttribute("memName", member.getmemName());
		}
		
		return member;
	}

	// 로그아웃
	@Override
	public void logout(HttpSession session) {
		
		// 세션 초기화
		session.invalidate();
	}
	
	//id 찾기
	@Override
	public MemberDTO findId(MemberDTO dto)throws Exception{
		return memberDAO.findId(dto);
	}
	
	//pw 찾기
	@Override
	public MemberDTO findPasswd(MemberDTO dto)throws Exception{
		return memberDAO.findPasswd(dto);
	}
	
	
	// ----------------------------------
	
	//id확인 
	@Override
	public int findIdCheck(String memId)throws Exception{
		return memberDAO.findIdCheck(memId);
	}
	//이름 확인
	@Override
	public int findNameCheck(String memName)throws Exception{
		return memberDAO.findNameCheck(memName);
	}
	
	//email 확인
	@Override
	public int findEmailCheck(String email)throws Exception{
		return memberDAO.findEmailCheck(email);
	}

	
	

}

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
	public String loginCheck(MemberDTO dto, HttpSession session) {
	
		// 사용자가 userid, passwd 입력하면 user에 담아서 넘김
		String name = memberDAO.loginCheck(dto);

		if(name != null) {

			// userid, name 세션등록
			session.setAttribute("memNo", dto.getMemNo());
		    session.setAttribute("email", dto.getEmail());
		    session.setAttribute("memGrade",dto.getGrade());
			session.setAttribute("memId", dto.getmemId());
			session.setAttribute("name", name);
		}
		
		return name;
	}

	// 로그아웃
	@Override
	public void logout(HttpSession session) {
		
		// 세션 초기화
		session.invalidate();
	}
	
	//id 찾기
	@Override
	public MemberDTO findId(String email)throws Exception{
		return memberDAO.findId(email);
	}
	//id확인 
	@Override
	public int findIdCheck(String email)throws Exception{
		return memberDAO.findIdCheck(email);
	}
	


}

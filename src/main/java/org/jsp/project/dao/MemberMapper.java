package org.jsp.project.dao;

import org.jsp.project.vo.Member;

public interface MemberMapper {
	
	public void insertMember(Member member); //회원가입
	
	public Member idCheck(String id); //회원가입 시 아이디 중복체크
	
	public Member nicnameCheck(String nicname); //회원가입 시 닉네임 중복체크
	
	public Member login(Member member); //로그인 //회원정보 수정 시 정보 불러오는 역할도 함
	
	public void updateMember(Member member); //회원정보 수정
	
	public int deleteMember(Member member); //회원 탈퇴
}

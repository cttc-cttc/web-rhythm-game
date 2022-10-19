package org.jsp.project.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.jsp.project.vo.Member;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements MemberMapper{
	
	@Inject
	private SqlSession session;

	@Override
	public void insertMember(Member member) {
		session.getMapper(MemberMapper.class).insertMember(member);
	}

	@Override
	public Member idCheck(String id) {
		return session.getMapper(MemberMapper.class).idCheck(id);
	}

	@Override
	public Member nicnameCheck(String nicname) {
		return session.getMapper(MemberMapper.class).nicnameCheck(nicname);
	}

	@Override
	public Member login(Member member) {
		return session.getMapper(MemberMapper.class).login(member);
	}

	@Override
	public void updateMember(Member member) {
		session.getMapper(MemberMapper.class).updateMember(member);
	}

	@Override
	public int deleteMember(Member member) {
		return session.getMapper(MemberMapper.class).deleteMember(member);
	}


	

}

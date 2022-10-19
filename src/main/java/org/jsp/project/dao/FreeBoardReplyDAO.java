package org.jsp.project.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.jsp.project.vo.FreeBoardReply;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardReplyDAO implements FreeBoardReplyMapper{
	
	@Inject
	private SqlSession session;

	@Override
	public void insertReply(FreeBoardReply reply) {
		session.getMapper(FreeBoardReplyMapper.class).insertReply(reply);
	}

	@Override
	public ArrayList<FreeBoardReply> selectReply(int boardnum) {
		return session.getMapper(FreeBoardReplyMapper.class).selectReply(boardnum);
	}

	@Override
	public void deleteReply(int replynum) {
		session.getMapper(FreeBoardReplyMapper.class).deleteReply(replynum);
	}
}

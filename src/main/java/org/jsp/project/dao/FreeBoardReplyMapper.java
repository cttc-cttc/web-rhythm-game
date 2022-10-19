package org.jsp.project.dao;

import java.util.ArrayList;

import org.jsp.project.vo.FreeBoardReply;

public interface FreeBoardReplyMapper {
	
	public void insertReply(FreeBoardReply reply); //리플 등록
	
	public ArrayList<FreeBoardReply> selectReply(int boardnum); //게시글에 맞는 리플
	
	public void deleteReply(int replynum); //리플 하나 지우기
}

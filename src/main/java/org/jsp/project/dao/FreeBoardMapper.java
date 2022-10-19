package org.jsp.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.jsp.project.vo.FreeBoard;

public interface FreeBoardMapper { //자유게시판
	
	public void insertFreeBoard(FreeBoard board); //게시판 글 등록
	
	public ArrayList<FreeBoard> showAll(RowBounds rb); //게시판 전체목록 출력
	
	public FreeBoard readFreeBoard(int freeboardnum); //글 하나 읽기
	
	public void hitsUp(int freeboardnum); //조회수 증가
	
	public void updateFreeBoard(FreeBoard board); //글 수정
	
	public void deleteFreeBoard(int freeboardnum); //글 삭제
	
	public int wholeBoardCount(); //전체 게시글 수
	
	
	
}

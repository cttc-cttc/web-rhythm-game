package org.jsp.project.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.jsp.project.vo.FreeBoard;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDAO implements FreeBoardMapper{
	
	@Inject
	private SqlSession session;

	@Override
	public void insertFreeBoard(FreeBoard board) {
		session.getMapper(FreeBoardMapper.class).insertFreeBoard(board);
	}

	@Override
	public ArrayList<FreeBoard> showAll(RowBounds rb) {
		return session.getMapper(FreeBoardMapper.class).showAll(rb);
	}

	@Override
	public FreeBoard readFreeBoard(int freeboardnum) {
		return session.getMapper(FreeBoardMapper.class).readFreeBoard(freeboardnum);
	}

	@Override
	public void hitsUp(int freeboardnum) {
		session.getMapper(FreeBoardMapper.class).hitsUp(freeboardnum);
	}

	@Override
	public void updateFreeBoard(FreeBoard board) {
		session.getMapper(FreeBoardMapper.class).updateFreeBoard(board);
	}

	@Override
	public void deleteFreeBoard(int freeboardnum) {
		session.getMapper(FreeBoardMapper.class).deleteFreeBoard(freeboardnum);
	}

	@Override
	public int wholeBoardCount() {
		return session.getMapper(FreeBoardMapper.class).wholeBoardCount();
	}
	
	
}

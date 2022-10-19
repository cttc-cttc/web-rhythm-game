package org.jsp.project;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.jsp.project.dao.FreeBoardDAO;
import org.jsp.project.dao.FreeBoardReplyDAO;
import org.jsp.project.vo.FreeBoard;
import org.jsp.project.vo.FreeBoardReply;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FreeBoardControl {
	
	@Inject
	private FreeBoardDAO dao;
	
	@RequestMapping("/freeBoard")
	public String freeBoard(String page, Model model) {
		
		int startPage = 1;
		int boardCount = 10;
		int offset = 0;
		
		if(page != null) {
			startPage = Integer.parseInt(page);
			if(startPage <= 0) {
				startPage = 1;
			}
		}
		offset = boardCount * startPage - boardCount;
		
		RowBounds rb = new RowBounds(offset, boardCount);
		
		ArrayList<FreeBoard> freeBoardList = dao.showAll(rb);
		model.addAttribute("freeBoardList", freeBoardList);
		model.addAttribute("page", startPage); //페이지 이동을 위해 페이지 숫자를 넘김
		//전체 글 갯수 추가
		int lastPage = (int) Math.ceil(dao.wholeBoardCount() / (double)boardCount);
		model.addAttribute("lastpage", lastPage);
		
		int i = lastPage;
		model.addAttribute("num", i);
		return "freeBoard/freeBoard";
	}
	
	@RequestMapping("/freeBoardWriteForm")
	public String freeBoardWriteForm() {
		
		return "freeBoard/freeBoardWriteForm";
	}
	
	@RequestMapping("/freeBoardWrite")
	public String freeBoardWrite(FreeBoard board, Model model) {
		dao.insertFreeBoard(board);
		
		return "redirect:freeBoard";
	}
	
	@RequestMapping("/readFreeBoard")
	public String readFreeBoard(int boardnum, Model model) {
		dao.hitsUp(boardnum);
		
		FreeBoard readBoard = dao.readFreeBoard(boardnum);
		model.addAttribute("readBoard", readBoard);
		
		return "freeBoard/freeBoardRead";
	}
	
	@RequestMapping("/updateFreeBoardForm")
	public String updateFreeBoardForm(int boardnum, Model model) {
		FreeBoard readBoard = dao.readFreeBoard(boardnum);
		model.addAttribute("readBoard", readBoard);
		
		return "freeBoard/updateFreeBoardForm";
	}	
	
	@RequestMapping("/freeBoardUpdate")
	public String freeBoardUpdate(FreeBoard board) {
		dao.updateFreeBoard(board);
		int boardNumber = board.getFreeboardnum();
		
		return "redirect:readFreeBoard?boardnum="+boardNumber; //수정된 글로 이동
	}
	
	@RequestMapping("/deleteFreeBoard")
	public String deleteFreeBoard(int boardnum) {
		dao.deleteFreeBoard(boardnum);
		
		return "redirect:freeBoard";
	}
	
	
}

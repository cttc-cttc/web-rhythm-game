package org.jsp.project;

import java.util.ArrayList;

import javax.inject.Inject;

import org.jsp.project.dao.FreeBoardReplyDAO;
import org.jsp.project.vo.FreeBoardReply;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FreeBoardReplyControl {
	
	@Inject
	private FreeBoardReplyDAO dao;
	
	@ResponseBody
	@RequestMapping(value = "/writeReply", method = RequestMethod.POST)
	public void writeReply(FreeBoardReply reply) {
			dao.insertReply(reply); //댓글 등록
	}
	
	@ResponseBody
	@RequestMapping(value = "/showReply", method = RequestMethod.POST)
	public ArrayList<FreeBoardReply> showReply(int freeboardnum) {
		//댓글 출력
		ArrayList<FreeBoardReply> freeReply = dao.selectReply(freeboardnum);
		//원래는 freeboardnum이 String이지만 json 관련 디펜던시 때문에 자동으로 변환해줌
	
		return freeReply;
	}	
	
	@ResponseBody
	@RequestMapping(value = "/deleteReply", method = RequestMethod.POST)
	public void deleteReply(int replynum) {
		dao.deleteReply(replynum);
	}
	
}

package org.jsp.project;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.jsp.project.dao.ScoreDAO;
import org.jsp.project.vo.ScoreInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ScoreControl {
	
	@Inject
	private ScoreDAO dao;
	
	@RequestMapping("/scoreBoard")
	public String scoreBoard() {
		return "score/scoreBoard";
	}
	
	@ResponseBody
	@RequestMapping(value = "/sendScore", method = RequestMethod.POST)
	public void sendScore(ScoreInfo userData) {
		ScoreInfo scoreInfo = dao.musicScore(userData);
	
		if(scoreInfo == null) {
			dao.insertScore(userData);
		}else {
			dao.updateScore(userData); //기존보다 점수가 낮으면 업데이트 되지 않음
		}
	}
	
	@RequestMapping("/scoreConfirm")
	public String scoreConfirm(String musicTitle, Model model) {
		ArrayList<ScoreInfo> scoreInfo = dao.partMusicScore(musicTitle);
		model.addAttribute("scoreInfo", scoreInfo);
		model.addAttribute("musicTitle", musicTitle);
		
		return "score/musicScore";
	}
}

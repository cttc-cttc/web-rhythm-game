package org.jsp.project.dao;

import java.util.ArrayList;

import org.jsp.project.vo.ScoreInfo;

public interface ScoreMapper {

	public void insertScore(ScoreInfo score); //게임 끝나면 점수 자동 등록
	
	public ScoreInfo musicScore(ScoreInfo userData); //패턴 종류마다 유저 별 점수 출력 
	
	public void updateScore(ScoreInfo userData); //점수 업데이트 (결과 점수가 같거나 높을 때)
	
	public ArrayList<ScoreInfo> partMusicScore(String musicName); //곡별 유저 점수 출력
	
}

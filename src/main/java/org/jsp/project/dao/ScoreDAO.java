package org.jsp.project.dao;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.jsp.project.vo.ScoreInfo;
import org.springframework.stereotype.Repository;

@Repository
public class ScoreDAO implements ScoreMapper{

	@Inject
	private SqlSession session;

	@Override
	public void insertScore(ScoreInfo score) {
		session.getMapper(ScoreMapper.class).insertScore(score);
	}

	@Override
	public ScoreInfo musicScore(ScoreInfo userData) {
		return session.getMapper(ScoreMapper.class).musicScore(userData);
	}

	@Override
	public void updateScore(ScoreInfo userData) {
		session.getMapper(ScoreMapper.class).updateScore(userData);
	}

	@Override
	public ArrayList<ScoreInfo> partMusicScore(String musicName) {
		return session.getMapper(ScoreMapper.class).partMusicScore(musicName);
	}
	
	
}

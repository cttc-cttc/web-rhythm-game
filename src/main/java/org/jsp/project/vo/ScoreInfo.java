package org.jsp.project.vo;

public class ScoreInfo {
	private String id;
	private String nicname;
	private String musictitledif;
	private int score;
	public ScoreInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ScoreInfo(String id, String nicname, String musictitledif, int score) {
		super();
		this.id = id;
		this.nicname = nicname;
		this.musictitledif = musictitledif;
		this.score = score;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNicname() {
		return nicname;
	}
	public void setNicname(String nicname) {
		this.nicname = nicname;
	}
	public String getMusictitledif() {
		return musictitledif;
	}
	public void setMusictitledif(String musictitledif) {
		this.musictitledif = musictitledif;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "ScoreInfo [id=" + id + ", nicname=" + nicname + ", musictitledif=" + musictitledif + ", score=" + score
				+ "]";
	}
	
}

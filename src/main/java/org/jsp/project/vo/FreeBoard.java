package org.jsp.project.vo;

public class FreeBoard {
	private int freeboardnum;
	private String id;
	private String nicname;
	private String title;
	private String content;
	private String indate;
	private int hits;
	public FreeBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FreeBoard(int freeboardnum, String id,String nicname, String title, String content, String indate, int hits) {
		super();
		this.freeboardnum = freeboardnum;
		this.id = id;
		this.nicname = nicname;
		this.title = title;
		this.content = content;
		this.indate = indate;
		this.hits = hits;
	}
	public int getFreeboardnum() {
		return freeboardnum;
	}
	public void setFreeboardnum(int freeboardnum) {
		this.freeboardnum = freeboardnum;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	@Override
	public String toString() {
		return "FreeBoard [freeboardnum=" + freeboardnum + ", id=" + id + ", nicname=" + nicname + ", title=" + title + ", content=" + content
				+ ", indate=" + indate + ", hits=" + hits + "]";
	}
	
}

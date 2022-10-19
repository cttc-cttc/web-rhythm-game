package org.jsp.project.vo;

public class FreeBoardReply {
	private int replynum;
	private int freeboardnum;
	private String id;
	private String nicname;
	private String replycontent;
	private String replyindate;
	public FreeBoardReply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FreeBoardReply(int replynum, int freeboardnum, String id, String nicname, String replycontent,
			String replyindate) {
		super();
		this.replynum = replynum;
		this.freeboardnum = freeboardnum;
		this.id = id;
		this.nicname = nicname;
		this.replycontent = replycontent;
		this.replyindate = replyindate;
	}
	public int getReplynum() {
		return replynum;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
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
	public String getReplycontent() {
		return replycontent;
	}
	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}
	public String getReplyindate() {
		return replyindate;
	}
	public void setReplyindate(String replyindate) {
		this.replyindate = replyindate;
	}
	@Override
	public String toString() {
		return "FreeBoardReply [replynum=" + replynum + ", freeboardnum=" + freeboardnum + ", id=" + id + ", nicname="
				+ nicname + ", replycontent=" + replycontent + ", replyindate=" + replyindate + "]";
	}
	
}

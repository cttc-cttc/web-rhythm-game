package org.jsp.project.vo;

public class Member {
	private String id;
	private String password;
	private String nicname;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String id, String password, String nicname) {
		super();
		this.id = id;
		this.password = password;
		this.nicname = nicname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNicname() {
		return nicname;
	}
	public void setNicname(String nicname) {
		this.nicname = nicname;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", nicname=" + nicname + "]";
	}
	
	
}

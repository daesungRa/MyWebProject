package com.myweb.board;

public class BoardVo {
	private int serial;
	private int gno;
	private int pno;
	private int depth;
	private int indent;
	private String userId;
	private String userPwd;
	private String subject;
	private String content;
	private int hit;
	private String bDate;
	
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getbDate() {
		return bDate;
	}
	public void setbDate(String bDate) {
		this.bDate = bDate;
	}
	
	// toJson
	public String toJson() {
		return "{\"serial\" : \"" + serial + "\", \"gno\" : \"" + gno + "\", \"pno\" : \"" + pno + "\", \"depth\" : \"" + depth + "\", \"indent\" : \"" + indent
				+ "\", \"userId\" : \"" + userId + "\", \"userPwd\" : \"" + userPwd + "\", \"subject\" : \"" + subject + "\", \"content\" : \"" + content
				+ "\", \"hit\" : \"" + hit + "\", \"bDate\" : \"" + bDate + "\"}";
	}
	
	
}

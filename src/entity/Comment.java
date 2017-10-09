package entity;

import java.util.Date;

public class Comment {
	
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUimage() {
		return uimage;
	}
	public void setUimage(String uimage) {
		this.uimage = uimage;
	}
	
	
	public Comment() {
		super();
	}
	
	
	
	public Comment(int userid, int sId, String message, Date date, String username, String uimage) {
		super();
		this.userid = userid;
		this.sId = sId;
		this.message = message;
		this.date = date;
		this.username = username;
		this.uimage = uimage;
	}

	
	public Comment(int cId, int userid, int sId, String message, Date date, String username, String uimage) {
		super();
		this.cId = cId;
		this.userid = userid;
		this.sId = sId;
		this.message = message;
		this.date = date;
		this.username = username;
		this.uimage = uimage;
	}

	
	private int cId;
	private int userid;
	private int sId;
	private String message;
	private Date date;
	private String username;
	private String uimage;
	
	
	
	

}

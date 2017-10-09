package entity;

import java.util.Date;

public class Collection {
	public Collection(int id, int userid, String username, int aId, String aName, int c_flag, Date dATE) {
		super();
		this.id = id;
		this.userid = userid;
		this.username = username;
		this.aId = aId;
		this.aName = aName;
		this.c_flag = c_flag;
		DATE = dATE;
	}

	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getaId() {
		return aId;
	}

	public void setaId(int aId) {
		this.aId = aId;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public int getC_flag() {
		return c_flag;
	}

	public void setC_flag(int c_flag) {
		this.c_flag = c_flag;
	}

	public Date getDATE() {
		return DATE;
	}

	public void setDATE(Date dATE) {
		DATE = dATE;
	}

	public Collection() {
		super();
	}
	
	private int id;
	public Collection(int userid, String username, int aId, String aName, int c_flag, Date dATE) {
		super();
		this.userid = userid;
		this.username = username;
		this.aId = aId;
		this.aName = aName;
		this.c_flag = c_flag;
		DATE = dATE;
	}

	private int userid;
	private String username;
	private int aId;
	private String aName;
	private int c_flag;
	private Date DATE;

}

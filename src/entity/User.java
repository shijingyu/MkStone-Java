package entity;

public class User {

	private int userid; // 用户ID
	private String username; // 用户名
	private String password; // 用户密码
	private String email; // 用户邮箱
	private String phone; // 用户手机号
	private String uimage; // 用户头像

	public User(int userid, String username, String password, String email, String phone, String uimage) {
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.uimage = uimage;
	}

	public User(String username, String password, String email, String phone, String uimage) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.uimage = uimage;
	}

	public User() {
		super();
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUimage() {
		return uimage;
	}

	public void setUimage(String uimage) {
		this.uimage = uimage;
	}

}

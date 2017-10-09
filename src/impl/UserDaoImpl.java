package impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.UserDao;
import entity.User;
import utils.DBUtils;

public class UserDaoImpl implements UserDao {
	/**
	 * 用户登录
	 */
	public boolean loginUser(String name, String pwd) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		String sql = "select * from users where username = ? and password = ?";
		ResultSet rs = db.execQuery(sql, name, pwd);

		try {
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closeAll();
		}

		return false;
	}

	/**
	 * 注册用户
	 */
	public int addUser(User user) {
		DBUtils db = new DBUtils();
		String sql = "insert into users(username,password,email,phone,uimage) values(?,?,?,?,?)";
		return db.execUpdate(sql, user.getUsername(), user.getPassword(), user.getEmail(), user.getPhone(),
				user.getUimage());
	}

	/**
	 * 改变密码
	 */
	public int changePwd(String pwd, String phone) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		String sql = "update users set password=? where phone=?";
		return db.execUpdate(sql, pwd, phone);
	}

	/**
	 * 编辑信息
	 */
	public int editInfo(String email, String phone, String username) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		String sql = "update users set email=?,phone=? where username=?";
		return db.execUpdate(sql, email, phone, username);
	}

	/**
	 * 得到用户信息
	 */
	public List<User> getUserInfo(String name) {
		DBUtils db = new DBUtils();
		List<User> list = new ArrayList<User>();
		String sql = "select userid,email,phone,uimage from users where username=?";
		ResultSet rs = db.execQuery(sql, name);
		try {
			if (rs.next()) {
				User login_user = new User();
				login_user.setUserid(rs.getInt("userid"));
				login_user.setEmail(rs.getString("email"));
				login_user.setPhone(rs.getString("phone"));
				login_user.setUimage(rs.getString("uimage"));
				list.add(login_user);
				return list;
			} else {
				return null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	/**
	 * 改变用户头像
	 */
	public int changeUimage(String uimage, String username) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		String sql = "update users set uimage=? where username=?";
		return db.execUpdate(sql, uimage, username);
	}

	/**
	 * 得到所有用户
	 */
	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		List<User> list = new ArrayList<User>();
		String sql = "select * from users";
		ResultSet rs = db.execQuery(sql);
		try {
			while (rs.next()) {
				User All_User = new User();
				All_User.setUserid(rs.getInt("userid"));
				All_User.setUsername(rs.getString("username"));
				All_User.setPassword(rs.getString("password"));
				All_User.setEmail(rs.getString("email"));
				All_User.setPhone(rs.getString("phone"));
				All_User.setUimage(rs.getString("uimage"));
				list.add(All_User);
			} 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}

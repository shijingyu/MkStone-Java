package dao;

import java.util.List;

import entity.User;

public interface UserDao {
	public boolean loginUser(String name, String pwd);

	public int addUser(User user);

	public int changePwd(String pwd, String phone);

	public int editInfo(String email, String phone, String username);

	public List<User> getUserInfo(String name);

	public int changeUimage(String uimage, String username);
	
	public List<User> getAllUser();
	
}

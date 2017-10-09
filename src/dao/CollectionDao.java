package dao;

import java.util.List;

import entity.Collection;


public interface CollectionDao {
	public List<Collection> listCollection(String username);		//根据用户名获得该用户的收藏的文章
	
	public int addCollection(Collection collection);			//添加收藏
	
	public int cancelCollection(int aId,int userid);	//取消收藏，传值参数为用户id，文章Id
	
}

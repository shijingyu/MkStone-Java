package dao;

import java.util.List;

import entity.Collection;


public interface CollectionDao {
	public List<Collection> listCollection(String username);		//�����û�����ø��û����ղص�����
	
	public int addCollection(Collection collection);			//����ղ�
	
	public int cancelCollection(int aId,int userid);	//ȡ���ղأ���ֵ����Ϊ�û�id������Id
	
}

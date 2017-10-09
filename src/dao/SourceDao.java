package dao;

import java.util.List;

import entity.Source;

public interface SourceDao {
	public List<Source> getAllSource(); // 得到所有资源

	public List<Source> getAllSourceById(int sId); // 得到Id得到所有资源

	public List<Source> getSourceByType(String sType); // 根据类型得到资源

	public int deleteSourceByName(String name); // 根据名字删除资源

	public int editSourceByName(String newname, String description, String size, String support, String type,String name); //根据名字编辑资源					
	
	public int addSource(Source source);		//添加资源

	public int deleteSourceById(int id );	//根据Id删除资源

}

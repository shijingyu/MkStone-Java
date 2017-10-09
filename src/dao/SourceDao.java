package dao;

import java.util.List;

import entity.Source;

public interface SourceDao {
	public List<Source> getAllSource(); // �õ�������Դ

	public List<Source> getAllSourceById(int sId); // �õ�Id�õ�������Դ

	public List<Source> getSourceByType(String sType); // �������͵õ���Դ

	public int deleteSourceByName(String name); // ��������ɾ����Դ

	public int editSourceByName(String newname, String description, String size, String support, String type,String name); //�������ֱ༭��Դ					
	
	public int addSource(Source source);		//�����Դ

	public int deleteSourceById(int id );	//����Idɾ����Դ

}

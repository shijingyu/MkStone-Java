package dao;

import java.util.List;

import entity.Article;
import entity.Source;
import entity.User;

public interface ArticleDao {

	public List<Article> getAllArticle();	//Î´µÇÂ¼×´Ì¬ÎÄÕÂÒ³Ãæ

	public int releaseArticle(Article article);
	
	public List<Article> getArticleByType(String aType); 
	
	public int deleteArticleByName(String name);
	
	public int editArticleByName(String newname, String content, String author, String type,String name); 
	
	public int deleteArticleById(int id );
	
	public List<Article> getArticleInfo(int aId);
	
	public List<Article> getCollection(int uid);
	
	public int getFlag(int uid,int aid);
}

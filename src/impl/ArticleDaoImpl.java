package impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.ArticleDao;
import entity.Article;
import entity.Collection;
import utils.DBUtils;

public class ArticleDaoImpl implements ArticleDao {

	@Override
	public List<Article> getAllArticle() {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		List<Article> list = new ArrayList<Article>();
		String sql = "select * from article";
		ResultSet rs = db.execQuery(sql);
		try {
			while (rs.next()) {
				Article article = new Article();
				article.setaId(rs.getInt("aId"));
				article.setaName(rs.getString("aName"));
				article.setaContent(rs.getString("aContent"));
				article.setaPicture(rs.getString("aPicture"));
				article.setaAuthor(rs.getString("aAuthor"));
				article.setaDate(rs.getString("aDate"));
				article.setaType(rs.getString("aType"));
				list.add(article);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int releaseArticle(Article article) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		String sql = "insert into article(aName,aAuthor,aType,aPicture,aContent,aDate) values(?,?,?,?,?,?)";
		return db.execUpdate(sql, article.getaName(), article.getaAuthor(), article.getaType(), article.getaPicture(),
				article.getaContent(), article.getaDate());

	}

	
	@Override
	public List<Article> getArticleByType(String aType) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		List<Article> list = new ArrayList<Article>();
		String sql = "select * from article where aType=?";
		ResultSet rs = db.execQuery(sql, aType);
		try {
			while (rs.next()) {
				Article article = new Article();
				article.setaId(rs.getInt("aId"));
				article.setaName(rs.getString("aName"));
				article.setaContent(rs.getString("aContent"));
				article.setaPicture(rs.getString("aPicture"));
				article.setaAuthor(rs.getString("aAuthor"));
				article.setaDate(rs.getString("aDate"));
				article.setaType(rs.getString("aType"));
				list.add(article);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public int deleteArticleByName(String name) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		String sql = "delete from article where aName=?";
		return db.execUpdate(sql, name);
	}

	@Override
	public int editArticleByName(String newname, String content, String author, String type, String name) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		String sql = "update article set aName=?,aContent=?,aAuthor=?,aType=? where aName=?";
		return db.execUpdate(sql, newname, content, author, type, name);
	}

	@Override
	public int deleteArticleById(int id) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		String sql = "delete from article where aId=?";
		return db.execUpdate(sql, id);
	}

	@Override
	public List<Article> getArticleInfo(int aId) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		List<Article> list = new ArrayList<Article>();
		String sql = "select aId,aName,aContent,aPicture,aAuthor,aDate,aType from article where aId=?";
		ResultSet rs = db.execQuery(sql, aId);
		try {
			if (rs.next()) {
				Article article = new Article();
				article.setaId(rs.getInt("aId"));
				article.setaName(rs.getString("aName"));
				article.setaContent(rs.getString("aContent"));
				article.setaPicture(rs.getString("aPicture"));
				article.setaAuthor(rs.getString("aAuthor"));
				article.setaDate(rs.getString("aDate"));
				article.setaType(rs.getString("aType"));
				list.add(article);
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
	public List<Article> getCollection(int uid) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		String sql="select * from article";
		ResultSet rs=db.execQuery(sql);
		List<Article> list=new ArrayList<Article>();
		try {
			while(rs.next()){
				int aid=rs.getInt("aId");
				Article article = new Article();
				article.setaId(rs.getInt("aId"));
				article.setaName(rs.getString("aName"));
				article.setaContent(rs.getString("aContent"));
				article.setaPicture(rs.getString("aPicture"));
				article.setaAuthor(rs.getString("aAuthor"));
				article.setaDate(rs.getString("aDate"));
				article.setaType(rs.getString("aType"));
				article.setaCollection(getFlag(uid, aid));
				list.add(article);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int getFlag(int uid, int aid) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		String sql="select c_flag from collection where userid=? and aId=?";
		ResultSet rs=db.execQuery(sql, uid,aid);
		try {
			if(rs.next()){
				return 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}

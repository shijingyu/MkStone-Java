package impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.CommentDao;
import entity.Comment;
import utils.DBUtils;

public class CommentDaoImpl implements CommentDao {

	@Override
	/**
	 * µÃµ½ÆÀÂÛ
	 */
	public List<Comment> getComent(int sId) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		List<Comment> list = new ArrayList<Comment>();
		String sql = "select cId,comment.userid,comment.sId,message,date,username,uimage from comment,source,users where comment.sId=source.sId and "
				+ "comment.userid=users.userid and "
				+ "source.sId=?";
		ResultSet rs = db.execQuery(sql, sId);
		try {
			while (rs.next()) {
				Comment comment = new Comment();
				comment.setcId(rs.getInt("cId"));
				comment.setUserid(rs.getInt("comment.userid"));
				comment.setsId(rs.getInt("comment.sId"));
				comment.setMessage(rs.getString("message"));
				comment.setDate(rs.getDate("date"));
				comment.setUsername(rs.getString("username"));
				comment.setUimage(rs.getString("uimage"));
				list.add(comment);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int releaseComment(Comment comment) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		String sql = "insert into comment(userid,sId,message,date) values(?,?,?,?)";
		return db.execUpdate(sql, comment.getUserid(),comment.getsId(),comment.getMessage(),comment.getDate());
	}

	
}

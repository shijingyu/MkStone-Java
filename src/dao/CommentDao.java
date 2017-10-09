package dao;

import java.util.List;

import entity.Comment;

public interface CommentDao {
	public List<Comment> getComent(int sId);
	public int releaseComment(Comment comment);
}

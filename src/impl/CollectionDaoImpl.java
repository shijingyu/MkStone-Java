package impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.CollectionDao;
import entity.Collection;
import utils.DBUtils;

public class CollectionDaoImpl implements CollectionDao {

	@Override
	public List<Collection> listCollection(String username) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		List<Collection> list = new ArrayList<Collection>();
		String sql = "select id,collection.userid,collection.aId,DATE,username,aName from collection,article,users where collection.aId=article.aId and "
				+ "collection.userid=users.userid and "
				+ "username=? and c_flag=1";
		ResultSet rs = db.execQuery(sql,username);
		try {
			while (rs.next()) {
				Collection collection = new Collection();
				collection.setId(rs.getInt("id"));
				collection.setUserid(rs.getInt("collection.userid"));
				collection.setaId(rs.getInt("collection.aId"));
				collection.setDATE(rs.getDate("DATE"));
				collection.setUsername("username");
				collection.setaName(rs.getString("aName"));
				list.add(collection);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int addCollection(Collection collection) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		String sql = "insert into collection(userid,aId,c_flag,DATE) values(?,?,?,?)";
		return db.execUpdate(sql, collection.getUserid(),collection.getaId(),collection.getC_flag(),collection.getDATE());
	}

	@Override
	public int cancelCollection(int aId,int userid) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		String sql = "delete from collection  where aId=? and userid=?";
		return db.execUpdate(sql,aId,userid);
	}

}

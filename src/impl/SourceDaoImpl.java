package impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.SourceDao;
import entity.Article;
import entity.Source;
import utils.DBUtils;

public class SourceDaoImpl implements SourceDao {

	@Override
	public List<Source> getAllSource() {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		List<Source> list = new ArrayList<Source>();
		String sql = "select * from source";
		ResultSet rs = db.execQuery(sql);
		try {
			while (rs.next()) {
				Source source = new Source();
				source.setsId(rs.getInt("sId"));
				source.setsName(rs.getString("sName"));
				source.setsDescription(rs.getString("sDescription"));
				source.setsPicture(rs.getString("sPicture"));
				source.setsSize(rs.getString("sSize"));
				source.setsDate(rs.getString("sDate"));
				source.setsType(rs.getString("sType"));
				source.setsSupport(rs.getString("sSupport"));
				list.add(source);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Source> getAllSourceById(int sId) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		List<Source> list = new ArrayList<Source>();
		String sql = "select * from source where sId=?";
		ResultSet rs = db.execQuery(sql, sId);
		try {
			if (rs.next()) {
				Source source = new Source();
				source.setsId(rs.getInt("sId"));
				source.setsName(rs.getString("sName"));
				source.setsDescription(rs.getString("sDescription"));
				source.setsPicture(rs.getString("sPicture"));
				source.setsSize(rs.getString("sSize"));
				source.setsDate(rs.getString("sDate"));
				source.setsType(rs.getString("sType"));
				source.setsSupport(rs.getString("sSupport"));
				list.add(source);
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
	public List<Source> getSourceByType(String sType) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		List<Source> list = new ArrayList<Source>();
		String sql = "select * from source where sType=?";
		ResultSet rs = db.execQuery(sql, sType);
		try {
			while (rs.next()) {
				Source source = new Source();
				source.setsId(rs.getInt("sId"));
				source.setsName(rs.getString("sName"));
				source.setsDescription(rs.getString("sDescription"));
				source.setsPicture(rs.getString("sPicture"));
				source.setsSize(rs.getString("sSize"));
				source.setsDate(rs.getString("sDate"));
				source.setsType(rs.getString("sType"));
				source.setsSupport(rs.getString("sSupport"));
				list.add(source);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	
	public int deleteSourceByName(String name) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		String sql = "delete from source where sName=?";
		return db.execUpdate(sql, name);
	}

	@Override
	public int editSourceByName(String newname, String description, String size, String support, String type,
			String name) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		String sql = "update source set sName=?,sDescription=?,sSize=?,sSupport=?,sType=? where sName=?";
		return db.execUpdate(sql, newname, description, size, support, type, name);
	}

	@Override
	public int addSource(Source source) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		String sql ="insert into source(sName,sDescription,sSize,sDate,sType,sSupport,sPicture) values(?,?,?,?,?,?,?)";
		return db.execUpdate(sql, source.getsName(),source.getsDescription(),source.getsSize(),source.getsDate(),source.getsType(),source.getsSupport(),source.getsPicture());
	}

	
	@Override
	public int deleteSourceById(int id) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		String sql = "delete from source where sId=?";
		return db.execUpdate(sql, id);
	}

}

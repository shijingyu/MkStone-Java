package impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import dao.AdminDao;
import utils.DBUtils;

public class AdminDaoImpl implements AdminDao {

	@Override
	public boolean adminLogin(String name, String password) {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		String sql = "select * from admin where adminName = ? and adminPwd = ?";
		ResultSet rs = db.execQuery(sql, name, password);
		try {
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closeAll();
		}

		return false;
	}

}

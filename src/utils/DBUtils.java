package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtils {
	private static final String DBDRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/mkstone?useUnicode=true&characterEncoding=utf8&";
	private static final String USER = "root";
	private static final String PASSWORD = "123";

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public Connection getConn() {
		try {
			Class.forName(DBDRIVER);
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return conn;
	}

	public ResultSet execQuery(String sql, Object... param) {
		try {
			conn = getConn();
			ps = conn.prepareStatement(sql);

			for (int i = 0; i < param.length; i++) {
				ps.setObject(i + 1, param[i]);
			}

			rs = ps.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return rs;
	}

	public int execUpdate(String sql, Object... param) {
		int num = 0;
		try {
			conn = getConn();
			ps = conn.prepareStatement(sql);

			for (int i = 0; i < param.length; i++) {
				ps.setObject(i + 1, param[i]);
			}

			num = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}

		return num;
	}

	public void closeAll() {

		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

package dao;

import java.sql.*;

import model.Model;

public class Dao {
	static Connection con;
	static {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			con = DriverManager.getConnection("jdbc:db2://localhost:50000/sst", "admin", "Kalpit@123");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static int register(Model m, String sql) throws SQLException {
		PreparedStatement ps = con.prepareStatement(sql);
		int i = ps.executeUpdate();
		return i;
	}

	public static ResultSet validate(Model m, String sql) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		return rs;
	}

}

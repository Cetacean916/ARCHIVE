package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBmanager {
	
	public static Connection getConnection() {
		Connection con = null;
		
		try {
			Context init = new InitialContext();
			Context env = (Context)init.lookup("java:/comp/env");
			DataSource ds = (DataSource) env.lookup("jdbc/OracleDB");
			con = ds.getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	// select 후 close 메소드 (Statement)
	public static void close(Connection con, Statement st, ResultSet rs) {
		try {
			if(rs != null) {
				rs.close();
			}
			if(st != null) {
				st.close();
			}
			if(con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// select 후 close 메소드 (PreparedStatement)
		public static void close(Connection con, PreparedStatement ps, ResultSet rs) {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
				if(con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	// DML(insert, update, delete) 수행 후 close 메소드
	public static void close(Connection con, PreparedStatement ps) {
		try {
			if(ps != null) {
				ps.close();
			}
			if(con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

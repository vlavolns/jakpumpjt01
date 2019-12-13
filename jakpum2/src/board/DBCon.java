package board;

import java.sql.*;
import java.sql.DriverManager;

public class DBCon {
	public static Connection getCon() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
		return con;
	}
	public static void close(Connection con,PreparedStatement ps, ResultSet rs) {
		if(rs!=null) {
			try {rs.close();}catch(Exception ex) {ex.printStackTrace();}
		}
		if(ps!=null) {
			try {ps.close();}catch(Exception ex) {ex.printStackTrace();}
		}
		if(con!=null) {
			try {con.close();}catch(Exception ex) {ex.printStackTrace();}
		}
	}
}

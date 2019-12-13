package templet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class joinDAO {
	public static joinDTO readDB(String userId) {
		joinDTO user = new joinDTO();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from jakpumuser where id = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			rs= ps.executeQuery();
			if(rs.next()) {
				user.setName(rs.getString("name"));
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				user.setTel(rs.getString("tel"));
				user.setJob(rs.getString("job"));
				user.setGender(rs.getInt("gender"));
				user.setHobby(rs.getString("hobby"));
				user.setIntro(rs.getString("intro"));
			}else {
				user.setId(null);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			DBCon.close(con, ps, rs);
		}
		return user;
	}
	public static List<joinDTO> readDBList(){
		List<joinDTO> list = new ArrayList<joinDTO>();
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from jakpumuser";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				joinDTO user = new joinDTO();
				user.setName(rs.getString("name"));
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				user.setTel(rs.getString("tel"));
				user.setJob(rs.getString("job"));
				user.setGender(rs.getInt("gender"));
				user.setHobby(rs.getString("hobby"));
				user.setIntro(rs.getString("intro"));
				list.add(user);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			DBCon.close(con, ps, rs);
		}
		return list;
	}
	public static int insertDB(joinDTO user) {
		int result =-1;
		Connection con =null;
		PreparedStatement ps = null;
		String query = "insert into jakpumuser (id,name,password,tel,job,gender,hobby,intro) values(?,?,?,?,?,?,?,?)";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(query);
			ps.setString(1, user.getId());
			ps.setString(2, user.getName());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getTel());
			ps.setString(5, user.getJob());
			ps.setInt(6, user.getGender());
			ps.setString(7, user.getHobby());
			ps.setString(8, user.getIntro());
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBCon.close(con, ps, null);
		}
		return result;
	}
	public static int deleteDB(String userId) {
		int result = -1;
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "delete jakpumuser where id = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBCon.close(con, ps, null);
		}
		return result;
	}
	public static int updateDB(joinDTO user) {
		int result = -1;
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "update jakpumuser set name=?, password=?, tel=?,job=?,gender=?,hobby=?,intro=? where id = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getTel());
			ps.setString(4, user.getJob());
			ps.setInt(5, user.getGender());
			ps.setString(6, user.getHobby());
			ps.setString(7, user.getIntro());
			ps.setString(8, user.getId());
			result = ps.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			DBCon.close(con, ps, null);
		}
		return result;
	}
	public static boolean idcheck(String userId) {
		Connection con = null;
		Statement stmt =null;
		try {
			con =DBCon.getCon();
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select id from jakpumuser where id ='"+userId+"'");
			if(rs.next()) {
				return true;
			}
			else {
				return false;
			}
		}
			catch(Exception ex) {
				ex.printStackTrace();
			}
		
		return false;
	}
}

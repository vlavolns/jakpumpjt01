package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BorderDAO {
	public static BorderDTO readDB(int bno) {
		BorderDTO border = new BorderDTO();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from tbl_border where bno = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, bno);
			rs= ps.executeQuery();
			if(rs.next()) {
				border.setBno(rs.getInt("bno"));
				border.setTitle(rs.getString("title"));
				String content = rs.getString("content");
				/*content = content.replaceAll("`", "'");
				content = content.replaceAll("\r\n", "<br>");
				content = content.replaceAll("\u0020", "&nbsp;");*/
				border.setContent(content);
				border.setWriter(rs.getString("writer"));
				border.setRegdate(rs.getDate("regdate"));
				border.setUpdatedate(rs.getDate("updatedate"));
				border.setReadcnt(rs.getInt("readcnt"));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			DBCon.close(con, ps, rs);
		}
		return border;
	}
	public static List<BorderDTO> readDBList(int pageNo){
		List<BorderDTO> list = new ArrayList<BorderDTO>();
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int pageLine = 5;
		int end = pageNo*pageLine;
		int start = end-pageLine+1;
		String sql = "select b.* from"
				+ "(select rownum rn,a.*from "
				+ "(select * from tbl_border order by bno desc)a "
				+ ")b where b.rn between "+start+" and "+end;
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				BorderDTO border = new BorderDTO();
				border.setBno(rs.getInt("bno"));
				border.setTitle(rs.getString("title"));
				border.setWriter(rs.getString("writer"));
				border.setRegdate(rs.getDate("regdate"));
				border.setUpdatedate(rs.getDate("updatedate"));
				border.setReadcnt(rs.getInt("readcnt"));
				list.add(border);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			DBCon.close(con, ps, rs);
		}
		return list;
	}
	public static int totalCnt() {
		int cnt = 0;
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select count(bno) from tbl_border";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			DBCon.close(con, ps, rs);
		}
		return cnt;
	}
	public static int maxCnt() {
		int cnt = 0;
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select max(bno) from tbl_border";
		try {
			con = DBCon.getCon();
			ps=con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			DBCon.close(con, ps, rs);
		}
		return cnt;
	}
	
	public static int insertDB(BorderDTO border) {
		int result =-1;
		Connection con =null;
		PreparedStatement ps = null;
		String query = "insert into tbl_border (bno,title,content,writer) values(?,?,?,?)";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(query);
			ps.setInt(1, border.getBno());
			ps.setString(2, border.getTitle());
			ps.setString(3, border.getContent());
			ps.setString(4, border.getWriter());
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBCon.close(con, ps, null);
		}
		return result;
	}
	public static int deleteDB(int bno) {
		int result = -1;
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "delete tbl_border where bno = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, bno);
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBCon.close(con, ps, null);
		}
		return result;
	}
	public static int updateDB(BorderDTO border) {
		int result = -1;
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "update tbl_border set title=?,content=?,updatedate=sysdate where bno = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, border.getTitle());
			ps.setString(2, border.getContent());
			ps.setInt(3, border.getBno());
			result = ps.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			DBCon.close(con, ps, null);
		}
		return result;
	}
	
	public static int updatecnt(BorderDTO border) {
		int result = -1;
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "update tbl_border set readcnt=? where bno = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, border.getReadcnt());
			ps.setInt(2, border.getBno());
			result = ps.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			DBCon.close(con, ps, null);
		}
		return result;
	}
}

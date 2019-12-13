package book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import templet.DBCon;

public class bookDAO {
	public static bookDTO readDB(String type,String value) {
		bookDTO book = new bookDTO();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from booklist where " + type + " = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, value);
			rs= ps.executeQuery();
			if(rs.next()) {
				book.setBCD(rs.getString(1));
				book.setFCD(rs.getInt(2));
				book.setTITLE(rs.getString(3));
				book.setWRITER(rs.getString(4));
				book.setPUBLISH(rs.getString(5));
				book.setPRICE(rs.getInt(6));
				book.setBCNT(rs.getInt(7));
			}else {
				book.setBCD(null);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			DBCon.close(con, ps, rs);
		}
		return book;
	}
	public static int maxsqno() {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = -1;
		String sql = "select max(sqno) from book_buytbl";
		try {
			con=DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
			result = rs.getInt(1);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		finally {
			DBCon.close(con, ps, rs);
		}
		return result;
	}
	public static List<bookDTO> readDBList(){
		List<bookDTO> list = new ArrayList<bookDTO>();
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from booklist";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				bookDTO book = new bookDTO();
				book.setBCD(rs.getString(1));
				book.setFCD(rs.getInt(2));
				book.setTITLE(rs.getString(3));
				book.setWRITER(rs.getString(4));
				book.setPUBLISH(rs.getString(5));
				book.setPRICE(rs.getInt(6));
				book.setBCNT(rs.getInt(7));
				list.add(book);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			DBCon.close(con, ps, rs);
		}
		return list;
	}
	public static List<bookDTO> buylist(){
		List<bookDTO> list = new ArrayList<bookDTO>();
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from book_buytbl";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				bookDTO book = new bookDTO();
				book.setTradeno(rs.getString(1));
				book.setSqno(rs.getInt(2));
				book.setBCD(rs.getString(3));
				book.setId(rs.getString(4));
				book.setPRICE(rs.getInt(5));
				book.setBCNT(rs.getInt(6));
				book.setSumprice(rs.getInt(7));
				book.setTg(rs.getString(8));
				book.setBuydate(rs.getDate(9));
				list.add(book);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			DBCon.close(con, ps, rs);
		}
		return list;
	}
	public static List<bookDTO> rentlist(){
		List<bookDTO> list = new ArrayList<bookDTO>();
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from bookrent";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				bookDTO book = new bookDTO();
				book.setId(rs.getString(1));
				book.setName(rs.getString(2));
				book.setTITLE(rs.getString(3));
				book.setRentdate(rs.getDate(4));
				book.setReturndate(rs.getDate(5));
				list.add(book);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			DBCon.close(con, ps, rs);
		}
		return list;
	}
	public static List<bookDTO> returnlist(){
		List<bookDTO> list = new ArrayList<bookDTO>();
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from bookreturn";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				bookDTO book = new bookDTO();
				book.setId(rs.getString(1));
				book.setName(rs.getString(2));
				book.setTITLE(rs.getString(3));
				book.setRentdate(rs.getDate(4));
				book.setReturndate(rs.getDate(5));
				list.add(book);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			DBCon.close(con, ps, rs);
		}
		return list;
	}
	public static int insertDB(bookDTO book) {
		int result =-1;
		Connection con =null;
		PreparedStatement ps = null;
		String query = "insert into booklist values(?,?,?,?,?,?,?)";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(query);
			ps.setString(1, book.getBCD());
			ps.setInt(2, book.getFCD());
			ps.setString(3, book.getTITLE());
			ps.setString(4, book.getWRITER());
			ps.setString(5, book.getPUBLISH());
			ps.setInt(6, book.getPRICE());
			ps.setInt(7, book.getBCNT());
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBCon.close(con, ps, null);
		}
		return result;
	}
	public static int insertbuy(bookDTO book) {
		int result =-1;
		Connection con =null;
		PreparedStatement ps = null;
		String query = "insert into book_buytbl (tradeno,sqno,bcd,id,price,bcnt,sumprice,tg) values(?,?,?,?,?,?,?,?)";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(query);
			ps.setString(1, book.getTradeno());
			ps.setInt(2, book.getSqno());
			ps.setString(3, book.getBCD());
			ps.setString(4, book.getId());
			ps.setInt(5, book.getPRICE());
			ps.setInt(6, book.getBCNT());
			ps.setInt(7, book.getSumprice());
			ps.setString(8, book.getTg());
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBCon.close(con, ps, null);
		}
		return result;
	}
	public static int deleteDB(String bcd) {
		int result = -1;
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "delete booklist where bcd = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, bcd);
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBCon.close(con, ps, null);
		}
		return result;
	}
	public static int returnbook(String id,String title) {
		int result = -1;
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "delete bookrent where id = ? and title=?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, title);
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBCon.close(con, ps, null);
		}
		return result;
	}
	public static int updateDB(bookDTO book) {
		int result = -1;
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "update booklist set fcd=?, title=?,writer=?,publish=?,price=?,bcnt=? where bcd = ?";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, book.getFCD());
			ps.setString(2, book.getTITLE());
			ps.setString(3, book.getWRITER());
			ps.setString(4, book.getPUBLISH());
			ps.setInt(5, book.getPRICE());
			ps.setInt(6, book.getBCNT());
			ps.setString(7, book.getBCD());
			result = ps.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			DBCon.close(con, ps, null);
		}
		return result;
	}
	public static String idcheck(String userId) {
		Connection con = null;
		Statement stmt =null;
		try {
			con =DBCon.getCon();
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select id from jakpumuser where id ='"+userId+"'");
			if(rs.next()) {
				String id = rs.getString(1);
				return id;
			}
		}
			catch(Exception ex) {
				ex.printStackTrace();
			}
		return null;
	}
	public static String titlecheck(String title) {
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		String sql = "select title from booklist where title = '"+title+"'";
		try {
			con =DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				String readtitle = rs.getString(1);
				return readtitle;
			}
		}
			catch(Exception ex) {
				ex.printStackTrace();
			}
			finally {
				DBCon.close(con, ps, rs);
			}
		return null;
	}
	public static int pricecheck(String title) {
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		int price = 0;
		String sql = "select price from booklist where title = '"+title+"'";
		try {
			con =DBCon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				price = rs.getInt(1);
				return price;
			}
		}
			catch(Exception ex) {
				ex.printStackTrace();
			}
			finally {
				DBCon.close(con, ps, rs);
			}
		return price;
	}
	public static int rentinsert(String id, String name, String title) {
		int result =-1;
		Connection con =null;
		PreparedStatement ps = null;
		String query = "insert into bookrent (id,name,title) values(?,?,?)";
		try {
			con = DBCon.getCon();
			ps = con.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, title);
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBCon.close(con, ps, null);
		}
		return result;
	}
}

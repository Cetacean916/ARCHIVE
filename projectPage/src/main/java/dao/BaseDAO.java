package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.BoardVO;
import dto.LoginVO;
import util.DBmanager;

public class BaseDAO {
	
	private static BaseDAO inst = new BaseDAO();
	
	private BaseDAO() {};
	
	public static BaseDAO getInst() {
		return inst;
	}
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public LoginVO login(String id, String pw) {
		LoginVO vo = null;
		String sql = "select * from member where id=? and pw = ?";
		
		try {
			con = DBmanager.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				vo = new LoginVO();
				
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBmanager.close(con, ps, rs);
		}
		
		return vo;
	}
	
	public void joinUs(String id, String pw, String name) {
		String sql = "insert into member values(?,?,?)";
		
		try {
			con = DBmanager.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, name);
			
			int a = ps.executeUpdate();
			
			if(a!=0) {
				System.out.println("가입 성공");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBmanager.close(con, ps);
		}
	}
	
	public ArrayList<BoardVO> boardList(){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		String sql ="select * from talk order by num";
		
		try {
			con = DBmanager.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				
				vo.setNum(rs.getInt("num"));
				vo.setTitle(rs.getString("title"));
				vo.setWriter(rs.getString("writer"));
				vo.setRegdate(rs.getDate("regdate"));
				vo.setCnt(rs.getInt("cnt"));
				vo.setContent(rs.getString("content"));
				
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBmanager.close(con, ps, rs);
		}
		
		return list;
	}
	
	public void write(String title, String writer, String content) {
		String sql = "insert into talk(num, title,writer,content)"
				+ "values ((select nvl(max(num),0)+1 from talk), ?, ?, ?)";
		
		try {
			con = DBmanager.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, writer);
			ps.setString(3, content);
			
			int a = ps.executeUpdate();
			
			if(a!=0) {
				System.out.println("업데이트 성공");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public BoardVO boardDetail(String num) {
		BoardVO vo = new BoardVO();
		
		String sql="select * from talk where num =?";
		
		try {
			con = DBmanager.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(num));
			rs = ps.executeQuery();
			
			while(rs.next()) {
				vo.setNum(rs.getInt("num"));
				vo.setTitle(rs.getString("title"));
				vo.setWriter(rs.getString("writer"));
				vo.setRegdate(rs.getDate("regdate"));
				vo.setCnt(rs.getInt("cnt"));
				vo.setContent(rs.getString("content"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBmanager.close(con, ps, rs);
		}
		return vo;
	}
}

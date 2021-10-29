package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.ArtistVO;
import dto.GalleryVO;
import dto.MusicVO;
import util.DBmanager;

public class MultiDAO {
	private static MultiDAO inst = new MultiDAO();
	
	private MultiDAO() {};
	
	public static MultiDAO getInst() {
		return inst;
	}
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public ArrayList<ArtistVO> History() {
		ArrayList<ArtistVO> list = new ArrayList<ArtistVO>();
		
		String sql = "select * from artist where category = 'history'";
		
		try {
			con = DBmanager.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ArtistVO vo = new ArtistVO();
				vo.setHistory(rs.getString("history"));
				
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBmanager.close(con, ps, rs);
		}
		
		return list;
	}
	
	public ArrayList<ArtistVO> award() {
		ArrayList<ArtistVO> list = new ArrayList<ArtistVO>();
		
		String sql = "select * from artist where category = 'award'";
		
		try {
			con = DBmanager.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ArtistVO vo = new ArtistVO();
				vo.setAward(rs.getString("award"));
				
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBmanager.close(con, ps, rs);
		}
		
		return list;
	}
	
	public ArrayList<MusicVO> albumDetail(String num){
		ArrayList<MusicVO> list = new ArrayList<MusicVO>();
		String sql = "select * from album where num=?";
		
		try {
			con = DBmanager.getConnection();
			ps = con.prepareStatement(sql);
			ps.setDouble(1, Double.parseDouble(num));
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MusicVO vo = new MusicVO();
				
				vo.setNum(rs.getDouble(1));
				vo.setTitle(rs.getString(2));
				vo.setImage(rs.getString(3));
				vo.setSong(rs.getString(4));
				vo.setLink(rs.getString(5));
				vo.setRelease(rs.getString(6));
				
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBmanager.close(con, ps, rs);
		}
		
		return list;
	}
	
	public ArrayList<MusicVO> album() {
		String sql = "select * from album";
		ArrayList<MusicVO> list = new ArrayList<MusicVO>();
		
		try {
			con = DBmanager.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MusicVO vo = new MusicVO();
				
				vo.setNum(rs.getDouble(1));
				vo.setTitle(rs.getString(2));
				vo.setImage(rs.getString(3));
				vo.setSong(rs.getString(4));
				vo.setLink(rs.getString(5));
				vo.setRelease(rs.getString(6));
				
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBmanager.close(con, ps, rs);
		}
		
		return list;
	}
	
	public void uploadFile(String img) {
		String sql = "insert into gallery values(?)";
		
		try {
			con = DBmanager.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, img);
			
			int a = ps.executeUpdate();
			
			if(a!=0) {
				System.out.println("업로드 성공");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBmanager.close(con, ps);
		}
	}
	
	public ArrayList<GalleryVO> getPic(int num) {
		ArrayList<GalleryVO> list = new ArrayList<GalleryVO>();
		String sql = "select * from gallery order by pic asc";
		
		try {
			con = DBmanager.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				GalleryVO vo = new GalleryVO();
				vo.setPic(rs.getString("pic"));
				vo.setNum(num+=1);
				
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBmanager.close(con, ps, rs);
		}
		
		return list;
	}
}

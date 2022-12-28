package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.user4vo;

public class user4dao extends DBHelper{
	private static user4dao instance = new user4dao();
	
	public static user4dao getInstance() {
		return instance;
	}
	private user4dao() {}
	
	public void insertUser4(user4vo vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `user4`(`name`, `gender`, `age`, `addr`) values(?,?,?,?)");
			psmt.setString(1, vo.getName());
			psmt.setInt(2, vo.getGender());
			psmt.setInt(3, vo.getAge());
			psmt.setString(4, vo.getAddr());
			psmt.executeUpdate();
			
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
			
		
	}
	public user4vo selectUser4(String seq) {
		user4vo vo = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `user4` where `seq`=?");
			psmt.setString(1, seq);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new user4vo();
				vo.setSeq(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setGender(rs.getInt(3));
				vo.setAge(rs.getInt(4));
				vo.setAddr(rs.getString(5));
			}
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public List<user4vo> selectUser4s() {
		List<user4vo> users = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt =conn.createStatement();
			rs = stmt.executeQuery("select * from `user4`");
			
			while(rs.next()) {
				user4vo vo = new user4vo();
				vo.setSeq(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setGender(rs.getInt(3));
				vo.setAge(rs.getInt(4));
				vo.setAddr(rs.getString(5));
				users.add(vo);
			}
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	public void updateUser4(user4vo vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("update `user4` set `name`=?, `gender`=?, `age`=?, `addr`=? where `seq`=?");
			psmt.setString(1, vo.getName());
			psmt.setInt(2, vo.getGender());
			psmt.setInt(3, vo.getAge());
			psmt.setString(4, vo.getAddr());
			psmt.setInt(5, vo.getSeq());
			psmt.executeUpdate();
			
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteUser4(String seq) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("delete from `user4` where `seq`=?");
			psmt.setString(1, seq);
			psmt.executeUpdate();
			
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

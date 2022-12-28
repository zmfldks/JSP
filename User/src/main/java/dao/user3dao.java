package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.user3vo;

public class user3dao extends DBHelper{
	private static user3dao instance = new user3dao();
	
	public static user3dao getInstance() {
		return instance;
	}
	private user3dao() {}
	
	public void insertUser3(user3vo vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `user3` value (?,?,?,?)");
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getHp());
			psmt.setInt(4, vo.getAge());
			psmt.executeUpdate();
			
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public user3vo selectUser3(String uid) {
		user3vo vo = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `user3` where `uid`=?");
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new user3vo();
				vo.setUid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setHp(rs.getString(3));
				vo.setAge(rs.getInt(4));
			}
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public List<user3vo> selectUser3s() {
		List<user3vo> users = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `user3`");
			
			while(rs.next()) {
				user3vo vo = new user3vo();
				vo.setUid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setHp(rs.getString(3));
				vo.setAge(rs.getInt(4));
				users.add(vo);
			}
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	
	public void updateUser3(user3vo vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("update `user3` set `name`=?, `hp`=?, `age`=? where `uid`=?");
			psmt.setString(1, vo.getName());
			psmt.setString(2, vo.getHp());
			psmt.setInt(3, vo.getAge());
			psmt.setString(4, vo.getUid());
			psmt.executeUpdate();
			
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteUser3(String uid) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("delete from `user3` where `uid`=?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}

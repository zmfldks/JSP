package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.user1vo;

public class User1dao extends DBHelper{
	
	private static User1dao instance = new User1dao();
	
	public static User1dao getInstance() {
		return instance;
	}
	private User1dao() {}
	
	public void insertUser1(user1vo vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `user1` value (?,?,?,?)");
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
	
	public user1vo selectUser1(String uid) {
		user1vo vo = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `user1` where `uid`=?");
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new user1vo();
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
	
	public List<user1vo> selectUser1s() {
		List<user1vo> users = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `user1`");
			
			while(rs.next()) {
				user1vo vo = new user1vo();
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
	public void updateUser1(user1vo vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("update `user1` set `name`=?, `hp`=?, `age`=? where `uid`=?");
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
	public void deleteUser1(String uid) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("delete from `user1` where `uid=?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}

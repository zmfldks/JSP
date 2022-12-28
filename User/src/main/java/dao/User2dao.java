package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.user2vo;

public class User2dao extends DBHelper{
	
	private static User2dao instance = new User2dao();
	
	public static User2dao getInstance() {
		return instance;
	}
	private User2dao() {}
	
	public void insertUser2(user2vo vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `user2` value (?,?,?,?)");
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
	
	public user2vo selectUser2(String uid) {
		user2vo vo = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `user2` where `uid`=?");
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new user2vo();
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
	
	public List<user2vo> selectUser2s() {
		List<user2vo> users = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `user2`");
			
			while(rs.next()) {
				user2vo vo = new user2vo();
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
	public void updateUser2(user2vo vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("update `user2` set `name`=?, `hp`=?, `age`=? where `uid`=?");
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
	
	public void deleteUser2(String uid) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("delete from `user2` where `uid`=?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}

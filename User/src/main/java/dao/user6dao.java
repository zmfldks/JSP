package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.user6vo;

public class user6dao extends DBHelper{
	private static user6dao instance = new user6dao();
	public static user6dao getInstance() {
		return instance;
	}
	private user6dao() {}
	
	public void insertUser6(user6vo vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `user6` value (?,?,?,?,?,?,?)");
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getBirth());
			psmt.setInt(4, vo.getGender());
			psmt.setInt(5, vo.getAge());
			psmt.setString(6, vo.getAddr());
			psmt.setString(7, vo.getHp());
			psmt.executeUpdate();
			
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public user6vo selectUser6(String uid) {
		user6vo vo = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `user6` where `uid`=?");
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new user6vo();
				vo.setUid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setBirth(rs.getString(3));
				vo.setGender(rs.getInt(4));
				vo.setAge(rs.getInt(5));
				vo.setAddr(rs.getString(6));
				vo.setHp(rs.getString(7));
			}
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public List<user6vo> selectUser6s() {
		List<user6vo> users = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `user6`");
			
			while(rs.next()) {
				user6vo vo = new user6vo();
				vo.setUid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setBirth(rs.getString(3));
				vo.setGender(rs.getInt(4));
				vo.setAge(rs.getInt(5));
				vo.setAddr(rs.getString(6));
				vo.setHp(rs.getString(7));
				users.add(vo);
			}
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	
	public void updateUser6(user6vo vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("update `user6` set `name`=?, `birth`=?, `gender`=?, `age`=?, `addr`=?, `hp`=? where `uid`=?");
			psmt.setString(1, vo.getName());
			psmt.setString(2, vo.getBirth());
			psmt.setInt(3, vo.getGender());
			psmt.setInt(4, vo.getAge());
			psmt.setString(5, vo.getAddr());
			psmt.setString(6, vo.getHp());
			psmt.setString(7, vo.getUid());
			psmt.executeUpdate();
			
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteUser6(String uid) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("delete from `user6` where `uid`=?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
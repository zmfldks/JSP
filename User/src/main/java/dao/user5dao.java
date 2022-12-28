package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.user5vo;

public class user5dao extends DBHelper{
	private static user5dao instance = new user5dao();
	public static user5dao getInstance() {
		return instance;
	}
	private user5dao() {}
	
	public void insertUser5(user5vo vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `user5` value(?,?,?,?,?,?,?)");
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
	
	public void selectUser5() {}
	
	public List<user5vo> selectUser5s() {
		List<user5vo> users = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `user5`");
			
			while(rs.next()) {
				user5vo vo = new user5vo();
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
	public void updateUser5() {}
	public void deleteUser5() {}
	
}

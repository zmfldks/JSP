package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.User6VO;

public class User6DAO extends DBHelper{
	private static User6DAO instance = new User6DAO();
	public static User6DAO getInstance () {
		return instance;
	}
	private User6DAO() {}
	
	public void insertUser6() {}
	public void selectUser6() {}
	
	public List<User6VO> selectUser6s() {
		List<User6VO> users = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `user6`");
			
			while(rs.next()) {
				User6VO vo = new User6VO();
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
	
	public void updateUser6() {}
	public void deleteUser6() {}
}

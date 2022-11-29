package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.User2VO;

public class User2DAO extends DBHelper{
	
	private static User2DAO instance = new User2DAO();
	public static User2DAO getInstance() {
		return instance;
	}
	private User2DAO() {}
	
	public void insertUser2() {} 
	public void selectUser2() {} 
	
	public List<User2VO> selectUser2s() {
		List<User2VO> users = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `user2`");
			
			while(rs.next()) {
				User2VO vo = new User2VO();
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
	
	public void updateUser2() {} 
	public void deleteUser2() {} 
	
}

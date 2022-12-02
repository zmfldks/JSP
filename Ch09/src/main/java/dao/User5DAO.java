package dao;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBHelper;

public class User5DAO extends DBHelper{
	private static User5DAO instance = new User5DAO();
	public static User5DAO getInstance() {
		return instance;
	}
	
	private User5DAO() {}
	
	public void insertUser5() {}
	public void selectUser5() {}
	public void selectUser5s() {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `user5`");
			psmt.setString(1, null);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateUser5() {}
	public void deleteUser5() {}
}

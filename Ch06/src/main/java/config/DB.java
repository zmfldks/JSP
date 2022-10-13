package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
	
	private static DB instance = new DB();
	public static DB getInstance() {
		return instance;
	}
	private DB() {}
	// 데이터베이스 처리
		String host = "jdbc:mysql://127.0.0.1:3306/java2_college";
		String user = "root";
		String pass = "1234";
		
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(host, user, pass);
	}
}
